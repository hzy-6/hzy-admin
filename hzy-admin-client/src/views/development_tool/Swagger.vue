<script lang="ts" setup>
import AppConsts from "@/utils/AppConsts";
import { onMounted, ref } from "vue";

defineOptions({ name: "swagger" });

const loading = ref(true);
const domainName = ref(AppConsts.domainServerApi);
const iframe = ref<HTMLElement>();

onMounted(() => {
  if (iframe.value) {
    // 处理兼容行问题
    if (Object.prototype.hasOwnProperty.call(iframe, "attachEvent")) {
      iframe.value.addEventListener("onload", () => {
        // iframe加载完毕以后执行操作
        loading.value = false;
      });
    } else {
      iframe.value.onload = function () {
        // iframe加载完毕以后执行操作
        loading.value = false;
      };
    }
  }
});
</script>

<template>
  <div>
    <a-spin v-if="loading" />
    <iframe ref="iframe" :src="domainName + '/swagger'" frameBorder="0" id="iframe_swagger" v-show="!loading"></iframe>
  </div>
</template>

<style lang="less" scoped>
iframe {
  width: 100%;
  height: calc(100vh - 120px);
}
</style>
