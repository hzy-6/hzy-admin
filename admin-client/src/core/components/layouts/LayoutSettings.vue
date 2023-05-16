<script lang="ts" setup>
import LayoutStore from "@/core/store/layouts/CoreStore";
import MenuStore from "@/core/store/layouts/MenuStore";
import HeaderStore from "@/core/store/layouts/HeaderStore";
import SettingsStore from "@/core/store/layouts/SettingsStore";
import ThemeStore from "@/core/store/layouts/ThemeStore";

const layoutStore = LayoutStore();
const menuStore = MenuStore();
const headerStore = HeaderStore();
const settingsStore = SettingsStore();
const themeStore = ThemeStore();
</script>

<template>
  <a-drawer class="hzy-settings" placement="right" width="300px" :closable="false" v-model:visible="settingsStore.state.show">
    <a-divider>品牌色</a-divider>
    <div class="hzy-skin-list mb-5 text-center">
      <template v-for="(item, index) in themeStore.colorPrimaryList" :key="index">
        <div class="hzy-skin-item" :style="{ backgroundColor: item }" @click="themeStore.changeColorPrimary(item)"></div>
      </template>
    </div>
    <a-button block @click="headerStore.changeUseColorPrimary()">{{ headerStore.state.useColorPrimary ? "头部不使用品牌色" : "头部使用品牌色" }}</a-button>
    <a-divider>菜单颜色</a-divider>
    <div class="mt-16 text-center">
      <div class="hzy-skin-list mb-5 text-center">
        <template v-for="(item, index) in themeStore.menuThemeList" :key="index">
          <div class="hzy-skin-item" style="border: 1px solid #67c23a" :style="{ backgroundColor: item.colorItemBg }" @click="themeStore.changeMenuTheme(index)"></div>
        </template>
      </div>
    </div>
    <a-divider v-if="!layoutStore.state.isMobile">菜单栏模式</a-divider>
    <div class="mt-16 text-center" v-if="!layoutStore.state.isMobile">
      <a-radio-group name="radioGroup" defaultValue="1" v-model:value="menuStore.state.menuMode">
        <a-radio value="1">默认</a-radio>
        <a-radio value="2">顶部</a-radio>
        <a-radio value="3">左侧</a-radio>
      </a-radio-group>
    </div>
  </a-drawer>
</template>

<style lang="less" scoped>
.hzy-settings {
  .hzy-skin-list {
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    .hzy-skin-item {
      width: 40px;
      height: 40px;
      margin: 8px;
      cursor: pointer;
      border-radius: 8px;
    }
  }
}
</style>
