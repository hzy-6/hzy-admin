<script lang="ts" setup>
import { computed } from "vue";
import { theme } from "ant-design-vue";
import ThemeStore from "@/core/store/layouts/ThemeStore";
import MenuStore from "@/core/store/layouts/MenuStore";
import AppConsts from "@/utils/AppConsts";

const menuStore = MenuStore();
const themeStore = ThemeStore();

const { useToken } = theme;
const { token } = useToken();

const logoColor = computed(() => {
  if (token.value.Menu?.colorItemText) return token.value.Menu?.colorItemText;
  return themeStore.state.isDark ? "#ffffff" : "";
});
</script>

<template>
  <div class="hzy-logo" :style="{ color: logoColor }" v-if="!menuStore.state.isCollapse">
    {{ AppConsts.appTitle }}
  </div>
</template>

<style>
.hzy-logo {
  font-size: 16px;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 50px;
}
</style>
