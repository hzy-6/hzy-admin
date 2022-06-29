<template>
  <a-modal v-model:visible="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="500">
    <template #footer>
      <a-button type="primary" @click="methods.saveForm()" :loading="state.saveLoading">提交</a-button>
      <a-button type="danger" ghost @click="state.visible = false" class="ml-15">关闭</a-button>
    </template>
    <a-spin :spinning="state.saveLoading">
      <a-form layout="vertical" :model="state.vm.form">
        <a-row :gutter="[15, 15]">
          <a-col :xs="24">
            <a-form-item label="序号">
              <a-input-number id="inputNumber" v-model:value="state.vm.form.sort" :min="0" :max="50" class="w100" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="编码">
              <a-input v-model:value="state.vm.form.code" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="分组名称/键">
              <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="值">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入" />
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
<script setup>
import { reactive } from "vue";
import tools from "@/scripts/tools";
import service from "@/service/system/dictionary_service";

//定义组件事件
const emits = defineEmits(["onSuccess"]);

const state = reactive({
  vm: {
    id: "",
    form: {},
  },
  visible: false,
  saveLoading: false,
});

const methods = {
  findForm() {
    state.saveLoading = true;
    return new Promise((resolve) => {
      service.findForm(state.vm.id).then((res) => {
        state.saveLoading = false;
        if (res.code != 1) return;
        state.vm = res.data;
        resolve(res);
      });
    });
  },
  saveForm() {
    state.saveLoading = true;
    service.saveForm(state.vm.form).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      tools.message("操作成功!", "成功");
      emits("onSuccess", res.data);
      state.visible = false;
    });
  },
  //打开表单初始化
  openForm({ visible, key, parentId }) {
    state.visible = visible;
    if (visible) {
      state.vm.id = key;
      methods.findForm().then((res) => {
        //对列表页传递过来的父级id 处理
        if (parentId) state.vm.form.parentId = parentId;
      });
    }
  },
};
// 暴露函数或者属性到外部
defineExpose({ ...methods });
</script>
<style lang="less" scoped>
.ant-form-item {
  margin-bottom: 0;
}
</style>
