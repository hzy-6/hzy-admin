<script lang="ts" setup>
import AppIcon from "@/infrastructure/components/AppIcon.vue";
const props = defineProps<{ menuInfo: any }>();
</script>

<template>
  <el-sub-menu :index="props.menuInfo.id + ''" v-bind="$attrs">
    <template #title>
      <i class="el-icon"> <AppIcon :name="props.menuInfo.icon" v-if="props.menuInfo.icon" class="el-icon" /> </i>
      <span style="font-weight: 400" class="el-menu-title">{{ props.menuInfo.name }}</span>
    </template>

    <template v-for="item in props.menuInfo.children">
      <el-menu-item v-if="item.children.filter((w:any) => w.show).length == 0 && item.type == 2" :index="item.jumpUrl ? item.jumpUrl : item.id + ''" :title="item.name">
        <i class="el-icon"><AppIcon :name="item.icon" v-if="item.icon" class="el-icon" /> </i>
        <span style="font-weight: 400" class="el-menu-title">{{ item.name }}</span>
      </el-menu-item>
      <LayoutMenuSub v-else :menu-info="item" />
    </template>
  </el-sub-menu>
</template>
