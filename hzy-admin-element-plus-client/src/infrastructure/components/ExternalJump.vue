<script lang="ts" setup>
import router from "@/infrastructure/router";

const { params } = router.currentRoute.value;
const path: string = params.path as string;
setTimeout(() => {
  window.open(path, "_black");
}, 1000);
</script>
<style lang="less" scoped>
a {
  font-size: 25px;
}
</style>

<template>
  <div class="p-15 text-center">
    <span style="font-size: 23px; color: #67c23a">即将跳转到 > </span> <a target="_black" :href="path">{{ path }}</a>
  </div>
</template>