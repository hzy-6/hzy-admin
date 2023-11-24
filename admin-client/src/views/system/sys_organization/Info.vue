<script lang="ts" setup>
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import SysOrganizationService from "@/services/system/SysOrganizationService";

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
    SysOrganizationService.findForm(key as string).then((res) => {
      state.loading = false;
      if (res.code != 200) return;
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
      const result = await SysOrganizationService.saveForm(state.vm.id, state.vm.form);
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
  <a-modal v-model:open="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="800">
    <template #footer>
      <a-button type="primary" :loading="state.loading" @click="save()"> 提交</a-button>
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <a-spin :spinning="state.loading">
      <a-form ref="refForm" layout="vertical" :model="state.vm.form">
        <a-row :gutter="[16, 0]">
          <!-- <a-col :xs="24" v-show="state.vm.form.parentId">
            <a-form-item label="parentId">
              {{ state.vm.form.parentId }}
            </a-form-item>
          </a-col> -->
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="排序号">
              <a-input-number v-model:value="state.vm.form.orderNumber" :min="1" :max="999" class="w100" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="部门名称">
              <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="负责人">
              <a-input v-model:value="state.vm.form.leader" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="联系电话">
              <a-input v-model:value="state.vm.form.phone" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="邮箱">
              <a-input v-model:value="state.vm.form.email" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="状态">
              <a-radio-group v-model:value="state.vm.form.state">
                <a-radio :value="1">正常</a-radio>
                <a-radio :value="2">停用</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
