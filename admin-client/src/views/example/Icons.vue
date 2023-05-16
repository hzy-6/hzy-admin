<script lang="ts" setup>
import { reactive } from "vue";
import AppIconList from "@/core/components/AppIconList.vue";
import PageContainer from "@/core/components/PageContainer.vue";
defineOptions({ name: "IconsVue" });

const state = reactive({
  iconName: "AlipaySquareFilled",
});
</script>

<template>
  <PageContainer :show="false">
    <a-card title="Icons 图标集合" :bordered="false" :headStyle="{ 'border-bottom': 0 }">
      <template #extra>
        <a href="https://next.antdv.com/components/icon-cn" target="_black"> 官方图标</a>
      </template>
      <AppIconList v-model:name="state.iconName" :height="600" />
    </a-card>
  </PageContainer>
</template>
