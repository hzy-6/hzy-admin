<template>
  <div class="p-15">
    <a-spin />
  </div>
</template>
<script>
export default { name: "RedirectCom" };
</script>
<script setup>
import router from "@/router/index";

const { params, query } = router.currentRoute.value;
const { path } = params;
router.replace({ path: "/" + path, query });
</script>
