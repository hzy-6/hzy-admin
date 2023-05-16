<script lang="ts" setup>
import AppIcon from "@/core/components/AppIcon.vue";
const props = defineProps<{ menuInfo: any }>();
</script>

<template>
  <a-sub-menu :key="props.menuInfo.id" v-bind="$attrs">
    <template #title>
      <span>
        <AppIcon :name="props.menuInfo.icon" v-if="props.menuInfo.icon" />
        <span>{{ props.menuInfo.name }}</span>
      </span>
    </template>
    <template v-for="item in props.menuInfo.children?.filter((w:any) => w.show)">
      <a-menu-item v-if="!item.children || (item.children?.filter((w:any) => w.show).length == 0 && item.type == 2)" :key="item.id" :title="item.name">
        <AppIcon :name="item.icon" v-if="item.icon" />
        <span>{{ item.name }}</span>
      </a-menu-item>
      <LayoutMenuSub v-else :menu-info="item" :key="item.id" />
    </template>
  </a-sub-menu>
</template>
