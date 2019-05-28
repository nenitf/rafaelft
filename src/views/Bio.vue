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

      <p>
          Meu nome é Rafael Moreira, sou fotógrafo e acho sensacional poder trabalhar em manipulação de imagens (luz, sombra e cores).Penso que cada momento é único, cada detalhe é único e que em tudo tem uma história para se eternizar e é através da fotografia que tenho o privilégio de poder registrar.
      </p>
      <p>
          Apaixonado pelo que faço, tenho como objetivo proporcionar aos meus clientes a melhor experiência, com fotos de qualidade a um valor acessível, afinal, fotografar não é apenas clicar um botão, fotografar é registar um momento, é captar a emoção e o sentimento.
      </p>
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
