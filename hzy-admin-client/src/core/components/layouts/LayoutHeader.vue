<script lang="ts" setup>
import router from "@/core/router";
import AppIcon from "@/core/components/AppIcon.vue";
import { useFullscreen } from "@vueuse/core";
import LayoutOneLevelMenu from "./menus/LayoutMenuOneLevel.vue";
import AppStore from "@/core/store/AppStore";
import CoreStore from "@/core/store/layouts/CoreStore";
import MenuStore, { EMenuMode } from "@/core/store/layouts/MenuStore";
import HeaderStore from "@/core/store/layouts/HeaderStore";
import SettingsStore from "@/core/store/layouts/SettingsStore";
import Tools from "@/core/utils/Tools";

const appStore = AppStore();
const coreStore = CoreStore();
const menuStore = MenuStore();
const headerStore = HeaderStore();
const settingsStore = SettingsStore();

const { isFullscreen, enter, exit, toggle } = useFullscreen();

// 退出登录
function logOut() {
  Tools.confirm("您确定要退出登录吗?", () => router.push("/login"));
}

// 刷新
function onReload() {
  coreStore.refresh(router.currentRoute.value.fullPath);
}

//文档地址
function jumpDoc() {
  window.open("https://www.yuque.com/u378909/yidf7v", "_black");
}

//pro
function jumpPro() {
  window.open("http://124.221.128.7:6600/", "_black");
}
</script>

<template>
  <a-layout-header class="hzy-layout-header" :class="headerStore.state.themeClass">
    <div class="hzy-header-btn" @click="menuStore.onChangeCollapse(!menuStore.state.isCollapse)">
      <!-- <a-tooltip>
        <template #title>菜单收展</template>
        <AppIcon :name="menuStore.state.isCollapse ? 'MenuUnfoldOutlined' : 'MenuFoldOutlined'" :size="16" />
      </a-tooltip> -->
      <AppIcon :name="menuStore.state.isCollapse ? 'MenuUnfoldOutlined' : 'MenuFoldOutlined'" :size="16" />
    </div>
    <div style="flex: 1 1 0%; height: 100%; display: flex" v-if="menuStore.state.menuMode == EMenuMode.top">
      <LayoutOneLevelMenu />
    </div>
    <div style="flex: 1 1 0%" v-else></div>
    <!-- Pro -->
    <div class="hzy-header-btn text-danger" @click="jumpPro()" style="font-weight: bold" v-if="!coreStore.state.isMobile">Pro By React</div>
    <!-- HzyAdmin 文档 -->
    <a-tooltip>
      <template #title>HzyAdmin 文档</template>
      <div class="hzy-header-btn" @click="jumpDoc" v-if="!coreStore.state.isMobile">
        <a-badge status="success" dot>
          <AppIcon name="rocket-outlined" :size="16" />
        </a-badge>
      </div>
    </a-tooltip>
    <!-- 刷新当前选项卡 -->
    <a-tooltip>
      <template #title>刷新当前选项卡</template>
      <div class="hzy-header-btn" @click="onReload">
        <AppIcon name="ReloadOutlined" :size="16" />
      </div>
    </a-tooltip>
    <!-- 界面设置 -->
    <a-tooltip>
      <template #title>界面设置</template>
      <div class="hzy-header-btn" @click="settingsStore.isShow()">
        <AppIcon name="SettingOutlined" :size="16" />
      </div>
    </a-tooltip>
    <!-- 全屏 -->
    <a-tooltip>
      <template #title>全屏</template>
      <div class="hzy-header-btn" @click="toggle" v-if="!coreStore.state.isMobile">
        <AppIcon :name="isFullscreen ? 'FullscreenExitOutlined' : 'FullscreenOutlined'" :size="16" />
      </div>
    </a-tooltip>
    <div class="hzy-header-btn">
      <a-dropdown>
        <div>
          <AppIcon name="UserOutlined" :size="16" />
          &nbsp;&nbsp;
          <span>{{ appStore.state.userInfo.name ? appStore.state.userInfo.name : "未知用户" }}</span>
        </div>
        <template #overlay>
          <a-menu>
            <a-menu-item @click="logOut">
              <a href="javascript:;"> <AppIcon name="LogoutOutlined" />&nbsp;&nbsp;退出登录 </a>
            </a-menu-item>
          </a-menu>
        </template>
      </a-dropdown>
    </div>
  </a-layout-header>
</template>

<style lang="less">
.hzy-layout {
  //覆盖样式
  .ant-layout-header {
    position: relative;
    z-index: 6;
    width: 100%;
    height: auto !important;
    line-height: normal !important;
    border-bottom: 1px solid #f0f2f5;
  }

  //=======// 头部
  .hzy-layout-header {
    padding: 0;
    position: relative;
    display: flex;
    align-items: center;
    height: 50px !important;
    //
    transition: background-color 0.1s;
    -moz-transition: background-color 0.1s;
    /* Firefox 4 */
    -webkit-transition: background-color 0.1s;
    /* Safari 和 Chrome */
    -o-transition: background-color 0.1s;

    background: none;

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
<!-- 头部皮肤定义 -->
<style lang="less">
//=======// 头部 蓝色
.hzy-layout-header-0 {
  background: #2173dc !important;
  background: -webkit-gradient(linear, left top, right top, from(#1d42ab), color-stop(#2173dc), to(#1e93ff)) !important;
  background: linear-gradient(90deg, #1d42ab, #2173dc, #1e93ff) !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-1 {
  background-color: #8d6658 !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-2 {
  background-color: #57c7d4 !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-3 {
  background-color: #46be8a !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-4 {
  background-color: #757575 !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-5 {
  background-color: #677ae4 !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-6 {
  background-color: #f2a654 !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-7 {
  background-color: #f96197 !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-8 {
  background-color: #926dde !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-9 {
  background-color: #f96868 !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-10 {
  background-color: #3aa99e !important;
  * {
    color: #ffffff !important;
  }
}

.hzy-layout-header-11 {
  background-color: #f9cd48 !important;
  * {
    color: #ffffff !important;
  }
}
</style>
