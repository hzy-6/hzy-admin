<script lang="ts" setup>
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import SysRoleService from "@/services/system/SysRoleService";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

const state = reactive({
  vm: {
    id: "",
    form: {} as any,
  },
  visible: false,
  saveLoading: false,
});

//表单实例
const refForm = ref<FormInstance>();

//向父级导出 函数
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  open: (key: string = "") => {
    state.visible = true;
    if (state.visible) {
      state.vm.id = key;
    }
    refForm.value?.resetFields();
    //初始化表单数据
    state.saveLoading = true;
    SysRoleService.findForm(key).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      state.vm = res.data;
      state.vm.form.password = "";
    });
  },
});

/**
 *保存数据
 */
function save() {
  refForm.value?.validate().then(async () => {
    state.saveLoading = true;
    const result = await SysRoleService.saveForm(state.vm.id, state.vm.form);
    if (result.code != 1) return;
    Tools.message.success("操作成功!");
    props.onSuccess();
    state.visible = false;
  });
}
</script>

<template>
  <a-modal v-model:visible="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="400">
    <template #footer>
      <a-button type="primary" :loading="state.saveLoading" @click="save()"> 提交</a-button>
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <a-spin :spinning="state.saveLoading">
      <a-form ref="refForm" layout="vertical" :model="state.vm.form">
        <a-row :gutter="[16, 0]">
          <a-col :xs="24">
            <a-form-item label="编号" name="number" :rules="[{ required: true, message: '请输入编号', trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.number" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="角色名称" name="name" :rules="[{ required: true, message: '请输入角色名称', trigger: 'blur' }]">
              <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="删除锁定">
              <a-radio-group v-model:value="state.vm.form.deleteLock">
                <a-radio :value="true">锁定</a-radio>
                <a-radio :value="false">不锁定</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="备注">
              <a-textarea v-model:value="state.vm.form.remark" placeholder="请输入" :rows="4" />
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
