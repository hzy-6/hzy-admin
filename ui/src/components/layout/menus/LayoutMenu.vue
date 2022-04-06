<template>
  <a-menu :theme="menuStoreState.themeType" mode="inline" @select="onMenuSelected" v-model:selectedKeys="selectedKeys" v-model:openKeys="openKeys">
    <!-- 动态生成 topnav-->
    <template v-if="menuStoreState.oneLevelMenuMode != 1">
      <template v-for="item in appStoreState.subMenus">
        <a-menu-item v-if="item.children.length === 0" :key="item.jumpUrl ? item.jumpUrl : item.id" :title="item.name">
          <AppIcon :name="item.icon" />
          <span>{{ item.name }}</span>
        </a-menu-item>
        <LayoutSubMenu v-else :menu-info="item" :key="item.id" />
      </template>
    </template>
    <template v-else>
      <template v-for="item in appStoreState.userInfo.menus">
        <a-menu-item v-if="item.children.length === 0" :key="item.jumpUrl ? item.jumpUrl : item.id" :title="item.name">
          <AppIcon :name="item.icon" />
          <span>{{ item.name }}</span>
        </a-menu-item>
        <LayoutSubMenu v-else :menu-info="item" :key="item.id" />
      </template>
    </template>
  </a-menu>
</template>
<script lang="ts">
import { defineComponent, computed, reactive, watch, toRefs } from "vue";
import { useLayoutStore, useTabsStore, useMenuStore, useHeaderStore, useAppStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import router from "@/router/index";
import LayoutSubMenu from "./LayoutSubMenu.vue";

export default defineComponent({
  name: "LayoutMenusCom",
  components: { AppIcon, LayoutSubMenu },
  setup() {
    //layout
    const layoutStore = useLayoutStore();
    const layoutStoreState = computed(() => layoutStore.state);
    //tabs
    const tabsStore = useTabsStore();
    const tabsStoreState = computed(() => tabsStore.state);
    //menu
    const menuStore = useMenuStore();
    const menuStoreState = computed(() => menuStore.state);
    //header
    const headerStore = useHeaderStore();
    const headerStoreState = computed(() => headerStore.state);
    //app
    const appStore = useAppStore();
    const appStoreState = computed(() => appStore.state);
    //
    const currentRoutePath = computed(() => router.currentRoute.value.fullPath);

    const state = reactive({
      defaultSelectedKeys: [currentRoutePath.value],
      selectedKeys: [currentRoutePath.value],
      openKeys: getOpenMenuKeys(),
    });

    watch(
      () => router.currentRoute.value,
      (value) => {
        state.selectedKeys = [value.fullPath];
      }
    );

    //菜单选中
    const onMenuSelected = (obj) => {
      if (obj.key.indexOf("http://") > -1 || obj.key.indexOf("https://") > -1) {
        router.push("/external/jump/" + obj.key);
      } else {
        router.push(obj.key);
      }
    };

    /**
     * 获取当前打开的菜单 并找到他的所有父级
     * @returns
     */
    function getOpenMenuKeys() {
      let route = router.currentRoute.value;
      let levelCode = route.meta.levelCode as any;
      if (!levelCode) return [];
      var keys = [];
      if (levelCode.indexOf(".") > -1) {
        var ids = levelCode.split(".");
        for (var i = 0; i < ids.length - 1; i++) {
          var id = ids[i];
          keys.push(parseInt(id));
        }
      }
      return keys;
    }

    return { ...toRefs(state), layoutStoreState, tabsStoreState, menuStoreState, headerStoreState, menuStore, appStoreState, onMenuSelected, currentRoutePath };
  },
});
</script>
