<template>
  <a-form ref="formRef" layout="vertical" :model="state.vm.form">
    <a-row :gutter="[15, 15]">
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <a-form-item label="真实姓名" ref="name" name="name">
          <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
        </a-form-item>
      </a-col>
    </a-row>
  </a-form>
</template>
<script setup>
import { reactive } from "vue";

//定义组件事件
// const emits = defineEmits(["onSuccess"]);
const props = defineProps({
  tableName: String,
});

const state = reactive({
  vm: {
    form: {},
  },
});
</script>
