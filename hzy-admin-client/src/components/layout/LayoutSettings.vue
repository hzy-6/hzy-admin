<template>
  <a-drawer class="app-settings" placement="right" width="300px" :closable="false" v-model:visible="settingsStoreState.show">
    <a-divider>头部颜色</a-divider>
    <div class="app-skin-list mb-5 text-center">
      <template v-for="(item, index) in headerStore.state.theme.classList" :key="index">
        <div class="app-skin-item" :style="{ background: item.color }" @click="methods.onHeaderTheme(item.className)" v-if="index == 0" style="border: 1px solid #f5222d"></div>
        <div class="app-skin-item" :style="{ background: item.color }" @click="methods.onHeaderTheme(item.className)" v-else></div>
      </template>
    </div>
    <a-divider>菜单颜色</a-divider>
    <div class="mt-15 text-center">
      <a-radio-group name="radioGroup" defaultValue="dark" v-model:value="menuStoreState.themeType">
        <a-radio value="dark">暗色</a-radio>
        <!-- <a-radio value="darkOfficial">浅灰</a-radio> -->
        <a-radio value="light">亮色</a-radio>
      </a-radio-group>
    </div>
    <a-divider v-if="!layoutStoreState.isMobile">菜单栏模式</a-divider>
    <div class="mt-15 text-center" v-if="!layoutStoreState.isMobile">
      <a-radio-group name="radioGroup" :defaultValue="1" v-model:value="menuStoreState.oneLevelMenuMode">
        <a-radio :value="1">常规</a-radio>
        <a-radio :value="2">顶部</a-radio>
        <a-radio :value="3">左侧</a-radio>
      </a-radio-group>
    </div>
  </a-drawer>
</template>
<script>
export default { name: "LayoutSettingsCom" };
</script>
<script setup>
import { watch, computed } from "vue";
import { useSettingsStore, useHeaderStore, useMenuStore, useLayoutStore } from "@/store";

const settingsStore = useSettingsStore();
const settingsStoreState = computed(() => settingsStore.state);
// header
const headerStore = useHeaderStore();
//
const menuStore = useMenuStore();
const menuStoreState = computed(() => menuStore.state);
//
const layoutStore = useLayoutStore();
const layoutStoreState = computed(() => layoutStore.state);

watch(
  () => menuStoreState.value.themeType,
  (value) => {
    menuStore.onChangeTheme(value);
  }
);

const methods = {
  onHeaderTheme(value) {
    headerStore.onChangeThemeClass(value);
  },
};
</script>
<style lang="less" scoped>
.app-settings {
  .app-skin-list {
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    .app-skin-item {
      width: 35px;
      height: 35px;
      margin: 8px;
      cursor: pointer;
      border-radius: 5px;
    }
  }
}
</style>
