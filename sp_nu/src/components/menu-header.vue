<script setup>
defineProps({
  totalPrice: Number
})

const emit = defineEmits('openDrawer')
</script>

<template>
  <div class="flex items-baseline justify-between border-b border-gray-200 pb-6 pt-6">
    <h1 class="text-4xl font-bold tracking-tight text-gray-900">{{ $route.meta.title }}</h1>
    <div>
      <ul class="flex items-center gap-10">
        <li
          @click="() => emit('openDrawer')"
          class="flex items-center cursor-pointer gap-3 text-gray-400 hover:text-black"
        >
          <img src="/cart.svg" alt="cart" />
          <b>{{ totalPrice }} kzt</b>
        </li>

        <li class="flex items-center cursor-pointer gap-3 text-gray-400 hover:text-black">
          <RouterLink to="/favorite"> <img src="/heart.svg" alt="cart" /></RouterLink>
          <span>Liked</span>
        </li>
      </ul>
    </div>
  </div>
</template>
