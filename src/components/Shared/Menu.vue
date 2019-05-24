<template lang="html">
  <div class="">
    <!-- Hero footer: will stick at the bottom -->
    <div class="menu">
      <nav class="tabs is-boxed is-centered">
        <div class="container">
          <ul>
            <li :class="{ 'is-active': ehAbaAtiva('bio') }">
              <router-link to="/">Bio</router-link>
            </li>
            <li :class="{ 'is-active': ehAbaAtiva('fotos') }">
              <router-link to="fotos">Fotos</router-link>
            </li>
            <li :class="{ 'is-active': ehAbaAtiva('videos') }">
              <router-link to="videos">Videos</router-link>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    ehAbaAtiva(nome) {
      if (nome == this.$route.name) {
        return true;
      } else {
        return false;
      }
    }
  }
}
</script>

<style lang="css">
.is-disable{
pointer-events: none !important;
opacity: .65 !important;
}

.hero.is-primary .tabs.is-boxed a:hover {
    background: whitesmoke !important;
}

.hero.is-primary .tabs.is-boxed li.is-active a{
  background: white !important;
}

.hero.is-primary .tabs.is-boxed li.is-active a{
  color: #00b500 !important;
  font-weight: bold;
}

.hero.is-primary .tabs.is-boxed li a:hover{
  color: #00b500 !important;
}
</style>
