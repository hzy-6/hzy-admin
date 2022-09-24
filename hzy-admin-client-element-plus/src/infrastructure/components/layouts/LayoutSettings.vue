<script setup lang="ts">
import CoreStore from "@/infrastructure/store/layouts/CoreStore";
import SettingsStore from "@/infrastructure/store/layouts/SettingsStore";
import HeaderStore from "@/infrastructure/store/layouts/HeaderStore";
import MenuStore from "@/infrastructure/store/layouts/MenuStore";
//
const coreStore = CoreStore();
const settingsStore = SettingsStore();
const headerStore = HeaderStore();
const menuStore = MenuStore();
</script>
<template>
  <el-drawer v-model="settingsStore.state.isOpen" :with-header="false" direction="rtl" size="300px">
    <div class="hzy-settings">
      <el-divider> 头部颜色 </el-divider>
      <div class="hzy-skin-list mb-5 text-center">
        <template v-for="(item, index) in 12" :key="index">
          <div class="hzy-skin-item" :class="'hzy-layout-header-' + index" @click="headerStore.setHeaderClass('hzy-layout-header-' + index)"></div>
        </template>
      </div>
      <el-button type="success" text class="w100" @click="headerStore.setHeaderClass('')">重置</el-button>
      <el-divider> 菜单颜色 </el-divider>
      <div class="hzy-skin-list mb-5 text-center">
        <template v-for="(item, index) in menuStore.menuCustomThemes" :key="index">
          <div class="hzy-skin-item" style="border: 1px solid #67c23a;" :style="{ backgroundColor: item.backgroundColor }" @click="menuStore.onChangeMenuCustomThemesIndex(index)"></div>
        </template>
      </div>
      <el-divider v-if="!coreStore.state.isMobile"> 菜单栏模式 </el-divider>
      <div class="hzy-skin-list mb-5 text-center" v-if="!coreStore.state.isMobile">
        <el-radio-group v-model="menuStore.state.menuMode">
          <el-radio label="1">常规</el-radio>
          <el-radio label="2">顶部</el-radio>
          <el-radio label="3">左侧</el-radio>
        </el-radio-group>
      </div>
    </div>
  </el-drawer>
</template>

<style lang="less">
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
      border-radius: 5px;
    }
  }
}
</style>
