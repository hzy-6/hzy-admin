<script lang="ts" setup>
import TabsStore from "@/core/store/layouts/TabsStore";

const tabsStore = TabsStore();
</script>

<template>
  <!-- {{ tabsStore.state.activeKey }} -->
  <iframe frameBorder="0" v-for="item in tabsStore.state.tabs.filter((w) => w.mode == 2)" :src="item.fullPath" v-show="tabsStore.state.activeKey == item.fullPath" :key="item.fullPath"></iframe>
</template>

<style lang="less" scoped>
iframe {
  width: 100%;
  height: calc(100vh - 165px);
}
</style>
