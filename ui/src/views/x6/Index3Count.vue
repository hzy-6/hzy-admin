<template>
  <Button type="primary" @click="count++">计数:{{ count }}</Button>
</template>

<script setup>
import { ref } from "vue";
import { Button } from "ant-design-vue";

const count = ref(0);
</script>
