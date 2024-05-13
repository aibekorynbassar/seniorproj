<script setup>
import mainFavorite from '../components/favorite-main.vue'
import mainCustomers from '../components/customers-main.vue'
import mainFooter from '../components/footer-main.vue'
import mainWelcome from '../components/welcome-main.vue'
import mainAbout from '../components/about-main.vue'
</script>

<template>
  <mainAbout />

  <div class="bg-gray-100">
    <mainFavorite />
    <mainWelcome />
    <mainCustomers />
  </div>

  <mainFooter />
</template>

<style scoped></style>
