<template>
  <div id="app">
    <section class="hero is-primary is-small">
      <!-- Hero head: will stick at the top -->
      <div class="hero-head">
        <nav class="navbar">
          <div class="container">
            <div class="navbar-brand">
              <a href="https://www.instagram.com/rafaelmoreira.ft/" target="_blank" class="navbar-item" title="Instagram">
                <i class="icon-instagram"></i>
              </a>
              <a href="https://www.facebook.com/rafaelmoreira.ft" target="_blank" class="navbar-item" title="Facebook">
                <i class="icon-facebook-square"></i>
              </a>
              <a href="https://api.whatsapp.com/send?phone=5551985574644" target="_blank" class="navbar-item" title="Whatsapp">
                <i class="icon-whatsapp"></i>
              </a>
              <a href="mailto:rafael.vmrr@gmail.com?Subject=contact from dacs-work" target="_blank" title="rafael.vmrr@gmail.com" class="navbar-item">
                <i class="icon-envelope-o"></i>
              </a>
              <a href="https://linkedin.com/in/rafaelmoreiraft" target="_blank" class="navbar-item" title="Linkedin">
                <i class="icon-linkedin-square"></i>
              </a>
            </div>
          </div>
        </nav>
      </div>

      <!-- Hero content: will be in the middle -->
      <div class="hero-body">
        <div class="container has-text-centered">
          <div class="logo">
            <img src="../src/assets/img/logo-grande.png" alt="">
          </div>
        </div>
      </div>

      <Menu></Menu>
    </section>

    <div class="content about">
      <router-view/>
    </div>
  </div>
</template>

<script type="text/javascript">
import Menu from '@/components/Shared/Menu.vue'
export default{
  components: {
    Menu
  }
}
</script>

<style>
@import '../src/assets/icomoon/style.css';

.hero.is-primary a.navbar-item:hover{
  background-color: transparent !important;
}

.hero.is-primary{
  color: white !important;
  background: black !important;
}

a{
  text-decoration: none !important;
}

.content p a {
  color: #00b500 !important;
}

.content a:hover {
  color: #00b500 !important;
}

.navbar-brand a:hover{
  color: #00b500 !important;
  transition: 1s !important;
}

.navbar-brand a{
  transition: 1s !important;
}

.logo img{
  max-width: 300px !important;
}

.hero-head{
  z-index: 1 !important;
}


.is-rafael{
  color: #00b500 !important;
  border-color: #00b500 !important;
}

.button.is-rafael.is-outlined:hover {
  background-color: #00b500 !important;
  border-color: #00b500 !important;
  color: #fff !important;
}

</style>
