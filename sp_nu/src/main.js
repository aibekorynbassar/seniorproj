import './assets/main.css'

import { createRouter, createWebHistory } from 'vue-router'

import { createApp } from 'vue'
import { autoAnimatePlugin } from '@formkit/auto-animate/vue'
import App from './App.vue'

import Home from './pages/home-page.vue'
import Menu from './pages/menu-page.vue'
import Favorite from './pages/favorite-page.vue'

const app = createApp(App)

const routes = [
  { path: '/', name: 'homePage', component: Home },
  { path: '/menu', name: 'menuPage', component: Menu, meta: { title: 'Menu' } },
  { path: '/favorite', name: 'favortiesPage', component: Favorite, meta: { title: 'Favorites' } }
]
const router = createRouter({
  history: createWebHistory(),
  routes
})

app.use(router)
app.use(autoAnimatePlugin)
app.mount('#app')
