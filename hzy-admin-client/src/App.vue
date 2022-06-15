<template>
  <a-config-provider :getPopupContainer="getPopupContainer" :locale="locale">
    <a-spin :spinning="loading">
      <router-view />
    </a-spin>
  </a-config-provider>
</template>

<script setup>
import { computed, ref } from "vue";
import { useLayoutStore } from "@/store";
import zhCN from "ant-design-vue/es/locale/zh_CN";
import dayjs from "dayjs";
import "dayjs/locale/zh-cn";
dayjs.locale("zh-cn");

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
</script>
