<script lang="ts" setup>
import LayoutMenuVue from "./menus/LayoutMenu.vue";
import CoreStore from "@/infrastructure/store/layouts/CoreStore";
import MenuStore from "@/infrastructure/store/layouts/MenuStore";
//
const coreStore = CoreStore();
const menuStore = MenuStore();
</script>

<template>
  <el-drawer
    v-model="menuStore.state.isCollapse"
    :with-header="false"
    v-if="coreStore.state.isMobile"
    direction="ltr"
    :size="menuStore.state.maxWidth"
    custom-class="layout-menu-mobile hzy-layou-menu"
  >
    <div style="min-height: 100vh" :style="{ backgroundColor: menuStore.menuCustomThemes[menuStore.state.menuCustomThemesIndex].backgroundColor }">
      <LayoutMenuVue />
    </div>
  </el-drawer>
</template>

<style lang="less">
.layout-menu-mobile {
  .el-drawer__body {
    padding: 0 !important;
  }
}
</style>
