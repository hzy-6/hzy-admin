<script lang="ts" setup>
import router from "@/core/router";
import TabsStore from "@/core/store/layouts/TabsStore";
import Tools from "@/core/utils/Tools";

const tabsStore = TabsStore();

const isPro = process.env.NODE_ENV == "production";
const menuId = router.currentRoute.value.meta.menuId;
const token = Tools.getAuthorization();
</script>

<template>
  <!-- iframe 处理 -->
  <div v-for="item in tabsStore.state.tabs.filter((w) => w.meta.mode == 2)">
    <!-- <transition name="fade" mode="out-in"> -->
    <div v-show="item.path == $route.path">
      <iframe ref="iframe" :src="(item?.meta.moduleUrlPro as string) + '/' + menuId" frameBorder="0" v-if="isPro"></iframe>
      <iframe ref="iframe" :src="(item?.meta.moduleUrl as string) + '/' + menuId + '/' + token" frameBorder="0" v-else></iframe>
    </div>
    <!-- </transition> -->
  </div>
</template>

<style lang="less" scoped>
iframe {
  width: 100%;
  height: calc(100vh - 165px);
}
</style>
