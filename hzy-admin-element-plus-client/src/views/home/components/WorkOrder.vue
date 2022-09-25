<script lang="ts" setup>
import { ref, onBeforeUnmount } from "vue";
import AppIcon from "@/infrastructure/components/AppIcon.vue";

let value1 = ref(12);
let value2 = ref(26);
let value3 = ref(107);
let value4 = ref(5);
let timer = ref<NodeJS.Timer | null>(null);
timer.value = setInterval(() => {
  value1.value = Math.floor(Math.random() * 90);
  value2.value = Math.floor(Math.random() * 90);
  value3.value = Math.floor(Math.random() * 1000);
  value4.value = Math.floor(Math.random() * 500);
}, 2 * 1000);

onBeforeUnmount(() => {
  if (timer.value) {
    clearInterval(timer.value);
  }
});
</script>

<template>
  <el-row class="work-order" :gutter="20">
    <el-col :xs="12" :sm="12" :md="12" :lg="6" :xl="6" class="mb-20">
      <el-card :bordered="false" hoverable :bodyStyle="{ background: '#5b8ff9', padding: 0 }">
        <el-row :gutter="20" class="text-center">
          <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" style="display: flex; justify-content: center; align-items: center">
            <AppIcon name="DashboardOutlined" :size="70" style="color: #fff" />
          </el-col>
          <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <h3 style="color: #fff">CPU占用率(%)</h3>
            <h2 style="color: #fff">{{ value1 }}</h2>
          </el-col>
        </el-row>
      </el-card>
    </el-col>
    <el-col :xs="12" :sm="12" :md="12" :lg="6" :xl="6" class="mb-20">
      <el-card :bordered="false" hoverable :bodyStyle="{ background: '#61ddaa', padding: 0 }">
        <el-row :gutter="20" class="text-center">
          <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" style="display: flex; justify-content: center; align-items: center">
            <AppIcon name="CloudServerOutlined" :size="70" style="color: #fff" />
          </el-col>
          <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <h3 style="color: #fff">内存占用率(%)</h3>
            <h2 style="color: #fff">{{ value2 }}</h2>
          </el-col>
        </el-row>
      </el-card>
    </el-col>
    <el-col :xs="12" :sm="12" :md="12" :lg="6" :xl="6" class="mb-20">
      <el-card :bordered="false" hoverable :bodyStyle="{ background: '#85ce61', padding: 0 }">
        <el-row :gutter="20" class="text-center">
          <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" style="display: flex; justify-content: center; align-items: center">
            <AppIcon name="LinkOutlined" :size="70" style="color: #fff" />
          </el-col>
          <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <h3 style="color: #fff">当前在线设备(台)</h3>
            <h2 style="color: #fff">{{ value3 }}</h2>
          </el-col>
        </el-row>
      </el-card>
    </el-col>
    <el-col :xs="12" :sm="12" :md="12" :lg="6" :xl="6" class="mb-20">
      <el-card :bordered="false" hoverable :bodyStyle="{ background: '#ff7875', padding: 0 }">
        <el-row :gutter="20" class="text-center">
          <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" style="display: flex; justify-content: center; align-items: center">
            <AppIcon name="DisconnectOutlined" :size="70" style="color: #fff" />
          </el-col>
          <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <h3 style="color: #fff">当前离线设备(台)</h3>
            <h2 style="color: #fff">{{ value4 }}</h2>
          </el-col>
        </el-row>
      </el-card>
    </el-col>
  </el-row>
</template>