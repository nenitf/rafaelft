<template>

  <div class="notification is-white container-gallery">

    <!-- Mostra página depois da promisse pegar as fotos -->
    <div v-if="!isLoading">

      <!-- Filtro Categoria -->
      <div class="buttons is-centered">
        <!-- Cada botão com estado separado! -->
        <botao-filtro
        v-for="(categoria, index) in categorias" :key="index"
        :nome="categoria.nome"
        :isActive="nomeCategoriaAtiva != null&&nomeCategoriaAtiva==categoria.nome"
        @filtraTag="filtraCategoria(categoria.nome, index)"/>
      </div>

      <!-- Filtro SubCategoria -->
      <div class="buttons is-centered" v-if="nomeCategoriaAtiva != null">
        <botao-filtro
        v-for="(subcategoria, index) in categorias[indexCategoriaAtiva].subcategorias" :key="index"
        :nome="subcategoria"
        :isActive="nomesSubCategoriasAtivas.length > 0&&nomesSubCategoriasAtivas.includes(subcategoria)"
        @filtraTag="filtraSubCategorias(subcategoria)"/>
      </div>

      <!-- Galeria -->
      <div class="columns is-centered is-multiline is-mobile">
        <!-- <transition-group name="fade" tag="div"> -->
        <div class="column is-narrow" v-for="(foto, index) in fotos" :key="index" v-show="mostraFoto(foto.categoria, foto.subcategoria)">
          <foto-galeria :foto="foto" @fotoClicada="ampliarFoto(index)"/>
        </div>
        <!-- </transition-group> -->
      </div>

      <!-- Modal escondido para ampliar foto -->
      <foto-ampliada
      :fotoAmpliada="fotoAmpliada" :url="fotos[indexFotoAmpliada].url" :index="indexFotoAmpliada"
      :existeFotoAnterior="existeFotoAnterior" :existeProximaFoto="existeProximaFoto"
      @ampliarFotoAnterior="ampliarFotoAnterior" @ampliarProximaFoto="ampliarProximaFoto"
      @fecharFotoAmpliada="fecharFotoAmpliada"/>

    </div>

    <!-- Spinner escondido enquanto a requisição assíncrona é feita -->
    <b-loading :is-full-page="true" :active.sync="isLoading" :can-cancel="false"></b-loading>

  </div>

</template>

