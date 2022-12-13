<script lang="ts" setup>
import { getCurrentInstance, ref, watch } from "vue";
// icons
import { getAllNameByElementPlus } from "@/core/utils/icons";

//定义属性
const props = defineProps<{
  name: string;
  size?: number | string;
  color?: string;
  style?: Object | string;
  class?: Object | string;
  /**
   * antdv 仅适用双色图标。设置双色图标的主要颜色	string (十六进制颜色)
   */
  twoToneColor?: string;
}>();

const currentInstance = getCurrentInstance();
const allNames = getAllNameByElementPlus(currentInstance);
const isDefaultIcon = ref(allNames.findIndex((w: any) => w == props.name) > -1);

watch(
  () => props.name,
  (value) => {
    isDefaultIcon.value = allNames.findIndex((w: any) => w == value) > -1;
  }
);
</script>

<template>
  <i
    :style="{ width: (props.size ? props.size : 14) + 'px', height: (props.size ? props.size : 14) + 'px', color: props.color, ...(props.style as Object) }"
    :color="$props.color"
    :class="props.class"
    v-if="isDefaultIcon"
  >
    <component :is="props.name" />
  </i>
  <component
    :is="props.name"
    :fill="props.color"
    :style="{ fontSize:(props.size ? props.size : 14) + 'px', color: props.color, ...(props.style as Object) }"
    :class="props.class"
    :twoToneColor="props.twoToneColor"
    v-else
  />
</template>
