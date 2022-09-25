<template>
  <a-row :gutter="[15, 15]">
    <a-col :span="12">
      <X6_1 />
    </a-col>
    <a-col :span="12">
      <X6_2 />
    </a-col>
    <a-col :span="24">
      <X6_3 />
    </a-col>
  </a-row>
</template>

<script>
export default { name: "X6Com" };
</script>
<script setup>
import X6_1 from "./Index1.vue";
import X6_2 from "./Index2.vue";
import X6_3 from "./Index3.vue";
</script>
