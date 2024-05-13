<script setup>
const posts = [
  {
    id: 1,
    title: 'Exquisite Culinary Symphony',
    description:
      'The ambiance was delightful, the service impeccable, and each dish was a masterpiece of flavor and presentation. A truly exceptional dining experience, highly recommended for any food enthusiast!',
    date: 'June 13, 2023',
    category: { title: 'Marketing', href: '#' },
    author: {
      name: 'Juliette Dubois',
      imageUrl: '/profile.svg'
    }
  },
  {
    id: 2,
    title: 'Elegant Dining Gem',
    description:
      'The culinary journey at this restaurant was unparalleled; every bite was a symphony of taste. Kudos to the chef and staff for creating such a memorable dining affair!',
    date: 'Mar 20, 2022',
    category: { title: 'Marketing', href: '#' },
    author: {
      name: 'Lucas Reynard',
      imageUrl: '/profile.svg'
    }
  },
  {
    id: 3,
    title: 'Gourmet Excellence',
    description:
      'The restaurant exudes elegance, and the cuisine is simply outstanding. From appetizers to desserts, each dish surpassed expectations. A culinary gem worth revisiting! ',
    date: 'May 10, 2021',
    category: { title: 'Marketing', href: '#' },
    author: {
      name: 'Amélie Bergeron',
      imageUrl: '/profile.svg'
    }
  }

  // More posts...
]
</script>

<template>
  <div class="py-24">
    <div class="mx-auto max-w-7xl px-6">
      <div class="max-w-2xl mx-0">
        <h2 class="text-3xl font-bold tracking-tight text-gray-900 text-4xl">
          Our Happy Customers
        </h2>
        <p class="mt-2 text-lg leading-8 text-gray-600">
          Guests and residents of Astana enjoy our unique cuisine and friendly service
        </p>
      </div>
      <div
        class="mx-auto mt-10 grid max-w-2xl grid-cols-1 gap-x-8 gap-y-16 border-t border-gray-200 pt-10 mt-16 pt-16 lg:mx-0 lg:max-w-none lg:grid-cols-3"
      >
        <article
          v-for="post in posts"
          :key="post.id"
          class="flex max-w-xl flex-col items-start justify-between"
        >
          <div class="flex items-center gap-x-4 text-xs">
            <time :datetime="post.datetime" class="text-gray-500">{{ post.date }}</time>
          </div>
          <div class="group relative">
            <h3 class="mt-3 text-lg font-semibold leading-6 text-gray-900">
              <span class="absolute inset-0" />
              {{ post.title }}
            </h3>
            <p class="mt-5 line-clamp-3 text-sm leading-6 text-gray-600">
              {{ post.description }}
            </p>
          </div>
          <div class="relative mt-8 flex items-center gap-x-4">
            <img :src="post.author.imageUrl" alt="" class="h-10 w-10 rounded-full bg-gray-50" />
            <div class="text-sm leading-6">
              <p class="font-semibold text-gray-900">
                <a :href="post.author.href">
                  <span class="absolute inset-0" />
                  {{ post.author.name }}
                </a>
              </p>
            </div>
          </div>
        </article>
      </div>
    </div>
  </div>
</template>
