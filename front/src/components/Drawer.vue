<script setup>
import infoBlock from './infoBlock.vue'
import DrawerHead from './DrawerHead.vue'
import CartItemList from './CartItemList.vue'

defineProps({
  totalPrice: Number,
  cartButtonDisabled: Boolean
})

const emit = defineEmits('createOrder')
</script>

<template>
  <div class="fixed top-0 left-0 h-full w-full bg-black z-10 opacity-70"></div>
  <div class="bg-white w-96 h-full fixed right-0 top-0 z-20 p-10">
    <DrawerHead />

    <div v-if="!totalPrice" class="flex h-full items-center">
      <infoBlock
        title="The cart is empty"
        imageUrl="/package-icon.png"
        descritpion="Add some sneakers to the cart and put some dick in your mama's mouth"
      />
    </div>

    <CartItemList />

    <div v-if="totalPrice" class="flex flex-col gap-5 mb-6 mt-6">
      <div class="flex gap-2">
        <span>Total:</span>
        <div class="flex-1 border-b border-dashed"></div>
        <b>{{ totalPrice }} usd</b>
      </div>

      <button
        @click="() => emit('createOrder')"
        :disabled="cartButtonDisabled"
        class="mt-4 bg-lime-500 rounded-xl border w-full py-4 text-white disabled:bg-slate-300 hover:bg-lime-600 active:bg-lime-700 cursor-pointer"
      >
        Make a Purachase
      </button>
    </div>
  </div>
</template>
