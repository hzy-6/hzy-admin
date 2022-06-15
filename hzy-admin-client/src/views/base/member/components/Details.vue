<template>
  <div>
    我是从会员管理跳转过来的：<br />
    带过来的id参数是：{{ id }}<br />
    带过来的title参数是：{{ title }}<br />
  </div>
</template>

<script>
export default { name: "base_member_info_Details" };
</script>

<script setup>
import router from "@/router/index";
const { params } = router.currentRoute.value;
const { id, title } = params;
</script>

<style lang="less" scoped></style>
