<template>
  <a-layout-header style="padding: 0; height: auto; background: #ffffff">
    <div class="hzy-layout-header" :class="headerStoreState.theme.class">
      <div class="hzy-header-btn" @click="menuStore.onChangeCollapse(!menuStoreState.isCollapse)">
        <a-tooltip>
          <template #title>菜单收展</template>
          <AppIcon :name="menuStoreState.isCollapse ? 'MenuUnfoldOutlined' : 'MenuFoldOutlined'" :size="16" />
        </a-tooltip>
      </div>
      <div style="flex: 1 1 0%; height: 100%; display: flex" v-if="menuStoreState.oneLevelMenuMode == 2">
        <LayoutOneLevelMenu />
      </div>
      <div style="flex: 1 1 0%" v-else></div>
      <div class="hzy-header-btn" @click="methods.onReload">
        <a-tooltip>
          <template #title>刷新当前选项卡</template>
          <AppIcon name="ReloadOutlined" :size="16" />
        </a-tooltip>
      </div>
      <div class="hzy-header-btn" @click="settingsStore.isShow()">
        <a-tooltip>
          <template #title>界面设置</template>
          <AppIcon name="SettingOutlined" :size="16" />
        </a-tooltip>
      </div>
      <div class="hzy-header-btn" @click="toggle" v-if="!layoutStoreState.isMobile">
        <a-tooltip>
          <template #title>全屏</template>
          <AppIcon :name="isFullscreen ? 'FullscreenExitOutlined' : 'FullscreenOutlined'" :size="16" />
        </a-tooltip>
      </div>
      <div class="hzy-header-btn">
        <a-dropdown>
          <div>
            <AppIcon name="UserOutlined" :size="16" />
            &nbsp;&nbsp;
            <span>{{ appStoreState.userInfo.name ? appStoreState.userInfo.name : "未知用户" }}</span>
          </div>
          <template #overlay>
            <a-menu>
              <a-menu-item @click="methods.onLogOut">
                <a href="javascript:;"> <AppIcon name="LogoutOutlined" />&nbsp;&nbsp;退出登录 </a>
              </a-menu-item>
            </a-menu>
          </template>
        </a-dropdown>
      </div>
    </div>
  </a-layout-header>
</template>
<script>
export default { name: "LayoutHeaderCom" };
</script>
<script setup>
import { computed } from "vue";
import { useLayoutStore, useTabsStore, useMenuStore, useHeaderStore, useAppStore, useSettingsStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import router from "@/router";
import LayoutOneLevelMenu from "./menus/LayoutOneLevelMenu.vue";
import { useFullscreen } from "@vueuse/core";

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
//app
const appStore = useAppStore();
const appStoreState = computed(() => appStore.state);
// settingsStore
const settingsStore = useSettingsStore();
const settingsStoreState = computed(() => settingsStore.state);

const { isFullscreen, enter, exit, toggle } = useFullscreen();

const methods = {
  onLogOut() {
    //退出登录
    router.push("/login");
  },
  //刷新当前页面
  onReload() {
    layoutStore.refresh(router.currentRoute.value.fullPath, router.currentRoute.value.name);
  },
};
</script>
<style lang="less">
.hzy-layout {
  //覆盖样式
  .ant-layout-header {
    position: relative;
    z-index: 6;
    width: 100%;
    height: auto !important;
    line-height: normal !important;
  }

  //=======// 头部
  .hzy-layout-header {
    padding: 0;
    position: relative;
    display: flex;
    align-items: center;
    height: 48px;
    //
    transition: background-color 0.1s;
    -moz-transition: background-color 0.1s;
    /* Firefox 4 */
    -webkit-transition: background-color 0.1s;
    /* Safari 和 Chrome */
    -o-transition: background-color 0.1s;

    * {
      color: #fff;
    }

    .hzy-header-btn {
      padding: 0 12px;
      cursor: pointer;
      height: 100%;
      display: inline-flex;
      justify-content: center;
      align-items: center;
    }

    .hzy-header-btn:hover {
      background: rgba(243, 246, 248, 0.2);
    }
  }
}
</style>
