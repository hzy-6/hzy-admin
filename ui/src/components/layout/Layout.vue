<template>
  <div class="hzy-layout">
    <LayoutMode2 v-if="menuStoreState.oneLevelMenuMode == 3" />
    <LayoutMode1 v-else />
    <!--设置弹框-->
    <LayoutSettings />
  </div>
</template>
<script>
export default { name: "LayoutCom" };
</script>
<script setup>
import { computed } from "vue";
import LayoutMode1 from "./LayoutMode1.vue";
import LayoutMode2 from "./LayoutMode2.vue";
import LayoutSettings from "./LayoutSettings.vue";
import { useMenuStore } from "@/store";

const menuStore = useMenuStore();
const menuStoreState = computed(() => menuStore.state);
</script>
