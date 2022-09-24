<script setup lang="ts">
import LayoutHeaderVue from "./LayoutHeader.vue";
import LayoutTabsVue from "./LayoutTabs.vue";
import LayoutMenuMainVue from "./LayoutMenuMain.vue";
import CoreStore from "@/infrastructure/store/layouts/CoreStore";
import TabsStore from "@/infrastructure/store/layouts/TabsStore";
import MenuStore, { EMenuMode } from "@/infrastructure/store/layouts/MenuStore";
import { computed } from "vue";

const coreStore = CoreStore();
const tabsStore = TabsStore();
const menuStore = MenuStore();

//计算与左侧边距
let left = computed(() => {
  if (coreStore.state.isMobile) return 0;

  if (menuStore.state.menuMode == EMenuMode.left) {
    return menuStore.state.width + menuStore.state.minWidth;
  }

  return menuStore.state.width;
});
</script>

<template>
  <el-container>
    <!-- 菜单 -->
    <LayoutMenuMainVue />
    <el-container>
      <!-- 头部 -->
      <div class="hzy-header-content" :style="{ left: left + 'px' }">
        <LayoutHeaderVue />
        <LayoutTabsVue />
      </div>
      <!-- 中间内容 -->
      <el-main style="height: calc(100vh); padding: 0; padding-top: 100px; overflow: hidden; overflow-y: auto">
        <div style="min-height: calc(100vh - 100px); overflow: hidden">
          <!-- 由于必须要输出 cacheViews 才能不让缓存页面丢失事件 所以用了下面隐藏的input组件 来激活cacheViews变化-->
          <!-- <input type="hidden" :value="tabsStore.state.cacheViews" /> -->
          <router-view v-slot="{ Component, route }">
            <transition name="fade-transform" mode="out-in">
              <keep-alive :include="tabsStore.state.cacheViews">
                <component :is="Component" :key="route.fullPath" />
              </keep-alive>
            </transition>
          </router-view>
        </div>
    
      </el-main>
    </el-container>
  </el-container>
</template>

<style lang="less" scoped>
.hzy-header-content {
  position: absolute;
  z-index: 9;
  right: 0;
  backdrop-filter: saturate(50%) blur(5px);
  -webkit-backdrop-filter: saturate(50%) blur(5px);
}
</style>
