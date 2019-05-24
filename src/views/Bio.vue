<template>

  <div class="container">
    <div class="notification is-white">
      <div class="columns">
        <div class="column is-one-third foto-bio">
            <img class="perfil" src="../assets/img/perfil.jpg" alt="">
        </div>
        <div class="column titulo-subtitulo">
          <h1 class="title">
            Rafael Moreira
          </h1>
          <h2 class="subtitle">
            Fotógrafo Profissional com especialização em Design gráfico
          </h2>
        </div>
      </div>

      <p>Meu nome é Rafael Moreira sou fotografo, penso que cada momento é único e com a fotografia temos esse privilégio de registrar e compartilhar esses momentos mais importantes da nossa vida.
      </p>
      <p>Faço fotografia por paixão, cada detalhe é único, acho sensacional a questão de trabalhar com manipulação de imagem (luz, sombra e cores). Tento proporcionar aos meus clientes a melhores experiencia profissional em fotografia, com fotos de qualidade e um valor acessível, e sempre pensando no resultado que o cliente deseja.</p>
    </div>
  </div>

</template>

<script>
export default {
  name: 'bio'
}
</script>

<style media="screen">
.foto-bio img{
  width: 12rem;
  border-radius: 50%;
}

.foto-bio{
  text-align: center;
}

.titulo-subtitulo{
  align-self: center !important;
}

.subtitle{
  font-size: 1.2rem !important;
}
</style>
