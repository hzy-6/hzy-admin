<script lang="ts" setup>
import AppIcon from "@/core/components/AppIcon.vue";

const props = defineProps<{ menuInfo: any }>();
</script>

<template>
  <a-sub-menu :key="props.menuInfo.id" v-bind="$attrs">
    <template #title>
      <AppIcon :name="props.menuInfo.icon" v-if="props.menuInfo.icon"/>
      <span>{{ $t(`menu.${props.menuInfo.id}`) }}</span>
    </template>
    <template v-for="item in props.menuInfo.children?.filter((w:any) => w.show)">
      <a-menu-item v-if="!item.children || (item.children?.filter((w:any) => w.show).length == 0 && item.type == 2)"
                   :key="item.id" :title="$t(`menu.${item.id}`)">
        <AppIcon :name="item.icon" v-if="item.icon"/>
        <span>
          {{ $t(`menu.${item.id}`) }}
        </span>
      </a-menu-item>
      <LayoutMenuSub v-else :menu-info="item" :key="item.id"/>
    </template>
  </a-sub-menu>
</template>
