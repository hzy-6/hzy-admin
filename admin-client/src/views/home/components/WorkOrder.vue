<script lang="ts" setup>
import { ref, onBeforeUnmount } from "vue";
import AppIcon from "@/core/components/AppIcon.vue";

let value1 = ref(12);
let value2 = ref(26);
let value3 = ref(107);
let value4 = ref(5);
let iconSize = ref(60);
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
  <a-row class="work-order" :gutter="[16, 16]">
    <a-col :xs="24" :sm="12" :md="12" :lg="6" :xl="6">
      <a-card :bordered="false" hoverable :style="{ background: '#5b8ff9' }" :bodyStyle="{ padding: 0 }">
        <a-row class="text-center p-16">
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12" class="icon">
            <AppIcon name="DashboardOutlined" :size="iconSize" style="color: #fff" />
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <h3 style="color: #fff">CPU占用率</h3>
            <h2 style="color: #fff">{{ value1 }}%</h2>
          </a-col>
        </a-row>
      </a-card>
    </a-col>
    <a-col :xs="24" :sm="12" :md="12" :lg="6" :xl="6">
      <a-card :bordered="false" hoverable :style="{ background: '#61ddaa' }" :bodyStyle="{ padding: 0 }">
        <a-row class="text-center p-16">
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12" class="icon">
            <AppIcon name="CloudServerOutlined" :size="iconSize" style="color: #fff" />
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <h3 style="color: #fff">内存占用率</h3>
            <h2 style="color: #fff">{{ value2 }}%</h2>
          </a-col>
        </a-row>
      </a-card>
    </a-col>
    <a-col :xs="24" :sm="12" :md="12" :lg="6" :xl="6">
      <a-card :bordered="false" hoverable :style="{ background: '#85ce61' }" :bodyStyle="{ padding: 0 }">
        <a-row class="text-center p-16">
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12" class="icon">
            <AppIcon name="LinkOutlined" :size="iconSize" style="color: #fff" />
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <h3 style="color: #fff">当前在线设备</h3>
            <h2 style="color: #fff">{{ value3 }}台</h2>
          </a-col>
        </a-row>
      </a-card>
    </a-col>
    <a-col :xs="24" :sm="12" :md="12" :lg="6" :xl="6">
      <a-card :bordered="false" hoverable :style="{ background: '#ff7875' }" :bodyStyle="{ padding: 0 }">
        <a-row class="text-center p-16">
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12" class="icon">
            <AppIcon name="DisconnectOutlined" :size="iconSize" style="color: #fff" />
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <h3 style="color: #fff">当前离线设备</h3>
            <h2 style="color: #fff">{{ value4 }}台</h2>
          </a-col>
        </a-row>
      </a-card>
    </a-col>
  </a-row>
</template>

<style lang="less">
.icon {
  display: flex;
  justify-content: center;
}
</style>
