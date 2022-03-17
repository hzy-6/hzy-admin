<template>
  <a-row class="work-order" :gutter="[15, 15]">
    <a-col :xs="12" :sm="12" :md="12" :lg="6" :xl="6">
      <a-card :bordered="false" hoverable>
        <a-row :gutter="[15, 15]" class="text-center">
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <AppIcon name="DashboardOutlined" :size="70" style="color: #5b8ff9" />
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <h3>CPU占用率</h3>
            <h2>{{ value1 }}%</h2>
          </a-col>
        </a-row>
      </a-card>
    </a-col>
    <a-col :xs="12" :sm="12" :md="12" :lg="6" :xl="6">
      <a-card :bordered="false" hoverable>
        <a-row :gutter="[15, 15]" class="text-center">
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <AppIcon name="CloudServerOutlined" :size="70" style="color: #61ddaa" />
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <h3>内存占用率</h3>
            <h2>{{ value2 }}%</h2>
          </a-col>
        </a-row>
      </a-card>
    </a-col>
    <a-col :xs="12" :sm="12" :md="12" :lg="6" :xl="6">
      <a-card :bordered="false" hoverable>
        <a-row :gutter="[15, 15]" class="text-center">
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <AppIcon name="LinkOutlined" :size="70" style="color: #85ce61" />
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <h3>当前在线设备</h3>
            <h2>{{ value3 }}台</h2>
          </a-col>
        </a-row>
      </a-card>
    </a-col>
    <a-col :xs="12" :sm="12" :md="12" :lg="6" :xl="6">
      <a-card :bordered="false" hoverable>
        <a-row :gutter="[15, 15]" class="text-center">
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <AppIcon name="DisconnectOutlined" :size="70" style="color: #ff7875" />
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="12">
            <h3>当前离线设备</h3>
            <h2>{{ value4 }}台</h2>
          </a-col>
        </a-row>
      </a-card>
    </a-col>
  </a-row>
</template>
<script>
export default { name: "WorkOrderCom" };
</script>
<script setup>
import { ref, onBeforeUnmount } from "vue";
import AppIcon from "@/components/AppIcon.vue";

let value1 = ref(12);
let value2 = ref(26);
let value3 = ref(107);
let value4 = ref(5);
let timer = ref(null);
timer.value = setInterval(() => {
  value1.value = Math.floor(Math.random() * 90);
  value2.value = Math.floor(Math.random() * 90);
  value3.value = Math.floor(Math.random() * 1000);
  value4.value = Math.floor(Math.random() * 500);
}, 2 * 1000);

onBeforeUnmount(() => {
  clearInterval(timer.value);
});
</script>
