<template>
  <a-input v-model:value="cron" placeholder="请输入" @click="onClick" />
  <a-modal title="Cron表达式" v-model:visible="visible" :footer="null" :width="800" :bodyStyle="{ padding: 0 }">
    <Vue3CronCore i18n="cn" maxHeight="350px" @change="onChangeCron" v-model:value="cron" />
  </a-modal>
</template>
<script setup>
import { watch, ref, onMounted } from "vue";
import Vue3CronCore from "./vue3-cron-core/Index.vue";
var props = defineProps({
  value: String,
});
var emit = defineEmits(["update:value"]);

const visible = ref(false);
const cron = ref(null);

// onMounted(() => {
//   cron.value = props.value ;
// });

watch(
  () => cron.value,
  (value) => {
    emit("update:value", value);
    console.log("cron1", value);
  }
);

watch(
  () => props.value,
  (value) => {
    cron.value = value;
    console.log("cron", cron.value);
  }
);

const onChangeCron = (value) => {
  if (typeof value !== "string") return false;
  cron.value = value;
  visible.value = false;
};

const onClick = () => {
  visible.value = true;
};
</script>
