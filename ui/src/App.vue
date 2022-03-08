<template>
  <a-config-provider :getPopupContainer="getPopupContainer" :locale="locale">
    <a-spin :spinning="loading">
      <router-view />
    </a-spin>
  </a-config-provider>
</template>

<script>
import { computed, defineComponent, onMounted, ref } from "vue";
import zhCN from "ant-design-vue/es/locale/zh_CN";
import dayjs from "dayjs";
import "dayjs/locale/zh-cn";
dayjs.locale("zh-cn");
import useAppStore from "@/store";

export default defineComponent({
  name: "App",
  setup() {
    // const locale = ref(zhCN.locale);
    const locale = ref(zhCN);
    const appStore = useAppStore();
    const loading = computed(() => appStore.state.loading);

    const getPopupContainer = (el, dialogContext) => {
      if (dialogContext) {
        return dialogContext.getDialogWrap();
      } else {
        return document.body;
      }
    };

    //实时计算监听 宽高
    const calcScreen = () => {
      var demarcation = 1080;
      appStore.state.isMobile = window.innerWidth < demarcation;
      // 监听窗口大小 小屏幕下不使用 topnav
      appStore.setTopNav(window.innerWidth > demarcation);
      window.onresize = () => {
        return (() => {
          appStore.state.isMobile = window.innerWidth < demarcation;
          // 监听窗口大小 小屏幕下不使用 topnav
          appStore.setTopNav(window.innerWidth > demarcation);
        })();
      };
    };

    //页面加载 钩子函数
    onMounted(() => {
      calcScreen();
    });

    return {
      locale,
      getPopupContainer,
      loading,
    };
  },
});
</script>
