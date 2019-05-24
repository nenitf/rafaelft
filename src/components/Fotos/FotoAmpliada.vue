<template>

  <div class="modal" :class="{'is-active': fotoAmpliada}" v-if="fotoAmpliada">
    <div class="modal-background" @keyup.enter.native="onKey"></div>
    <div class="modal-content columns is-mobile is-centered is-vcentered">

      <!-- Centralizar foto com colunas vazias nas laterais -->
      <div class="column">
      </div>

      <!-- Foto -->
      <div class="column is-four-fifths column-image">
        <img :src="url" alt="">
      </div>

      <!-- Centralizar foto com colunas vazias nas laterais -->
      <div class="column">
      </div>

    </div>

    <!-- X -->
    <button class="modal-close is-large" aria-label="close" @click="fecharFotoAmpliada"></button>

    <!-- <- -->
    <div class="arrow-left">
      <a href="#" v-if="existeFotoAnterior" @click="ampliarFotoAnterior"><i class="icon-chevron-left"></i></a>
    </div>

    <!-- -> -->
    <div class="arrow-right">
      <a href="#" v-if="existeProximaFoto" @click="ampliarProximaFoto"><i class="icon-chevron-right"></i></a>
    </div>
  </div>

</template>
<script>
export default {
  props: ['fotoAmpliada', 'url', 'index', 'existeFotoAnterior', 'existeProximaFoto'],
  created() {
    document.addEventListener('keyup', this.onKey);
  },
  beforeDestroy() {
    document.removeEventListener('keyup', this.onKey);
  },
  methods: {
    onKey(){
      // https://keycode.info/
      switch (event.code) {
        case "ArrowRight":
        this.ampliarProximaFoto();
        break;
        case "ArrowLeft":
        this.ampliarFotoAnterior();
        break;
        case "Escape":
        this.fecharFotoAmpliada();
        break;
      }
    },
    fecharFotoAmpliada(){
      this.$emit("fecharFotoAmpliada");
    },
    ampliarProximaFoto(){
      this.$emit("ampliarProximaFoto");
    },
    ampliarFotoAnterior(){
      this.$emit("ampliarFotoAnterior");
    }
  }
}
</script>
<style scoped>
.modal-content {
  overflow: inherit !important;
}

.modal-content div {
  text-align: center !important;
}

.modal-content div a i {
  color: white !important;
}

.modal-content img{
  height: auto !important;
  width: auto !important;
  max-height: 60vh !important;
}

.arrow-left, .arrow-right{
  position: absolute;
  color: white;
  top: 49%;
  height: 2%;
}

.arrow-left{
  margin-left: 2%;
  left: 0;
}

.arrow-right{
  margin-right: 2%;
  right: 0;
}
</style>
