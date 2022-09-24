<script lang="ts">
// 组件命名
export default { name: "ChartMoreCom" };
</script>
<!-- 逻辑代码 -->
<script lang="ts" setup>
import { onMounted, ref } from "vue";

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
  <div class="p-20" v-loading="loading" style="min-height: 200px">
    <iframe src="https://g2.antv.vision/zh/examples/gallery" frameborder="0" id="iframe_g2" v-show="!loading"></iframe>
    <!--    <iframe src="https://antv-g2.gitee.io/zh/examples/gallery" frameBorder="0" id="iframe_g2" v-show="!loading"></iframe>-->
  </div>
</template>

<style lang="less" scoped>
iframe {
  width: 100%;
  height: calc(100vh - 120px);
}
</style>