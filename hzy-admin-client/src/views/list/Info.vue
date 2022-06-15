<template>
  <a-modal v-model:visible="state.visible" title="编辑" centered @ok="state.visible = false" :width="800">
    <template #footer>
      <a-button type="primary" :loading="state.saveLoading" @click="methods.save"> 提交</a-button>
      <a-button type="primary" danger ghost @click="state.visible = false">关闭</a-button>
    </template>
    <a-row :gutter="[15, 15]">
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>年龄:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>年龄:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </a-col>
    </a-row>
  </a-modal>
</template>
<script setup>
import { reactive } from "vue";
import tools from "@/scripts/tools";

//定义组件事件
const emits = defineEmits(["onSuccess"]);

const state = reactive({
  vm: {
    id: "",
    form: {
      value: "",
    },
  },
  visible: false,
  saveLoading: false,
});

const methods = {
  //打开表单初始化
  openForm({ visible, key }) {
    state.visible = visible;
    if (visible) {
      state.vm.id = key;
      state.vm.id = key;
    }
  },
  save() {
    state.saveLoading = true;
    setTimeout(() => {
      state.saveLoading = false;
      emits("onSuccess", 1);
      tools.message("提交成功!", "成功");
      state.visible = false;
    }, 1000);
  },
};

//向父级导出 函数
defineExpose({ ...methods });
</script>
