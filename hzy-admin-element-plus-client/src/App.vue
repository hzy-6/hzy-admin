<script setup lang="ts">
import zhCn from "element-plus/lib/locale/lang/zh-cn";
import { computed } from "vue";
import CoreStore from "@/infrastructure/store/layouts/CoreStore";

const coreStore = CoreStore();
const loading = computed(() => coreStore.state.loading);
</script>

<template>
  <el-config-provider :locale="zhCn">
    <div v-loading="loading">
      <router-view />
    </div>
  </el-config-provider>
</template>
