<script lang="ts">
// 组件命名
export default { name: "HomeIndexCom" };
</script>
<!-- 逻辑代码 -->
<script lang="ts" setup>
import { ref } from "vue";
import WorkOrder from "./components/WorkOrder.vue";
import WorkOrderStatistics from "./components/WorkOrderStatistics.vue";
import HomeChart1 from "./components/HomeChart1.vue";
import HomeChart2 from "./components/HomeChart2.vue";
import HomeChart3 from "./components/HomeChart3.vue";
import image1 from "@/assets/images/下楼做核酸.png";
import image2 from "@/assets/images/核酸检测.png";
import image3 from "@/assets/images/抗疫必胜.png";
import AppConsts from "@/infrastructure/scripts/AppConsts";

var now = new Date();
let visible = ref(false);
</script>

<template>
  <div class="p-20" style="background-color: var(--el-fill-color-light)">
    <!-- 基础统计数据 -->
    <div><WorkOrder /></div>
    <!-- 近一年设备销售量 -->
    <div>
      <WorkOrderStatistics />
    </div>

    <!-- 更多图形报表 -->
    <div class="mt-20">
      <el-row :gutter="20">
        <el-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8" class="mb-20">
          <HomeChart1 />
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8" class="mb-20">
          <HomeChart2 />
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8" class="mb-20">
          <HomeChart3 />
        </el-col>
      </el-row>
    </div>

    <!-- 更多图形报表 -->
    <div>
      <el-row :gutter="20">
        <el-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8" class="mb-20">
          <el-card shadow="never">
            <el-image :src="image1" fit="cover" />
          </el-card>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8" class="mb-20">
          <el-card shadow="never">
            <el-image :src="image2" fit="cover" />
          </el-card>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="8" :xl="8" class="mb-20">
          <el-card shadow="never">
            <el-image :src="image3" fit="cover" />
          </el-card>
        </el-col>
      </el-row>
    </div>
    <!-- 页脚 -->
    <el-footer class="text-center p-20"> {{ AppConsts.appTitle }} ©{{ now.getFullYear() }} author by hzy </el-footer>
  </div>
</template>

<style lang="less"></style>
