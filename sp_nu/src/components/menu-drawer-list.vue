<script setup>
import { inject } from 'vue'
import menuDrawerListCard from './menu-drawer-list-card.vue'

const { cart, removeFromCart } = inject('cart')
</script>

<template>
  <div class="flex flex-col flex-1 gap-4" v-auto-animate>
    <menuDrawerListCard
      v-for="item in cart"
      :key="item.id"
      :title="item.title"
      :id="item.id"
      :text="item.title"
      :price="item.price"
      :image-url="item.imageUrl"
      @on-click-remove="() => removeFromCart(item)"
    />
  </div>
</template>
