import { createRouter, createWebHistory } from 'vue-router'
import HomePage from '../views/HomePage.vue'
import CollectPage from '../views/CollectPage.vue'
import HouseResource from '../views/HouseResource.vue'
import HouseType from '../views/HouseType.vue'
import PriceChange from '../views/PriceChange.vue'

const routes = [
  {
    path: '/',
    name: 'HomePage',
    component: HomePage
  },
  {
    path: '/CollectPage',
    name: 'CollectPage',
    component: CollectPage
  },
  {
    path: '/HouseResource',
    name: 'HouseResource',
    component: HouseResource
  },
  {
    path: '/HouseType',
    name: 'HouseType',
    component: HouseType
  },
  {
    path: '/PriceChange',
    name: 'PriceChange',
    component: PriceChange
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router