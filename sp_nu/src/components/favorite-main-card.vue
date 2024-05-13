<script setup>
defineProps({
  imageURL: String,
  title: String,
  description: String
})
</script>

<template>
  <div class="bg-white py-24 rounded-lg relative hover:shadow-2xl">
    <div class="mx-auto max-w-7xl px-6 lg:px-8">
      <div class="mx-auto max-w-2xl text-center">
        <img class="h-52 absolute inset-x-0 -top-10 mx-auto" :src="imageURL" alt="" />
        <h2 class="pt-20 font-bold tracking-t ight text-gray-900 text-2xl">{{ title }}</h2>
        <p class="mt-6 text-lg leading-8 text-gray-600">
          {{ description }}
        </p>
      </div>
    </div>
  </div>
</template>
