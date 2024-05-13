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
  <div>
    <div
      class="relative bg-white border border-slate-100 rounded-xl p-8 cursor-pointer transition hover:-translate-y-2 hover:shadow-xl"
    >
      <img
        v-if="onClickFavorite"
        :src="isFavorite ? '/like-2.svg' : '/like-1.svg'"
        alt="Like 1"
        class="absolute top-8 left-8 h-8"
        @click="onClickFavorite"
      />
      <img class="h-56 w-56 m-auto" :src="imageUrl" alt="food" />
      <p class="mt-2">{{ text }}</p>

      <div class="flex justify-between mt-5">
        <div class="flex flex-col">
          <span class="text-slate-400">The Price:</span>
          <b>{{ price }} kzt</b>
        </div>
        <img
          v-if="onClickAdd"
          class="h-10"
          @click="onClickAdd"
          :src="!isAdded ? '/added.svg' : '/not-added.svg'"
          alt="Plus"
        />
      </div>
    </div>
  </div>
</template>
