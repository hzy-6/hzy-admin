<script lang="ts" setup>
import { computed, StyleValue } from "vue";
import TabsStore from "@/core/store/layouts/TabsStore";
import AppStore from "@/core/store/AppStore";
import MenuStore, { EMenuMode } from "@/core/store/layouts/MenuStore";
import CoreStore from "@/core/store/layouts/CoreStore";
import LayoutOneLevelMenu from "./menus/LayoutMenuOneLevel.vue";
import LayoutMenuPcVue from "./LayoutMenuPc.vue";
import LayoutMenuMobileVue from "./LayoutMenuMobile.vue";

const tabsStore = TabsStore();
const appStore = AppStore();
const menuStore = MenuStore();
const coreStore = CoreStore();

const bgColor = computed(() => menuStore.menuCustomThemes[menuStore.state.menuCustomThemesIndex]?.backgroundColor);
const defaultStyle: StyleValue = { position: "fixed", bottom: 0, top: 0, backgroundColor: bgColor.value };

const _style = computed(() => {
  if (menuStore.state.menuMode == EMenuMode.left) {
    return { ...defaultStyle, display: "flex" };
  }

  return defaultStyle;
});
</script>

<template>
  <LayoutMenuMobileVue v-if="coreStore.state.isMobile" />
  <div v-else :style="_style">
    <LayoutOneLevelMenu v-if="menuStore.state.menuMode == EMenuMode.left" />
    <LayoutMenuPcVue />
  </div>
</template>
