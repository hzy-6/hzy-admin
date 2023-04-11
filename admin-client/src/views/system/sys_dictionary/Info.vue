<script lang="ts" setup>
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import SysDictionaryService from "@/services/system/SysDictionaryService";

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
  open: (key: string | null = "", parentId: string = "") => {
    state.visible = true;
    if (state.visible) {
      state.vm.id = key as string;
    }
    refForm.value?.resetFields();
    //初始化表单数据
    state.loading = true;
    SysDictionaryService.findForm(key as string).then((res) => {
      state.loading = false;
      if (res.code != 1) return;
      state.vm = res.data;
      state.vm.form.parentId = parentId;
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
      const result = await SysDictionaryService.saveForm(state.vm.id, state.vm.form);
      state.loading = false;
      if (result.code != 1) return;
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
  <a-modal v-model:visible="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="400">
    <template #footer>
      <a-button type="primary" :loading="state.loading" @click="save()"> 提交</a-button>
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <a-spin :spinning="state.loading">
      <a-form ref="refForm" layout="vertical" :model="state.vm.form">
        <a-row :gutter="[16, 0]">
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
