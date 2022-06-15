<template>
  <LayoutOneLevelMenuVue />
  <div style="flex: 1 1 0%">
    <LayoutMode1 />
  </div>
</template>
<script>
export default { name: "LayoutMode2Vue" };
</script>
<script setup>
import LayoutOneLevelMenuVue from "./menus/LayoutOneLevelMenu.vue";
import LayoutMode1 from "./LayoutMode1.vue";
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
