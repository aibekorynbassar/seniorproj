<template>
  <div class="pt-14 pb-14 px-8">
    <div class="flex items-center justify-center gap-10 py-15">
      <div class="text-center max-w-2xl">
        <h1 class="text-4xl font-bold tracking-tight text-gray-900 text-6xl">
          Best food in Astana. Delivered right to you
        </h1>
        <p class="mt-6 text-lg leading-8 text-gray-600">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
          ut labore et dolore magna aliqua.
        </p>
        <div class="mt-10 flex items-center justify-center gap-x-6">
          <RouterLink to="/menu">
            <a
              href="#"
              class="rounded-md bg-gray-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-gray-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
              >Menu</a
            ></RouterLink
          >
          <a href="our" class="text-sm font-semibold leading-6 text-gray-900">Special dishes</a>
        </div>
      </div>
      <div class="relative">
        <img class="rounded-lg h-96" src="/about.png" alt="" />
        <img class="absolute h-40 -left-4 -bottom-4" src="/dish1.png" alt="" />
      </div>
    </div>
  </div>
</template>
