<script setup></script>

<template>
  <header class="inset-x-0 top-0 z-50">
    <nav class="flex items-center justify-between p-6 px-8" aria-label="Global">
      <div class="flex">
        <a href="#" class="-m-1.5 p-1.5">
          <span class="sr-only">Your Company</span>
          <img class="h-20 w-auto" src="/logo.webp" alt="" />
        </a>
      </div>

      <div class="flex justify-center gap-x-40">
        <RouterLink to="/"
          ><a class="text-sm font-semibold leading-6 text-gray-900">Home</a></RouterLink
        >
        <RouterLink to="/menu"
          ><a class="text-sm font-semibold leading-6 text-gray-900">Menu</a></RouterLink
        >
        <a class="text-sm font-semibold leading-6 text-gray-900">Contact</a>
      </div>
      <div class="flex justify-end">
        <a href="http://localhost:8080/users" class="text-sm font-semibold leading-6 text-gray-900"
          >Admin page <span aria-hidden="true">&rarr;</span></a
        >
      </div>
    </nav>
  </header>
</template>
