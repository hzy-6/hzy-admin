<template>
  <a-input v-model:value="cron" placeholder="请输入" @click="onClick" />
  <a-modal title="Cron表达式" v-model:open="visible" :footer="null" :width="800" :bodyStyle="{ padding: 0 }">
    <Vue3CronCore i18n="cn" maxHeight="350px" @change="onChangeCron" v-model:value="cron" />
  </a-modal>
</template>
<script lang="ts" setup>
import { ref, computed } from "vue";
import Vue3CronCore from "./vue3-cron-core/Index.vue";

var props = defineProps({
  value: String,
});
var emits = defineEmits(["update:value"]);

const visible = ref(false);
const cron = computed({
  get: () => props.value,
  set: (value: string | undefined) => emits("update:value", value as string),
});

const onChangeCron = (value: string | undefined) => {
  if (typeof value !== "string") return false;
  cron.value = value;
  visible.value = false;
};

const onClick = () => {
  visible.value = true;
};
</script>
