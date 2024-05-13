<script setup>
import favoriteCard from './favorite-main-card.vue'
</script>

<template>
  <div id="our" class="py-20">
    <div class="mx-auto max-w-7xl px-6 pb-20">
      <div class="mx-auto max-w-2xl text-center">
        <p class="mt-2 text-4xl font-bold tracking-tight text-gray-900">Our Favourites</p>
        <p class="mt-6 text-lg leading-8 text-gray-600">
          A carefully selected list of our favourite dishes which are enjoyed by the whole Astana
        </p>
      </div>
    </div>
    <div class="grid grid-cols-4 gap-4 px-20">
      <favoriteCard
        title="Coq au Vin Rouge"
        description="Chicken cooked in red wine with mushrooms, onions, and bacon, tender and flavorful."
        image-u-r-l="/dish-5.png"
      />
      <favoriteCard
        title="Bouillabaisse Provençale"
        description="A rich fish stew with saffron, tomatoes, and herbs, a specialty of Provence."
        image-u-r-l="/dish2.png"
      />
      <favoriteCard
        title="Ratatouille Niçoise"
        description="A colorful vegetable stew with tomatoes, zucchini, eggplant, and bell peppers, bursting with flavor"
        image-u-r-l="/dish-3 1.png"
      />
      <favoriteCard
        title="Cassoulet Toulousain"
        description="Hearty stew with white beans, duck confit, sausage, and pork, slow-cooked for exquisite taste "
        image-u-r-l="/dish-4.png"
      />
    </div>
  </div>
</template>
