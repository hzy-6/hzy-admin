<template>
  <LayoutOneLevelMenuVue />
  <div style="flex: 1 1 0%">
    <LayoutMode1 />
  </div>
</template>
<script lang="ts">
import { defineComponent } from "vue";
import LayoutOneLevelMenuVue from "./menus/LayoutOneLevelMenu.vue";
import LayoutMode1 from "./LayoutMode1.vue";

export default defineComponent({
  name: "LayoutMode2Vue",
  components: { LayoutOneLevelMenuVue, LayoutMode1 },
  setup() {
    return {};
  },
});
</script>
<style lang="less">
.ant-layout {
  background-color: #ffffff;
  .ant-layout-content {
    position: relative;
    background-color: #f0f2f5;
  }
}
</style>
