<script setup>
import { onMounted, ref, watch, reactive, provide, computed } from 'vue'
import axios from 'axios'

import Header from './components/Header.vue'
import CardList from './components/CardList.vue'
import Drawer from './components/Drawer.vue'

const items = ref([])
const cart = ref([])
const isCreeatingOrder = ref(false)
const drawerOpen = ref(false)

const totalPrice = computed(() => cart.value.reduce((acc, item) => acc + item.price, 0))

const cartIsEmpty = computed(() => cart.value.length === 0)
const cartButtonDisabled = computed(() => isCreeatingOrder.value || cartIsEmpty.value)

const closeDrawer = () => {
  drawerOpen.value = false
}

const openDrawer = () => {
  drawerOpen.value = true
}

const filters = reactive({
  sortBy: 'title',
  searchQuerry: ''
})

const addToCart = (item) => {
  cart.value.push(item)
  item.isAdded = true
}

const removeFromCart = (item) => {
  cart.value.splice(cart.value.indexOf(item), 1)
  item.isAdded = false
}

const createOrder = async () => {
  try {
    isCreeatingOrder.value = true
    const { data } = await axios.post(`https://08e636163cffaac9.mokky.dev/orders`, {
      items: cart.value,
      totalPrice: totalPrice.value
    })

    cart.value = []
    return data
  } catch (err) {
    console.log(err)
  } finally {
    isCreeatingOrder.value = false
  }
}

const onlClickAddPlus = async (item) => {
  if (!item.isAdded) {
    addToCart(item)
  } else {
    removeFromCart(item)
  }
  console.log(cart)
}

const onChangeInput = (event) => {
  filters.searchQuerry = event.target.value
}
const onChangeSelect = (event) => {
  filters.sortBy = event.target.value
}

const fetchFavorites = async () => {
  try {
    const { data: favorites } = await axios.get(`https://08e636163cffaac9.mokky.dev/favorites`)

    items.value = items.value.map((item) => {
      const favorite = favorites.find((favorite) => favorite.parentId === item.id)

      if (!favorite) {
        return item
      }
      return {
        ...item,
        isFavorite: true,
        favoriteId: favorite.id
      }
    })
  } catch (err) {
    console.log(err)
  }
}

const addToFavorites = async (item) => {
  try {
    item.isFavorite = !item.isFavorite
    if (item.isFavorite) {
      const obj = {
        parentId: item.id
      }
      const { data } = await axios.post(`https://08e636163cffaac9.mokky.dev/favorites`, obj)

      item.favoriteId = data.id

      console.log(data)
    } else {
      await axios.delete(`https://08e636163cffaac9.mokky.dev/favorites/${item.favoriteId}`)
      item.favoriteId = null
    }
  } catch (err) {
    console.log(err)
  }
}

const fetchItems = async () => {
  try {
    const params = {
      sortBy: filters.sortBy
    }

    if (filters.searchQuerry) {
      params.title = `*${filters.searchQuerry}*`
    }
    const { data } = await axios.get(`http://localhost:8080/foods/api`, {
      params
    })
    items.value = data.map((obj) => ({
      ...obj,
      isFavorite: false,
      favoriteId: null,
      isAdded: false
    }))
  } catch (err) {
    console.log(err)
  }
}

onMounted(async () => {
  await fetchItems()
  await fetchFavorites()
})
watch(filters, fetchItems)

watch(cart, () => {
  items.value = items.value.map((item) => ({
    ...item,
    isAdded: false
  }))
})

provide('cart', {
  cart,
  closeDrawer,
  openDrawer,
  addToCart,
  removeFromCart
})
</script>

<template>
  <Drawer
    v-if="drawerOpen"
    :total-price="totalPrice"
    @createOrder="createOrder"
    :cart-button-disabled="cartButtonDisabled"
  />
  <div class="bg-white w-4/5 m-auto rounded-xl shadow-xl mt-10">
    <Header :total-price="totalPrice" @openDrawer="openDrawer" />

    <div class="p-10">
      <div class="flex justify-between items-center">
        <h2 class="text-3xl font-bold mb-10">All fast food you can find</h2>

        <div class="flex gap-4">
          <select
            @change="onChangeSelect"
            class="py-2 px-3 border rounded-md outline-none"
            name=""
            id=""
          >
            <option value="name">By name</option>
            <option value="price">By price (cheap)</option>
            <option value="-price">By price (expensive)</option>
          </select>
          <div class="relative">
            <img class="absolute left-4 top-3" src="/search.svg" alt="" />
            <input
              @input="onChangeInput"
              type="text"
              placeholder="Search"
              class="border rounded-md py-2 pl-11 pr-4 outline-none focus:border-gray-400"
            />
          </div>
        </div>
      </div>
      <div class="mt-10">
        <CardList
          :items="items"
          @addToFavorites="addToFavorites"
          @onlClickAddPlus="onlClickAddPlus"
        />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
