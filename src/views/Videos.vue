<template>
  <div class="container">
    <div class="notification is-white container-gallery">

      <div class="columns is-centered is-multiline is-mobile">
        <div class="column" v-for="(urlVideo, index) in videos" :key="index">
          <iframe :src="urlVideo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
      </div>
    </div>

    <!-- Spinner escondido enquanto as requisições são feitas -->
    <b-loading :is-full-page="true" :active.sync="isLoading" :can-cancel="false"></b-loading>

  </div>
</template>

<script>
export default {
  name: 'videos',
  data(){
    return{
      urlVideos: 'https://api.github.com/gists/99e41c4dac44f00217ae9a8cd8ca8d7e',
      videos: null,
      isLoading: true
    }
  }, created() {
    //do something after creating vue instance
    let vm = this;

    this.$http
    .get(vm.urlVideos)
    .then(function(response) {
      // success callback fotos
      vm.videos = JSON.parse(response.data.files["videos.json"].content);
      this.isLoading = false;
    }, response => {
      // error callback fotos
      this.$toast.open({
        duration: 5000,
        message: 'Erro ao carregar fotos, recarregue a página',
        position: 'is-bottom',
        type: 'is-danger'
      });
      this.isLoading = false;
    });
  }
}
</script>
<style media="screen">
.column iframe{
  max-width: initial;
}

.container-gallery{
  text-align: center !important;
  padding: 1.25rem 1.5rem !important;
}
</style>
