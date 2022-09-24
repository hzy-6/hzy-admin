<script lang="ts" setup>
import AppIcon from "@/infrastructure/components/AppIcon.vue";
const props = defineProps<{ menuInfo: any }>();
</script>

<template>
  <el-sub-menu :index="props.menuInfo.id + ''" v-bind="$attrs">
    <template #title>
      <AppIcon :name="props.menuInfo.icon" v-if="props.menuInfo.icon" />
      <span style="font-weight: 400">{{ props.menuInfo.name }}</span>
    </template>

    <template v-for="item in props.menuInfo.children">
      <el-menu-item v-if="item.children.length === 0" :index="item.jumpUrl ? item.jumpUrl : item.id + ''" :title="item.name">
        <AppIcon :name="item.icon" v-if="item.icon" />
        <span style="font-weight: 400">{{ item.name }}</span>
      </el-menu-item>
      <LayoutMenuSub v-else :menu-info="item" />
    </template>
  </el-sub-menu>
</template>