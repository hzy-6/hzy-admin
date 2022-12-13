<script lang="ts" setup>
import { onMounted, ref } from "vue";
import PageContainer from "@/core/components/PageContainer.vue";
defineOptions({ name: "ChartMoreCom" });

const loading = ref(true);
onMounted(() => {
  let iframe = document.getElementById("iframe_g2");

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

<template>
  <PageContainer>
    <a-spin v-if="loading" />
    <iframe src="https://g2.antv.vision/zh/examples/gallery" frameborder="0" id="iframe_g2" v-show="!loading"></iframe>
    <!--    <iframe src="https://antv-g2.gitee.io/zh/examples/gallery" frameBorder="0" id="iframe_g2" v-show="!loading"></iframe>-->
  </PageContainer>
</template>

<style lang="less" scoped>
iframe {
  width: 100%;
  height: calc(100vh - 120px);
}
</style>
