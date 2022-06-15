<template>
  <a-card title="Icons 图标集合" :bordered="false" :headStyle="{ 'border-bottom': 0 }">
    <template #extra>
      <a href="https://next.antdv.com/components/icon-cn" target="_black"> 官方图标</a>
    </template>
    <AppIconList v-model:name="state.iconName" :height="600" />
  </a-card>
</template>

<script>
export default { name: "IconsVue" };
</script>

<script setup>
import { reactive } from "vue";
import AppIconList from "@/components/AppIconList.vue";

const state = reactive({
  iconName: "AlipaySquareFilled",
});
</script>