<script>
import FotoGaleria from '@/components/Fotos/FotoGaleria.vue'
import FotoAmpliada from '@/components/Fotos/FotoAmpliada.vue'
import BotaoFiltro from '@/components/Fotos/BotaoFiltro.vue'
export default {
  name: 'fotos',
  components: {
    FotoGaleria,
    FotoAmpliada,
    BotaoFiltro
  },
  data(){
    return{
      isLoading: true,

      // assync
      urlFotos: 'https://api.github.com/gists/e357602e67f1d7de9ced0741c6378873',
      fotos: [],
      categorias: [],

      // Filtro
      nomeCategoriaAtiva: null,
      indexCategoriaAtiva: null,
      nomesSubCategoriasAtivas: [],

      // ModalAmpliação de fotos
      existeFotoAnterior: false,
      existeProximaFoto: false,
      indexFotoAmpliada: 0,
      fotoAmpliada: false
    }
  },
  methods: {
    // Montar dinamicamente o array de objetos abaixo com base nas fotos
    montarArrayCategoriasSubCategorias(){
      // Padrão esperado:
      // categorias: [
      //   {
      //     nome: "Infantil"
      //     subcategorias: [
      //       "Book",
      //       "Festa"
      //     ]
      //   },
      //   {
      //     nome: "Casamento"
      //     subcategorias: [
      //       "Festa"
      //     ]
      //   } ...
      // ]

      // iteração por cada objeto de foto
      for (var i = 0; i < this.fotos.length; i++) {

        // caso a variável categorias NÃO encontre um objeto com atributo nome
        // de mesmo valor que a foto - por não possuir ou ser nula:
        //    adiciona à variável um novo objeto, com nome da categoria e array vazio de subcategorias
        if (!this.categorias.find(categoria => categoria.nome === this.fotos[i].categoria)) {
          this.categorias.push({"nome": this.fotos[i].categoria, "subcategorias":[]});
        }

        // caso a variável categoria encontre um objeto com atributo nome de mesmo valor que a foto
        // e esse objeto NÃO possua uma subcategoria de mesmo nome que a foto
        //    a subcategoria dentro da categoria de mesmo nome e sem o atributo,
        //    recebe um push do nome da subcategoria da foto
        this.categorias.find(categoria => {
          if (categoria.nome === this.fotos[i].categoria && !categoria.subcategorias.find(subcategoria => subcategoria == this.fotos[i].subcategoria)){
            categoria.subcategorias.push(this.fotos[i].subcategoria);
          }
        });
      }
    },
    // Ativar modal ampliação de foto
    ampliarFoto(i){
      this.fotoAmpliada = true;
      this.indexFotoAmpliada = i;

      // Congela fundo da página
      let html = document.querySelector('html');
      html.classList.add('is-clipped');
      this.testaLinhaDefotos();
    },
    // Mostrar ou não setas (<- e ->) na modal de foto ampliada
    testaLinhaDefotos(){
      this.existeProximaFoto = false;
      this.existeFotoAnterior = false;

      for (var i = this.indexFotoAmpliada-1; i >= 0; i--) {
        if (this.fotos[i].categoria == this.nomeCategoriaAtiva && this.nomesSubCategoriasAtivas.includes(this.fotos[i].subcategoria)) {
          this.existeFotoAnterior = true;
          break;
        }
      }

      for (var i = this.indexFotoAmpliada+1; i < this.fotos.length; i++) {
        if (this.fotos[i].categoria == this.nomeCategoriaAtiva && this.nomesSubCategoriasAtivas.includes(this.fotos[i].subcategoria)) {
          this.existeProximaFoto = true;
          break;
        }
      }
    },
    fecharFotoAmpliada(){
      this.fotoAmpliada = false;

      // Descongela fundo da página
      let html = document.querySelector('html');
      html.classList.remove('is-clipped');
    },
    ampliarProximaFoto(){
      for (var i = this.indexFotoAmpliada + 1; i < this.fotos.length; i++) {
        if (this.fotos[i].categoria == this.nomeCategoriaAtiva && this.nomesSubCategoriasAtivas.includes(this.fotos[i].subcategoria)) {
          this.indexFotoAmpliada = i;
          break;
        }
      }
      // Mostra ou não as setas <- ->
      this.testaLinhaDefotos();
    },
    ampliarFotoAnterior(){
      for (var i = this.indexFotoAmpliada - 1; i >= 0; i--) {
        if (this.fotos[i].categoria == this.nomeCategoriaAtiva && this.nomesSubCategoriasAtivas.includes(this.fotos[i].subcategoria)) {
          this.indexFotoAmpliada = i;
          break;
        }
      }
      // Mostra ou não as setas <- ->
      this.testaLinhaDefotos();
    },
    // Botão de filtro categoria
    filtraCategoria(nomeCategoria, indexCategoria){
      this.nomeCategoriaAtiva = nomeCategoria;
      this.indexCategoriaAtiva = indexCategoria;

      this.nomesSubCategoriasAtivas = [];
      for (var i = 0; i < this.categorias[indexCategoria].subcategorias.length; i++) {
        this.nomesSubCategoriasAtivas.push(this.categorias[indexCategoria].subcategorias[i]);
      }
    },
    // Botão de filtro subcategoria
    filtraSubCategorias(nomeSubCategoria){
      // Adiciona subcategoria caso ela não esteja no array de subcategorias ativas
      // ou remove subcategoria no array de subcategorias ativas
      if (!this.nomesSubCategoriasAtivas.includes(nomeSubCategoria)) {
        this.nomesSubCategoriasAtivas.push(nomeSubCategoria);
      } else {
        let indexEmSubCategoriasAtivas = this.nomesSubCategoriasAtivas.indexOf(nomeSubCategoria);
        this.nomesSubCategoriasAtivas.splice(indexEmSubCategoriasAtivas, 1);
      }
    },
    // Exibe card de foto na galeria
    mostraFoto(nomeCategoria,nomeSubCategoria){
      return this.nomeCategoriaAtiva == nomeCategoria && this.nomesSubCategoriasAtivas.includes(nomeSubCategoria);
    }
  },
  created () {
    let vm = this;

    // Requisção de fotos
    vm.$http
    .get(vm.urlFotos)
    .then(function(response) {
      // success callback fotos
      vm.fotos = JSON.parse(response.data.files["fotos.json"].content);
      this.montarArrayCategoriasSubCategorias();
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
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active em versões anteriores a 2.1.8 */ {
  opacity: 0;
}

.container-gallery{
  text-align: center !important;
  padding: 1.25rem 1.5rem !important;
}
</style>
