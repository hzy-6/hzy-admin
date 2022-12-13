<script lang="ts" setup>
import LayoutHeaderVue from "./LayoutHeader.vue";
import LayoutTabsVue from "./LayoutTabs.vue";
import LayoutSider from "./LayoutSider.vue";
import TabsStore from "@/core/store/layouts/TabsStore";
import AppStore from "@/core/store/AppStore";
import MenuStore, { EMenuMode } from "@/core/store/layouts/MenuStore";
import CoreStore from "@/core/store/layouts/CoreStore";
import { computed } from "vue";
import LayoutIframe from "./LayoutIframe.vue";

const tabsStore = TabsStore();
const appStore = AppStore();
const menuStore = MenuStore();
const coreStore = CoreStore();

//当前年份
const year = new Date().getFullYear();

//计算与左侧边距
let left = computed(() => {
  if (coreStore.state.isMobile) return 0;
  return menuStore.state.width + (menuStore.state.menuMode == EMenuMode.left ? menuStore.state.leftModeWidth : 0);
});
</script>

<template>
  <a-layout style="min-height: 100vh">
    <!-- 菜单 -->
    <LayoutSider />
    <!-- 头部 -->
    <div class="hzy-header-content hzy-ground-glass" :style="{ left: left + 'px' }">
      <LayoutHeaderVue />
      <LayoutTabsVue />
    </div>
    <a-layout :style="{ marginLeft: left + 'px' }">
      <a-layout-content :style="{ paddingTop: '88px' }">
        <div style="min-height: calc(80vh); overflow: hidden">
          <div v-show="tabsStore.currentMode == 1">
            <!-- 由于必须要输出 cacheViews 才能不让缓存页面丢失事件 所以用了下面隐藏的input组件 来激活cacheViews变化 -->
            <!-- <input type="hidden" :value="tabsStore.state.cacheViews" /> -->
            <router-view v-slot="{ Component, route }">
              <transition name="fade-transform" mode="out-in">
                <keep-alive :include="tabsStore.state.cacheViews">
                  <component :is="Component" :key="route.fullPath" />
                </keep-alive>
              </transition>
            </router-view>
          </div>
          <div v-show="tabsStore.currentMode == 2">
            <LayoutIframe />
          </div>
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
    background-color: #ffffff;

    .ant-layout-sider {
      overflow: auto;
      left: 0;
      z-index: 10;
      box-shadow: 1px 0px 1px 0 #f0f2f5;
    }

    .ant-layout-content {
      position: relative;
      background-color: #f0f2f5;
    }

    .hzy-header-content {
      position: fixed;
      z-index: 9;
      right: 0;
    }

    .hzy-ground-glass {
      // 透明样式
      background-image: radial-gradient(transparent 1px, #ffffff 1px);
      background-size: 4px 4px;
      backdrop-filter: saturate(50%) blur(4px);
      -webkit-backdrop-filter: saturate(50%) blur(4px);
    }
  }
}
</style>
