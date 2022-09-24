<script lang="ts" setup>
import { useDark } from "@vueuse/core";
import { ref } from "vue";
import LayoutMenuVue from "./menus/LayoutMenu.vue";
import MenuStore from "@/infrastructure/store/layouts/MenuStore";
import AppConsts from "@/infrastructure/scripts/AppConsts";
//
const menuStore = MenuStore();

const isDark = ref(useDark());
</script>

<template>
  <el-aside
    :width="menuStore.state.width + 'px'"
    :class="{ 'hzy-layout-menu-dark': isDark, 'hzy-layout-menu-light': !isDark }"
    :style="{ backgroundColor: menuStore.menuCustomThemes[menuStore.state.menuCustomThemesIndex].backgroundColor }"
  >
    <div class="hzy-layou-menu">
      <template v-if="menuStore.state.menuCustomThemesIndex > 0">
        <div class="hzy-layou-menu-title" v-if="!menuStore.state.isCollapse" style="color: #ffffff">{{ AppConsts.appTitle }}</div>
      </template>
      <template v-else>
        <div class="hzy-layou-menu-title" v-if="!menuStore.state.isCollapse">{{ AppConsts.appTitle }}</div>
      </template>

      <LayoutMenuVue />
    </div>
  </el-aside>
</template>

<style lang="less" scoped>
.hzy-layou-menu {
  .el-menu {
    border-right: 0 !important;
  }
  .hzy-layou-menu-title {
    font-weight: bold;
    font-size: 20px;
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}

.el-aside {
  overflow-x: hidden;
  z-index: 7;
}

.hzy-layout-menu-dark {
  box-shadow: var(--el-box-shadow-dark);
}
.hzy-layout-menu-light {
  box-shadow: var(--el-box-shadow-light);
}
</style>