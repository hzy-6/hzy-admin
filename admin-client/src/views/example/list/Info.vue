<script lang="ts" setup>
import {reactive, ref} from "vue";
import Tools from "@/core/utils/Tools";
import {FormInstance} from "ant-design-vue";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

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

const refForm = ref<FormInstance>();

//向父级导出 函数
defineExpose({
  /**
   * 打开表单初始化
   * @param param0
   */
  open: ({key}: { key: string }) => {
    state.visible = true;
    if (state.visible) {
      state.vm.id = key;
    }
  },
});

/**
 *保存数据
 */
function save() {
  refForm.value?.validate().then(() => {
    state.saveLoading = true;
    setTimeout(() => {
      state.saveLoading = false;
      props.onSuccess();
      Tools.message.success("提交成功!");
      state.visible = false;
    }, 1000);
  });
}
</script>

<template>
  <a-modal v-model:open="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false"
           :width="800">
    <template #footer>
      <a-button type="primary" :loading="state.saveLoading" @click="save()"> 提交</a-button>
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <!--    v-drag-->
    <a-spin :spinning="state.saveLoading">
      <a-form ref="refForm" layout="vertical" :model="state.vm.form">
        <a-row :gutter="[16, 0]">
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="用户名" ref="value" name="value" :rules="[{ required: true, trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入"/>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="年龄" ref="value" name="value" :rules="[{ required: true, trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入"/>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="地址" ref="value" name="value" :rules="[{ required: true, trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入"/>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="用户名" ref="value" name="value" :rules="[{ required: true, trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入"/>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="年龄" ref="value" name="value" :rules="[{ required: true, trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入"/>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="地址" ref="value" name="value" :rules="[{ required: true, trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入"/>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="用户名" ref="value" name="value" :rules="[{ required: true, trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入"/>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="年龄" ref="value" name="value" :rules="[{ required: true, trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入"/>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="地址" ref="value" name="value" :rules="[{ required: true, trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.value" placeholder="请输入"/>
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
