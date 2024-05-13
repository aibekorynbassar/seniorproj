<script setup>
defineProps({
  title: String,
  descritpion: String,
  imageUrl: String
})
</script>

<template>
  <div class="flex flex-col items-center text-center w-72 mx-auto">
    <img height="100" width="100" :src="imageUrl" alt="info_image" />
    <h2 class="text-2xl font-medium mt-4">{{ title }}</h2>
    <p class="text-slate-400 mt-2">{{ descritpion }}</p>
  </div>
</template>
