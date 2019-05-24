<template lang="html">
  <div class="card card-foto">
    <div class="card-image">
      <figure class="image">
        <img :src="foto.url" alt="" @click="ampliarEstaFoto">
      </figure>
    </div>
    <div class="overlay" @click="ampliarEstaFoto">
    </div>
  </div>
</template>

<script>
export default {
  props: ['foto'],
  name: 'foto',
  data(){
    return{
      imagemSelecionada: false
    }
  },
  methods: {
    ampliarEstaFoto(){
      this.$emit('fotoClicada');
    }
  }
}
</script>

<style lang="css">
/* Efeito overlay */
.card-foto:hover > .overlay{
  width: 100%;
  height: 100%;
  display: inherit;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 2;
  background-color: rgba(255, 255, 255, 0.6);
  border: 3px solid #00b500;
}
.overlay{
  display: none;
}

/* Card */
.card{
  padding: .5rem;
  padding-bottom: 1.5rem;
}
.card-foto{
  max-width: 300px !important;
}
.card-foto img{
  max-height: 190px !important;
}
figure{
  margin: .0em !important;
}
figure img{
  width: auto !important;
}
</style>
