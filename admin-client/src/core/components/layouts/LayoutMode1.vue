<script lang="ts" setup>
import { computed } from "vue";
import LayoutHeaderVue from "./LayoutHeader.vue";
import LayoutTabsVue from "./LayoutTabs.vue";
import LayoutSider from "./LayoutSider.vue";
import TabsStore from "@/core/store/layouts/TabsStore";
import AppStore from "@/core/store/AppStore";
import MenuStore, { EMenuMode } from "@/core/store/layouts/MenuStore";
import CoreStore from "@/core/store/layouts/CoreStore";
import LayoutIframe from "./LayoutIframe.vue";
import ThemeStore from "@/core/store/layouts/ThemeStore";

const tabsStore = TabsStore();
const appStore = AppStore();
const menuStore = MenuStore();
const coreStore = CoreStore();
const themeStore = ThemeStore();

//当前年份
const year = new Date().getFullYear();

//计算与左侧边距
let left = computed(() => {
  if (coreStore.state.isMobile) return 0 + "px";
  return menuStore.state.width + (menuStore.state.menuMode == EMenuMode.left ? menuStore.state.leftModeWidth : 0) + "px";
});

</script>

<template>
  <a-layout style="min-height: 100vh">
    <!-- 菜单 -->
    <LayoutSider />
    <!-- 头部 -->
    <a-card :bordered="false" :bodyStyle="{ padding: 0 }" class="hzy-header-content hzy-ground-glass" :style="{ left, borderRadius: 0, boxShadow: 'none' }">
      <LayoutHeaderVue />
      <LayoutTabsVue />
    </a-card>
    <a-layout :style="{ marginLeft: left }">
      <a-layout-content :style="{ paddingTop: '88px' }">
        <div style="min-height: calc(80vh); overflow: hidden">
          <router-view v-slot="{ Component, route }">
            <transition name="fade-transform" mode="out-in">
              <keep-alive :include="tabsStore.state.cacheViews">
                <component :is="Component" :key="route.fullPath" v-if="route.meta.mode == 1" />
              </keep-alive>
            </transition>
          </router-view>
          <!-- iframe 处理 -->
          <LayoutIframe />
        </div>

        <!-- 返回顶部 -->
        <a-back-top />
        <a-layout-footer style="text-align: center">{{ appStore.state.title }} ©{{ year }} created by hzy</a-layout-footer>
      </a-layout-content>
    </a-layout>
  </a-layout>
</template>

<style lang="less">
.hzy-layout {
  .ant-layout {
    // background-color: #ffffff;

    .ant-layout-sider {
      overflow: auto;
      left: 0;
      z-index: 10;
    }

    .ant-layout-content {
      position: relative;
    }

    .hzy-header-content {
      position: fixed;
      z-index: 9;
      right: 0;
      top: 0;
      padding: 0;
    }

    // .hzy-ground-glass {
    //   // 透明样式
    //   background-image: radial-gradient(transparent 1px, #ffffff 1px);
    //   background-size: 4px 4px;
    //   backdrop-filter: saturate(50%) blur(4px);
    //   -webkit-backdrop-filter: saturate(50%) blur(4px);
    // }
  }
}
</style>
