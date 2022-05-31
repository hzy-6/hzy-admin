<template>
  <div>
    <!-- 标题 -->
    <h2>
      首页
      <a-button type="link" @click="visible = !visible">更多</a-button>
    </h2>
    <a-alert type="error" show-icon>
      <template #icon>
        <!-- <AppIcon name="SmileOutlined" /> -->
        <smile-outlined />
      </template>
      <template #message>
        <a href="https://www.yuque.com/u378909/yidf7v" target="_blank">HzyAdmin 文档</a>
      </template>
    </a-alert>
    <!-- 基础统计数据 -->
    <div class="mt-15">
      <WorkOrder />
    </div>
    <!-- 近一年设备销售量 -->
    <div class="mt-15">
      <WorkOrderStatistics />
    </div>
    <!-- 更多图形报表 -->
    <div class="mt-15">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <HomeChart1 />
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <HomeChart2 />
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <HomeChart3 />
        </a-col>
      </a-row>
    </div>

    <!-- 更多图形报表 -->
    <div class="mt-15">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8"></a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <a-card>
            <template #cover>
              <img alt="example" :src="homebg" />
            </template>
          </a-card>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8"></a-col>
      </a-row>
    </div>
    <!-- 抽屉 -->
    <a-drawer v-model:visible="visible" style="color: red" title="更多" placement="right" width="90%" :bodyStyle="{ 'background-color': '#f0f2f5' }">
      <Home1 />
    </a-drawer>
  </div>
</template>
<script>
export default { name: "HomeIndexCom" };
</script>
<script setup>
import { ref } from "vue";
import homebg from "@/assets/home-bg.jpg";
import WorkOrder from "./components/WorkOrder.vue";
import WorkOrderStatistics from "./components/WorkOrderStatistics.vue";
import HomeChart1 from "./components/HomeChart1.vue";
import HomeChart2 from "./components/HomeChart2.vue";
import HomeChart3 from "./components/HomeChart3.vue";
import Home1 from "./Index1.vue";

let visible = ref(false);
</script>

<style lang="less"></style>
