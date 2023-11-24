<script lang="ts" setup>
import Char1 from "./components/Chart1.vue";
import Char2 from "./components/Chart2.vue";
import PageContainer from "@/core/components/PageContainer.vue";

defineOptions({name: "ChartBaseCom"});

</script>

<template>
  <PageContainer>
    <a-alert message="图表" type="success">
      <template #description>
        <p>
          <router-link :to="{ path: '/chart/more' }">查看 AntV G2 更多示例</router-link>
        </p>
      </template>
    </a-alert>
    <a-row :gutter="[15, 15]" class="pt-16">
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <a-card hoverable>
          <Char1/>
        </a-card>
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <a-card hoverable>
          <Char2/>
        </a-card>
      </a-col>
    </a-row>
  </PageContainer>
</template>
