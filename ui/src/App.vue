<template>
  <a-config-provider :getPopupContainer="getPopupContainer" :locale="locale">
    <a-spin :spinning="loading">
      <router-view />
    </a-spin>
  </a-config-provider>
</template>

<script>
import { computed, defineComponent, ref } from "vue";
import zhCN from "ant-design-vue/es/locale/zh_CN";
import dayjs from "dayjs";
import "dayjs/locale/zh-cn";
dayjs.locale("zh-cn");
import { useLayoutStore } from "@/store";

export default defineComponent({
  name: "App",
  setup() {
    // const locale = ref(zhCN.locale);
    const locale = ref(zhCN);
    const layoutStore = useLayoutStore();
    const loading = computed(() => layoutStore.state.loading);

    const getPopupContainer = (el, dialogContext) => {
      if (dialogContext) {
        return dialogContext.getDialogWrap();
      } else {
        return document.body;
      }
    };

    return {
      locale,
      getPopupContainer,
      loading,
    };
  },
});
</script>
