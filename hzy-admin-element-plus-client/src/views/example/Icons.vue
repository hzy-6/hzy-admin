<script lang="ts">
// 组件命名
export default { name: "IconsVue" };
</script>
<!-- 逻辑代码 -->
<script lang="ts" setup>
import { reactive } from "vue";
import AppIconList from "@/infrastructure/components/AppIconList.vue";

const state = reactive({
  iconName: "AlipaySquareFilled",
});
</script>

<template>
  <div class="p-20">
    <a-card title="Icons 图标集合" :bordered="false" :headStyle="{ 'border-bottom': 0 }">
      <template #extra>
        <a href="https://next.antdv.com/components/icon-cn" target="_black"> 官方图标</a>
      </template>
      <AppIconList v-model:name="state.iconName" />
    </a-card>
  </div>
</template>
