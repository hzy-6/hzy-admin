<script lang="ts" setup>
import router from "@/core/router";
defineOptions({ name: "404" });

function goHome() {
  router.push("/home");
}
</script>

<template>
  <a-result status="404" title="404" sub-title="对不起，您访问的页面不存在。">
    <template #extra>
      <a-button type="primary" @click="goHome()"> 回退 </a-button>
    </template>
  </a-result>
</template>
