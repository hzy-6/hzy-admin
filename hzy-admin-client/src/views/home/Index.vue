<template>
  <div>
    <!-- 标题 -->
    <!-- <h2>
      首页
      <a-button type="link" @click="visible = !visible">更多</a-button>
    </h2> -->
    <!-- 基础统计数据 -->
    <div>
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
      <a-row :gutter="[20, 20]">
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <a-card :bordered="false">
            <template #cover>
              <img alt="example" :src="image1" class="p-15" />
            </template>
          </a-card>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <a-card :bordered="false">
            <template #cover>
              <img alt="example" :src="image2" class="p-15" />
            </template>
          </a-card>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8">
          <a-card :bordered="false">
            <template #cover>
              <img alt="example" :src="image3" class="p-15" />
            </template>
          </a-card>
        </a-col>
      </a-row>
    </div>
    <!-- 抽屉 -->
    <!-- <a-drawer v-model:visible="visible" style="color: red" title="更多" placement="right" width="90%" :bodyStyle="{ 'background-color': '#f0f2f5' }">
      <Home1 />
    </a-drawer> -->
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
import image1 from "@/assets/images/下楼做核酸.png";
import image2 from "@/assets/images/核酸检测.png";
import image3 from "@/assets/images/抗疫必胜.png";

let visible = ref(false);
</script>

<style lang="less"></style>