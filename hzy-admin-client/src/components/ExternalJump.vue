<template>
  <div class="p-15 text-center">
    <a target="_black" :href="path">{{ path }}</a>
  </div>
</template>
<script>
export default { name: "ExternalJumpCom" };
</script>
<script setup>
import router from "@/router/index";

const { params } = router.currentRoute.value;
const { path } = params;
setTimeout(() => {
  window.open(path, "_black");
}, 1000);
</script>
<style lang="less" scoped>
a {
  font-size: 25px;
}
</style>
