<script lang="ts" setup>
import { reactive } from "vue";
import Tools, { EMessageType } from "@/infrastructure/scripts/Tools";

//定义组件事件
const emits = defineEmits<{
  (e: "onSuccess", value: number): void;
}>();

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

/**
 * 打开表单初始化
 */
function openForm({ visible, key }: { visible: boolean; key: string }) {
  state.visible = visible;
  if (visible) {
    state.vm.id = key;
    state.vm.id = key;
  }
}

function save() {
  state.saveLoading = true;
  setTimeout(() => {
    state.saveLoading = false;
    emits("onSuccess", 1);
    Tools.message("提交成功!", EMessageType.成功);
    state.visible = false;
  }, 1000);
}

//向父级导出 函数
defineExpose({ openForm });
</script>

<template>
  <el-dialog v-model="state.visible" title="编辑" centered @ok="state.visible = false" :width="800">
    <template #footer>
      <el-button plain type="primary" v-loading="state.saveLoading" @click="save()"> 提交</el-button>
      <el-button plain type="danger" @click="state.visible = false">关闭</el-button>
    </template>
    <el-row :gutter="20">
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>年龄:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>年龄:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
      <el-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <el-input v-model:value="state.vm.form.value" placeholder="请输入" />
      </el-col>
    </el-row>
  </el-dialog>
</template>
