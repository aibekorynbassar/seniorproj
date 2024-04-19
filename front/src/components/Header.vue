<script setup>
defineProps({
  totalPrice: Number
})

const emit = defineEmits('openDrawer')
</script>

<template>
  <header class="flex justify-between border-b border-slate-100 px-10 py-8">
    <div class="flex items-center gap-4">
      <img src="/ff/123.webp" alt="logo" class="w-10" />
      <div>
        <h2 class="text-xl fonst-bold uppercase">Vue Fast Food</h2>
        <p class="text-slate-400">The best fast food store</p>
      </div>
    </div>

    <ul class="flex items-center gap-10">
      <li
        @click="() => emit('openDrawer')"
        class="flex items-center cursor-pointer gap-3 text-gray-400 hover:text-black"
      >
        <img src="/cart.svg" alt="cart" />
        <b>{{ totalPrice }} ₸</b>
      </li>

      <li class="flex items-center cursor-pointer gap-3 text-gray-400 hover:text-black">
        <img src="/heart.svg" alt="cart" />
        <span>Liked</span>
      </li>

      <li class="flex items-center cursor-pointer gap-3 text-gray-400 hover:text-black">
        <img src="/profile.svg" alt="cart" />
        <a href="http://localhost:8080/users">Profile</a>
      </li>
    </ul>
  </header>
</template>
