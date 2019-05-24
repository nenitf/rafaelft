import Vue from 'vue'
import Router from 'vue-router'
import Bio from './views/Bio.vue'
import Fotos from './views/Fotos.vue'
import Videos from './views/Videos.vue'


Vue.use(Router)

export default new Router({
  mode: 'hash',
  base: process.env.BASE_URL,
  routes: [
    { path: '*', redirect: '/' },
    { path: '/', name: 'bio', component: Bio },
    { path: '/fotos', name: 'fotos', component: Fotos },
    { path: '/videos', name: 'videos', component: Videos }
  ]
})
