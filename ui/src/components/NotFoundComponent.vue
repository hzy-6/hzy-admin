<template>
  <a-result status="404" title="404" sub-title="对不起，您访问的页面不存在。">
    <template #extra>
      <a-button type="primary" @click="backHome"> 回到首页 </a-button>
    </template>
  </a-result>
</template>
<script>
import router from "@/router";

export default { name: "NotFoundComponentCom" };
</script>
<script setup>
const backHome = () => {
  router.push("/home");
};
</script>
