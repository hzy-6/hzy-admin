<template>
  <a-sub-menu :key="menuInfo.id" v-bind="$attrs">
    <template #title>
      <span>
        <AppIcon :name="menuInfo.icon" />
        <span>{{ menuInfo.name }}</span>
      </span>
    </template>
    <template v-for="item in menuInfo.children.filter((w) => w.show)">
      <a-menu-item v-if="item.children.filter((w) => w.show).length == 0 && item.type == 2" :key="item.jumpUrl ? item.jumpUrl : item.id" :title="item.name">
        <AppIcon :name="item.icon" />
        <span>{{ item.name }}</span>
      </a-menu-item>
      <LayoutSubMenu v-else :menu-info="item" :key="item.id" />
    </template>
  </a-sub-menu>
</template>
<script>
export default { name: "LayoutSubMenusCom" };
</script>
<script setup>
import AppIcon from "@/components/AppIcon.vue";
defineProps(["menuInfo"]);
</script>
