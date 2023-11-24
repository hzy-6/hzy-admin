<script lang="ts" setup>
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import SysPostService from "@/services/system/SysPostService";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

const state = reactive({
  vm: {
    id: "",
    form: {} as any,
  },
  visible: false,
  loading: false,
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
    state.loading = true;
    SysPostService.findForm(key).then((res) => {
      state.loading = false;
      if (res.code != 200) return;
      state.vm = res.data;
    });
  },
});

/**
 *保存数据
 */
function save() {
  refForm.value?.validate().then(async () => {
    try {
      state.loading = true;
      const result = await SysPostService.saveForm(state.vm.id, state.vm.form);
      state.loading = false;
      if (result.code != 200) return;
      Tools.message.success("操作成功!");
      props.onSuccess();
      state.visible = false;
    } catch (error) {
      state.loading = false;
    }
  });
}
</script>

<template>
  <a-modal v-model:open="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="400">
    <template #footer>
      <a-button type="primary" :loading="state.loading" @click="save()"> 提交</a-button>
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <a-spin :spinning="state.loading">
      <a-form ref="refForm" layout="vertical" :model="state.vm.form">
        <a-row :gutter="[16, 0]">
          <a-col :xs="24">
            <a-form-item label="编号" name="number">
              <a-input-number v-model:value="state.vm.form.number" :min="1" :max="999" class="w100" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="岗位编码" name="code">
              <a-input v-model:value="state.vm.form.code" placeholder="请输入" :rules="[{ required: true, message: '请输入岗位编码', trigger: 'blur' }]" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="名称" name="name">
              <a-input v-model:value="state.vm.form.name" placeholder="请输入" :rules="[{ required: true, message: '请输入名称', trigger: 'blur' }]" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="状态">
              <a-radio-group v-model:value="state.vm.form.state">
                <a-radio :value="1">正常</a-radio>
                <a-radio :value="2">停用</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="备注">
              <a-textarea v-model:value="state.vm.form.remarks" placeholder="请输入" :rows="4" />
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
