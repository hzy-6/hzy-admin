<template>
  <div>
    <a-spin v-if="loading" />
    <iframe :src="domainName + '/swagger'" frameBorder="0" id="iframe_swagger" v-show="!loading"></iframe>
  </div>
</template>

<script>
export default { name: "swagger" };
</script>
<script setup>
import { onMounted, ref } from "vue";
import appConsts from "@/scripts/app-consts";

const loading = ref(true);
const domainName = ref(appConsts.domainName);

onMounted(() => {
  let iframe = document.getElementById("iframe_swagger");

  if (iframe != null) {
    // 处理兼容行问题
    if (Object.prototype.hasOwnProperty.call(iframe, "attachEvent")) {
      iframe.addEventListener("onload", () => {
        // iframe加载完毕以后执行操作
        loading.value = false;
      });
    } else {
      iframe.onload = function () {
        // iframe加载完毕以后执行操作
        loading.value = false;
      };
    }
  }
});
</script>

<style lang="less" scoped>
iframe {
  width: 100%;
  height: calc(100vh - 120px);
}
</style>
