<script lang="ts" setup>
import { getCurrentInstance, ref, watch } from "vue";
// icons
import { getAllNameByElementPlus } from "@/infrastructure/scripts/icons";

//定义属性
const props = defineProps<{
  name: string;
  size?: number | string;
  color?: string;
}>();

const currentInstance = getCurrentInstance();
const allNames = getAllNameByElementPlus(currentInstance);
const isDefaultIcon = ref(allNames.findIndex((w: any) => w == props.name) > -1);

watch(
  () => props.name,
  () => {
    isDefaultIcon.value = allNames.findIndex((w: any) => w == props.name) > -1;
    // console.log(isDefaultIcon);
  }
);
</script>

<template>
  <el-icon :size="props.size ? props.size : 18" :color="props.color" v-if="isDefaultIcon">
    <component :is="props.name" />
  </el-icon>
  <component :is="props.name" :style="{ fontSize: (props.size ? props.size : 18) + 'px', color: props.color }" v-else />
</template>
