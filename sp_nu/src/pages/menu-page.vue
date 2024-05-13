<script setup>
import { onMounted, ref, watch, reactive, provide, computed } from 'vue'
import axios from 'axios'

import itemsMenu from '../components/items-menu.vue'
import menuHeader from '../components/menu-header.vue'
import menuDrawer from '../components/menu-drawer.vue'

const items = ref([])
const cart = ref([])
const drawerOpen = ref(false)

const totalPrice = computed(() => cart.value.reduce((acc, item) => acc + item.price, 0))

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
        parentId: item.id,
        item
      }
      const { data } = await axios.post(`https://08e636163cffaac9.mokky.dev/favorites`, obj)//https://08e636163cffaac9.mokky.dev/favorites

      item.favoriteId = data.id
    } else {
      await axios.delete(`https://08e636163cffaac9.mokky.dev/favorites/${item.favoriteId}`)//https://08e636163cffaac9.mokky.dev/favorites/
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
    const { data } = await axios.get(`http://localhost:8080/foods/api`, { //https://08e636163cffaac9.mokky.dev/items
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
  const localCart = localStorage.getItem('cart')
  cart.value = localCart ? JSON.parse(localCart) : []

  await fetchItems()
  await fetchFavorites()

  items.value = items.value.map((item) => ({
    ...item,
    isAdded: cart.value.some((cartItem) => cartItem.id === item.id)
  }))
})
watch(filters, fetchItems)

watch(cart, () => {
  items.value = items.value.map((item) => ({
    ...item,
    isAdded: false
  }))
})

watch(
  cart,
  () => {
    localStorage.setItem('cart', JSON.stringify(cart.value))
  },
  { deep: true }
)

provide('cart', {
  cart,
  closeDrawer,
  openDrawer,
  addToCart,
  removeFromCart
})
</script>
<template>
  <div class="bg-white">
    <div>
      <div class="mx-auto px-20">
        <menuHeader :total-price="totalPrice" @openDrawer="openDrawer" />

        <div class="pb-24 pt-6">
          <div class="flex">
            <div class="w-80">
              <div class="relative mb-4">
                <img class="absolute left-4 top-3" src="/search.svg" alt="" />
                <input
                  @input="onChangeInput"
                  type="text"
                  placeholder="Search"
                  class="border rounded-md py-2 pl-11 pr-4 outline-none focus:border-gray-400"
                />
              </div>

              <select
                @change="onChangeSelect"
                class="w-max py-2 px-3 border rounded-md outline-none"
                name=""
                id=""
              >
                <option value="title">By name</option>
                <option value="price">By price (cheap)</option>
                <option value="-price">By price (expensive)</option>
              </select>
            </div>

            <itemsMenu
              :items="items"
              @addToFavorites="addToFavorites"
              @onlClickAddPlus="onlClickAddPlus"
            />
          </div>
        </div>
      </div>
    </div>
  </div>

  <menuDrawer
    v-if="drawerOpen"
    :total-price="totalPrice"
    :cart-button-disabled="cartButtonDisabled"
  />
</template>
