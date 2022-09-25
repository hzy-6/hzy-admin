<script lang="ts">
// 组件命名
export default { name: "AppComponentsCom" };
</script>
<!-- 逻辑代码 -->
<script lang="ts" setup>
import { onMounted, ref } from "vue";

const loading = ref(true);

onMounted(() => {
  let iframe = document.getElementById("iframe_app_components");

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
  <div class="p-20" v-loading="loading" style="min-height: 300px">
    <iframe src="https://element-plus.gitee.io/zh-CN/component/button.html" frameborder="0" id="iframe_app_components" v-show="!loading"></iframe>
  </div>
</template>

<style lang="less" scoped>
iframe {
  width: 100%;
  height: calc(100vh - 120px);
}
</style>