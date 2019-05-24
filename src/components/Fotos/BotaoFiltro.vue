<template>
  <button class="button is-rafael is-outlined" :class="{'is-active': isActive}" @click="filtraTag">
    {{nome}}
  </button>

</template>
<script>
export default {
  props: ['nome', 'isActive'],
  methods: {
    filtraTag(){
      this.$emit('filtraTag');
    }
  }
}
</script>
<style>
.button.is-rafael.is-outlined.is-active{
  background-color: #00b500 !important;
  border-color: #00b500 !important;
  color: #fff !important;
}
</style>
