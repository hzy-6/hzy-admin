<template>
  <a-drawer class="app-settings" placement="right" width="300px" :closable="false" v-model:visible="settingsStoreState.show">
    <a-divider>头部颜色</a-divider>
    <div class="app-skin-list mb-5 text-center">
      <div class="app-skin-item" v-for="(item, index) in headerStore.state.theme.classList" :key="index" :style="{ background: item.color }" @click="onHeaderTheme(item.className)"></div>
    </div>
    <a-divider>菜单颜色</a-divider>
    <div class="mt-15 text-center">
      <a-radio-group name="radioGroup" defaultValue="dark" v-model:value="menuStoreState.themeType">
        <a-radio value="dark">暗色</a-radio>
        <a-radio value="light">亮色</a-radio>
      </a-radio-group>
    </div>
    <a-divider v-if="!layoutStoreState.isMobile">左侧大菜单</a-divider>
    <div class="mt-15 text-center" v-if="!layoutStoreState.isMobile">
      <a-switch v-model:checked="menuStoreState.isOneNav" />
    </div>
  </a-drawer>
</template>
<script lang="ts">
import { defineComponent, watch, computed } from "vue";
import { useSettingsStore, useHeaderStore, useMenuStore, useLayoutStore } from "@/store";

export default defineComponent({
  name: "LayoutSettingsCom",
  setup(props, context) {
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
      setState() {
        settingsStore.isShow();
      },
      onHeaderTheme(value) {
        headerStore.onChangeThemeClass(value);
      },
    };

    return {
      ...methods,
      settingsStoreState,
      headerStore,
      menuStore,
      menuStoreState,
      layoutStoreState,
    };
  },
});
</script>
<style lang="less" scoped>
.app-settings {
  .app-skin-list {
    width: 100%;
    display: inline-block;
    .app-skin-item {
      width: 30px;
      height: 30px;
      float: left;
      margin: 8px;
      cursor: pointer;
      border-radius: 5px;
      border: 1px solid #f5222d;
    }
  }
}
</style>
