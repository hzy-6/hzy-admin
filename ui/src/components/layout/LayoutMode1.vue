<template>
  <a-layout style="min-height: 100vh">
    <a-layout-sider hasSider v-model:collapsed="menuStoreState.isCollapse" :collapsedWidth="menuStoreState.width" :theme="menuStoreState.themeType" :width="menuStoreState.width">
      <div class="hzy-logo" v-show="!layoutStoreState.isMobile && !menuStoreState.isCollapse" :style="{ color: menuStoreState.themeType == 'dark' ? '#ffffff' : '' }">
        {{ layoutStoreState.title }}
      </div>
      <a-drawer
        placement="left"
        @close="menuStore.onChangeCollapse(!menuStoreState.isCollapse)"
        :closable="false"
        :visible="!menuStoreState.isCollapse"
        :bodyStyle="{ padding: 0 }"
        :drawerStyle="{ background: menuStoreState.themeType == 'dark' ? '#001529' : '' }"
        width="80%"
        v-if="layoutStoreState.isMobile"
      >
        <div class="hzy-logo" :style="{ color: menuStoreState.themeType == 'dark' ? '#ffffff' : '' }">
          {{ layoutStoreState.title }}
        </div>
        <LayoutMenu />
      </a-drawer>
      <LayoutMenu v-else />
    </a-layout-sider>
    <a-layout>
      <LayoutHeader :style="{ position: 'relative', zIndex: 1 }" />
      <a-layout-content>
        <LayoutTabs />
        <div style="min-height: 100vh" class="p-15">
          <!-- 由于必须要输出 cacheViews 才能不让缓存页面丢失事件 所以用了下面隐藏的input组件 来激活cacheViews变化-->
          <input type="hidden" :value="tabsStoreState.cacheViews" />
          <router-view v-slot="{ Component, route }">
            <transition name="fade-transform" mode="out-in">
              <keep-alive :include="tabsStoreState.cacheViews">
                <component :is="Component" :key="route.fullPath" />
              </keep-alive>
            </transition>
          </router-view>
        </div>

        <!-- 返回顶部 -->
        <a-back-top />
        <a-layout-footer style="text-align: center">{{ layoutStoreState.title }} ©2020 created by hzy</a-layout-footer>
      </a-layout-content>
    </a-layout>
  </a-layout>
</template>
<script lang="ts">
import { reactive, watch, defineComponent, toRefs, computed } from "vue";
import { useLayoutStore, useTabsStore, useMenuStore, useHeaderStore } from "@/store";
import LayoutHeader from "./LayoutHeader.vue";
import LayoutTabs from "./LayoutTabs.vue";
import LayoutMenu from "./menus/LayoutMenu.vue";

export default defineComponent({
  name: "LayoutMode1Vue",
  components: {
    LayoutTabs,
    LayoutHeader,
    LayoutMenu,
  },
  setup() {
    //layout
    const layoutStore = useLayoutStore();
    const layoutStoreState = computed(() => layoutStore.state);
    //tabs
    const tabsStore = useTabsStore();
    const tabsStoreState = computed(() => tabsStore.state);
    //menu
    const menuStore = useMenuStore();
    const menuStoreState = computed(() => menuStore.state);
    //header
    const headerStore = useHeaderStore();
    const headerStoreState = computed(() => headerStore.state);

    const state = reactive({
      visible: false,
    });

    watch(
      () => menuStoreState.value.isCollapse,
      (value) => {
        state.visible = !value;
      }
    );

    watch(
      () => state.visible,
      (value) => {
        menuStore.onChangeCollapse(!value);
      }
    );

    return { ...toRefs(state), layoutStoreState, tabsStoreState, menuStoreState, headerStoreState, menuStore };
  },
});
</script>

<style lang="less">
.ant-layout {
  background-color: #ffffff;

  .ant-layout-sider {
    overflow: auto;
    left: 0;
    z-index: 6;
    box-shadow: 1px 0px 1px 0 rgba(0, 0, 0, 0.1);
  }

  .ant-layout-content {
    position: relative;
    background-color: #f0f2f5;
  }
}
</style>
