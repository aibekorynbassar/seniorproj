<script setup>
defineProps({
  id: Number,
  imageUrl: String,
  text: String,
  price: Number,
  isAdded: Boolean,
  isFavorite: Boolean,
  onClickFavorite: Function,
  onClickAdd: Function
})
</script>

<template>
  <div
    class="relative bg-white border border-slate-100 rounded-3xl p-8 cursor-pointer transition hover:-translate-y-2 hover:shadow-xl"
  >
    <img
      :src="isFavorite ? '/like-2.svg' : '/like-1.svg'"
      alt="Like 1"
      class="absolute top-8 left-8"
      @click="onClickFavorite"
    />
    <img class="m-auto" :src="imageUrl" alt="Sneaker" />
    <p class="mt-2">{{ text }}</p>

    <div class="flex justify-between mt-5">
      <div class="flex flex-col">
        <span class="text-slate-400">The Price:</span>
        <b>{{ price }} ₸</b>
      </div>
      <img @click="onClickAdd" :src="!isAdded ? '/plus.svg' : '/checked.svg'" alt="Plus" />
    </div>
  </div>
</template>
