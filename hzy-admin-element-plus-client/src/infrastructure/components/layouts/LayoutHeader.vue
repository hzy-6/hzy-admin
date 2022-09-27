<script setup lang="ts">
import router from "@/infrastructure/router";
import LayoutOneLevelMenuVue from "./menus/LayoutOneLevelMenu.vue";

import CoreStore from "@/infrastructure/store/layouts/CoreStore";
import SettingsStore from "@/infrastructure/store/layouts/SettingsStore";
import HeaderStore from "@/infrastructure/store/layouts/HeaderStore";
import MenuStore, { EMenuMode } from "@/infrastructure/store/layouts/MenuStore";
import Tools from "@/infrastructure/scripts/Tools";
import ThemeSwitch from "@/infrastructure/components/ThemeSwitch.vue";
//
const coreStore = CoreStore();
const settingsStore = SettingsStore();
const headerStore = HeaderStore();
const menuStore = MenuStore();

// 图标大小
const iconSize: number = 20;

// 退出登录
const logOut = () => {
  Tools.confirm("您确定要退出登录吗?", () => router.push("/login"));
};

// 刷新
const onReload = () => {
  const name = router.currentRoute.value.name ? router.currentRoute.value.name : "";
  coreStore.refresh(router.currentRoute.value.fullPath, name as string);
};

const jumpDoc = () => {
  window.open("https://www.yuque.com/u378909/yidf7v", "_black");
};
</script>

<template>
  <el-header>
    <div class="hzy-layout-header" :class="headerStore.state.class">
      <!-- 菜单收缩 -->
      <el-tooltip content="菜单收展" placement="bottom">
        <div class="hzy-header-btn" @click="menuStore.onChangeCollapse(!menuStore.state.isCollapse)">
          <el-icon :size="iconSize">
            <template v-if="coreStore.state.isMobile">
              <Expand v-if="!menuStore.state.isCollapse" />
              <Fold v-else />
            </template>
            <template v-else>
              <Expand v-if="menuStore.state.isCollapse" />
              <Fold v-else />
            </template>
          </el-icon>
        </div>
      </el-tooltip>
      <div style="flex: 1 1 0%; height: 100%; display: flex" v-if="menuStore.state.menuMode == EMenuMode.top">
        <LayoutOneLevelMenuVue />
      </div>
      <div style="flex: 1 1 0%" v-else></div>
      <!-- HzyAdmin 文档 -->
      <el-tooltip content="HzyAdmin 文档" placement="bottom" v-if="!coreStore.state.isMobile">
        <div class="hzy-header-btn" @click="jumpDoc">
          <el-badge is-dot type="success">
            <el-icon :size="iconSize"><Document /></el-icon>
          </el-badge>
        </div>
      </el-tooltip>
      <!-- 刷新 -->
      <el-tooltip content="刷新" placement="bottom">
        <div class="hzy-header-btn" @click="onReload">
          <el-icon :size="iconSize"><RefreshRight /></el-icon>
        </div>
      </el-tooltip>
      <!-- 全屏 -->
      <el-tooltip :content="coreStore.state.isFullscreen ? '退出全屏' : '全屏'" placement="bottom" v-if="!coreStore.state.isMobile">
        <div class="hzy-header-btn" @click="coreStore.toggleFullscreen()">
          <el-icon :size="iconSize">
            <Minus v-if="coreStore.state.isFullscreen" />
            <FullScreen v-else />
          </el-icon>
        </div>
      </el-tooltip>
      <!-- 系统配置 -->
      <el-tooltip content="系统配置" placement="bottom">
        <div class="hzy-header-btn" @click="settingsStore.onOpen(!settingsStore.state.isOpen)">
          <el-icon :size="iconSize"><Setting /></el-icon>
        </div>
      </el-tooltip>
      <!-- 黑白主题切换 -->
      <div class="hzy-header-btn" @click="coreStore.toggleDark()">
        <ThemeSwitch :state="coreStore.state.isDark" :iconSize="iconSize" />
      </div>
      <!-- 当前登陆人 -->
      <el-dropdown>
        <div class="hzy-header-btn">
          <el-icon :size="iconSize"><User /></el-icon>&nbsp;超级管理员
        </div>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="logOut()">
              <el-icon :size="16">
                <SwitchButton />
              </el-icon>
              退出登录
            </el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </el-header>
</template>

<style lang="less" scoped>
.el-header {
  padding: 0;
}
.hzy-layout-header {
  display: flex;
  height: 100%;
  border-bottom: 1px solid var(--el-border-color-light);
  // 动画延迟
  transition: background-color 0.6s;
  -moz-transition: background-color 0.6s;
  /* Firefox 4 */
  -webkit-transition: background-color 0.6s;
  /* Safari 和 Chrome */
  -o-transition: background-color 0.6s;

  .hzy-header-btn {
    padding: 0 12px;
    cursor: pointer;
    height: 100%;
    display: inline-flex;
    justify-content: center;
    align-items: center;
  }

  .hzy-header-btn:hover {
    background: rgba(243, 246, 248, 0.5);
  }
}
</style>
<!-- 头部皮肤定义 -->
<style lang="less">
//=======// 头部 蓝色
.hzy-layout-header-0 {
  // background-color: #096dd9;
  // color: #ffffff;
  background: #2173dc;
  background: -webkit-gradient(linear, left top, right top, from(#1d42ab), color-stop(#2173dc), to(#1e93ff));
  background: linear-gradient(90deg, #1d42ab, #2173dc, #1e93ff);
  color: #ffffff;
}

.hzy-layout-header-1 {
  background-color: #8d6658;
  color: #ffffff;
}

.hzy-layout-header-2 {
  background-color: #57c7d4;
  color: #ffffff;
}

.hzy-layout-header-3 {
  background-color: #46be8a;
  color: #ffffff;
}

.hzy-layout-header-4 {
  background-color: #757575;
  color: #ffffff;
}

.hzy-layout-header-5 {
  background-color: #677ae4;
  color: #ffffff;
}

.hzy-layout-header-6 {
  background-color: #f2a654;
  color: #ffffff;
}

.hzy-layout-header-7 {
  background-color: #f96197;
  color: #ffffff;
}

.hzy-layout-header-8 {
  background-color: #926dde;
  color: #ffffff;
}

.hzy-layout-header-9 {
  background-color: #f96868;
  color: #ffffff;
}

.hzy-layout-header-10 {
  background-color: #3aa99e;
  color: #ffffff;
}

.hzy-layout-header-11 {
  background-color: #f9cd48;
  color: #ffffff;
}
</style>
