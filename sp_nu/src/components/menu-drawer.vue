<script setup>
import axios from 'axios'
import { ref, inject, computed } from 'vue'
import menuDrawerHeader from './menu-drawer-header.vue'
import menuDrawerList from './menu-drawer-list.vue'
import drawerInfoblock from './drawer-infoblock.vue'

const props = defineProps({
  totalPrice: Number
})

const isCreeatingOrder = ref(false)
const orderId = ref(null)

const { cart } = inject('cart')

const createOrder = async () => {
  try {
    isCreeatingOrder.value = true
    const { data } = await axios.post(`https://08e636163cffaac9.mokky.dev/orders`, {
      items: cart.value,
      totalPrice: props.totalPrice.value
    })

    cart.value = []
    orderId.value = data.id
    return data
  } catch (err) {
    console.log(err)
  } finally {
    isCreeatingOrder.value = false
  }
}

const cartIsEmpty = computed(() => cart.value.length === 0)
const cartButtonDisabled = computed(() => isCreeatingOrder.value || cartIsEmpty.value)
</script>

<template>
  <div class="fixed top-0 left-0 h-full w-full bg-black z-10 opacity-70"></div>
  <div class="bg-white w-96 h-full fixed right-0 top-0 z-20 p-10">
    <menuDrawerHeader />

    <div v-if="!totalPrice || orderId" class="flex h-full items-center">
      <drawerInfoblock
        v-if="!totalPrice && !orderId"
        title="The cart is empty"
        imageUrl="/package-icon.png"
        descritpion="Please add your desired food items to the cart to proceed with your purchase."
      />

      <drawerInfoblock
        v-if="orderId"
        title="The purchased was made"
        imageUrl="/order-success-icon.png"
        :descritpion="`Your purchase with id #${orderId} was made and we will contact you soon`"
      />
    </div>

    <menuDrawerList />

    <div v-if="totalPrice" class="flex flex-col gap-5 mb-6 mt-6">
      <div class="flex gap-2">
        <span>Total:</span>
        <div class="flex-1 border-b border-dashed"></div>
        <b>{{ totalPrice }} usd</b>
      </div>

      <button
        @click="createOrder"
        :disabled="cartButtonDisabled"
        class="mt-4 bg-gray-500 rounded-xl border w-full py-4 text-white disabled:bg-slate-300 hover:bg-gray-600 active:bg-gray-700 cursor-pointer"
      >
        Make a Purachase
      </button>
    </div>
  </div>
</template>
