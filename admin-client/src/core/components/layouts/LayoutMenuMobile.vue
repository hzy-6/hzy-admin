<script lang="ts" setup>
import CoreStore from "@/core/store/layouts/CoreStore";
import MenuStore from "@/core/store/layouts/MenuStore";
import AppStore from "@/core/store/AppStore";
import LayoutMenuVue from "./menus/LayoutMenu.vue";

const coreStore = CoreStore();
const menuStore = MenuStore();
const appStore = AppStore();
</script>

<template>
  <a-drawer
    placement="left"
    @close="menuStore.onChangeCollapse(!menuStore.state.isCollapse)"
    :closable="false"
    :visible="!menuStore.state.isCollapse"
    :bodyStyle="{ padding: 0 }"
    :drawerStyle="{ background: menuStore.menuCustomThemes[menuStore.state.menuCustomThemesIndex].backgroundColor }"
    width="250px"
    v-if="coreStore.state.isMobile"
    class="hzy-menu"
  >
    <!-- <div class="hzy-logo" :style="{ color: menuStore.menuCustomThemes[menuStore.state.menuCustomThemesIndex].textColor }">
      {{ appStore.state.title }}
    </div> -->
    <LayoutMenuVue />
  </a-drawer>
</template>
