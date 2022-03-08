<template>
  <div class="p-24">
    <a-spin v-if="loading" />
    <iframe :src="domainName + '/swagger'" frameBorder="0" id="iframe_swagger" v-show="!loading"></iframe>
  </div>
</template>

<script>
import { defineComponent, onMounted, ref } from "vue";
import appConsts from "@/scripts/app-consts";

export default defineComponent({
  name: "swagger",
  setup() {
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

    return {
      loading,
      domainName,
    };
  },
});
</script>

<style lang="less" scoped>
iframe {
  width: 100%;
  height: calc(100vh - 200px);
}
</style>
