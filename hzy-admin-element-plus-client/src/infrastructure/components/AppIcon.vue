<script lang="ts" setup>
//封装组件来自：https://www.xicons.org/#/
import { getCurrentInstance, ref, watch } from "vue";
// icons
import { getAllNameByElementPlus } from "@/infrastructure/scripts/icons";
import { Icon } from "@vicons/utils";

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
    console.log(isDefaultIcon);
  }
);

//style 用于兼容 antd 图标
// let style: any = props.style ? props.style : {};
// if (isAntdIcon.value) {
//   style["fontSize"] = props.size + "px";
// }
</script>

<template>
  <el-icon :size="props.size ? props.size : 18" :color="props.color" v-if="isDefaultIcon">
    <component :is="props.name" />
  </el-icon>
  <Icon :size="props.size ? props.size : 18" :color="props.color" v-else>
    <component :is="props.name" />
  </Icon>
</template>
