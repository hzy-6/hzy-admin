<script lang="ts" setup>
import CoreStore from "@/core/store/layouts/CoreStore";
import MenuStore from "@/core/store/layouts/MenuStore";
import LayoutMenuVue from "./menus/LayoutMenu.vue";
import { theme } from "ant-design-vue";
import LayoutLogoVue from "./LayoutLogo.vue";

const coreStore = CoreStore();
const menuStore = MenuStore();

const { useToken } = theme;
const { token } = useToken();
</script>

<template>
  <a-drawer
    placement="left"
    @close="menuStore.onChangeCollapse(!menuStore.state.isCollapse)"
    :closable="false"
    :open="!menuStore.state.isCollapse"
    :bodyStyle="{ padding: 0 }"
    :drawerStyle="{ background: token.Menu?.colorItemBg }"
    width="250px"
    v-if="coreStore.state.isMobile"
    class="hzy-menu"
  >
    <LayoutLogoVue />
    <LayoutMenuVue />
  </a-drawer>
</template>
