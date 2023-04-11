<script lang="ts" setup>
import { computed, onMounted, ref, watch } from "vue";
import Tools from "@/core/utils/Tools";
import TabsStore from "@/core/store/layouts/TabsStore";

const isPro = process.env.NODE_ENV == "production";
const token = ref(Tools.getAuthorization());
const iframe = ref<HTMLElement[]>();
const tabsStore = TabsStore();
const tabsIframe = computed(() => tabsStore.state.tabs.filter((w) => w.meta.mode == 2));
const loading = ref<boolean>(false);

onMounted(() => {
  token.value = Tools.getAuthorization();
});

watch(
  () => tabsIframe.value,
  (value, oldValue) => {
    if (value.length > oldValue.length) {
      loading.value = true;
    }
  }
);

/**
 * 获取新地址
 * @param url
 * @param menuId
 */
function getUrl(urlDev: string, urlPro: string, menuId: number) {
  if (isPro) {
    urlPro = urlPro?.replace("{menuid}", menuId.toString());
    urlPro = urlPro?.replace("{token}", token.value);
    return urlPro;
  } else {
    if (urlDev) {
      urlDev = urlDev?.replace("{menuid}", menuId.toString());
      urlDev = urlDev?.replace("{token}", token.value);
      return urlDev;
    } else {
      urlPro = urlPro?.replace("{menuid}", menuId.toString());
      urlPro = urlPro?.replace("{token}", token.value);
      return urlPro;
    }
  }
}
</script>

<template>
  <a-spin :spinning="loading">
    <div v-for="(item, index) in tabsIframe" :key="item.path">
      <div v-show="item.path == $route.path" :key="item.path">
        <iframe ref="iframe" :src="getUrl(item.meta.moduleUrl!, item.meta.moduleUrlPro!, item.meta.menuId!)" frameBorder="0" @load="loading = false" :key="item.path"></iframe>
      </div>
    </div>
  </a-spin>
</template>

<style lang="less" scoped>
iframe {
  width: 100%;
  height: calc(100vh - 90px);
}
</style>
