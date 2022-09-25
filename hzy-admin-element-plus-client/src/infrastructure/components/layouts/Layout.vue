<script setup lang="ts">
import LayoutMode1Vue from "./LayoutMode1.vue";
import LayoutMode2Vue from "./LayoutMode2.vue";
import LayoutSettingsVue from "./LayoutSettings.vue";
import MenuStore, { EMenuMode } from "@/infrastructure/store/layouts/MenuStore";
//
const menuStore = MenuStore();
</script>

<template>
  <div class="hzy-layout">
    <LayoutMode2Vue v-if="menuStore.state.menuMode == EMenuMode.left" />
    <LayoutMode1Vue v-else />
    <!-- 设置界面 -->
    <LayoutSettingsVue />
  </div>
</template>

<style>
.hzy-layout {
  display: flex;
  width: 100%;
}
</style>