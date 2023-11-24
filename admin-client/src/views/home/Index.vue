<script lang="ts" setup>
import {ref} from "vue";
import WorkOrder from "./components/WorkOrder.vue";
import WorkOrderStatistics from "./components/WorkOrderStatistics.vue";
import HomeChart1 from "./components/HomeChart1.vue";
import HomeChart2 from "./components/HomeChart2.vue";
import HomeChart3 from "./components/HomeChart3.vue";
import Home1 from "./Index1.vue";
import image1 from "@/assets/images/img1.png";
import image2 from "@/assets/images/img2.png";
import image3 from "@/assets/images/img3.png";
import PageContainer from "@/core/components/PageContainer.vue";

defineOptions({name: "HomeIndexCom"});

let visible = ref(false);
</script>

<template>
  <PageContainer :show="false" class="p-16">
    <!-- 基础统计数据 -->
    <div @click="visible = !visible">
      <WorkOrder/>
    </div>

    <!-- 近一年设备销售量 -->
    <div class="mt-16">
      <a-row :gutter="[16, 16]">
        <a-col :xs="24" :sm="24" :md="12" :lg="16" :xl="16">
          <WorkOrderStatistics/>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <a href="https://gitee.com/hzy6/HzyAdmin/stargazers" target="_black">
            <img
                src="https://gitee.com/hzy6/HzyAdmin/widgets/widget_card.svg?colors=eae9d7,2e2f29,272822,484a45,eae9d7,747571"
                style="width: 100%; height: 320px"/>
          </a>
        </a-col>
      </a-row>
    </div>

    <!-- 更多图形报表 -->
    <div class="mt-16">
      <a-row :gutter="[16, 16]">
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <HomeChart1/>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <HomeChart2/>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <HomeChart3/>
        </a-col>
      </a-row>
    </div>

    <!-- 更多图形报表 -->
    <div class="mt-16">
      <a-row :gutter="[16, 16]">
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <a-card :bordered="false">
            <template #cover>
              <img alt="example" :src="image1" class="p-16"/>
            </template>
          </a-card>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <a-card :bordered="false">
            <template #cover>
              <img alt="example" :src="image2" class="p-16"/>
            </template>
          </a-card>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <a-card :bordered="false">
            <template #cover>
              <img alt="example" :src="image3" class="p-16"/>
            </template>
          </a-card>
        </a-col>
      </a-row>
    </div>
    <!-- 抽屉 -->
    <a-drawer v-model:open="visible" title="更多" placement="right" width="90%">
      <Home1/>
    </a-drawer>
  </PageContainer>
</template>

<style lang="less"></style>
