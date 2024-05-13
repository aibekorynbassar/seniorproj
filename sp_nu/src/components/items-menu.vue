<script setup>
import itemsMenuCard from './items-menu-card.vue'

defineProps({
  items: Array,
  isFavorites: Boolean
})

const emit = defineEmits(['addToFavorites, onlClickAddPlus'])
</script>

<template>
  <div
    class="p-10 bg-gray-100 rounded-lg flex-auto grid gap-x-8 gap-y-10 grid-cols-4"
    v-auto-animate
  >
    <itemsMenuCard
      v-for="item in items"
      :key="item.id"
      :id="item.id"
      :text="item.title"
      :price="item.price"
      :image-url="item.imageUrl"
      :onClickFavorite="isFavorites ? null : () => emit('addToFavorites', item)"
      :onClickAdd="isFavorites ? null : () => emit('onlClickAddPlus', item)"
      :isFavorite="item.isFavorite"
      :isAdded="item.isAdded"
    />
  </div>
</template>
