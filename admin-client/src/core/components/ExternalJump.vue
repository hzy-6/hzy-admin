<script lang="ts" setup>
import router from "@/core/router";

const { params } = router.currentRoute.value;
const path: string = params.path as string;

setTimeout(() => {
  window.open(path, "_black");
}, 1000);
</script>

<template>
  <div class="p-20 text-center">
    <a target="_black" :href="path">{{ path }}</a>
  </div>
</template>

<style lang="less" scoped>
a {
  font-size: 25px;
}
</style>
