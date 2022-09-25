<script lang="ts">
// 组件命名
import { defineComponent } from "vue";
import AppConsts from "../scripts/AppConsts";
export default defineComponent({
  name: "404",
});
</script>
<!-- 逻辑代码 -->
<script lang="ts" setup>
import router from "@/infrastructure/router";

const backHome = () => {
  router.push(AppConsts.defaultHomePageInfo.jumpUrl);
};
</script>

<template>
  <el-result title="404" sub-title="找不到页面">
    <template #icon>
      <img src="../../assets/images/404.png" />
    </template>
    <template #extra>
      <el-button type="primary" @click="backHome">回到首页</el-button>
    </template>
  </el-result>
</template>
