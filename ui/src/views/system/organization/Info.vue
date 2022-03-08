<template>
  <a-modal v-model:visible="visible" :title="vm.id ? '编辑' : '新建'" centered @ok="visible = false" :width="800">
    <template #footer>
      <a-button type="primary" @click="saveForm()" :loading="saveLoading">提交</a-button>
      <a-button type="danger" ghost @click="visible = false" class="ml-24">关闭</a-button>
    </template>
    <a-spin :spinning="saveLoading">
      <a-form layout="vertical" :model="vm.form">
        <a-row :gutter="[15, 15]">
          <a-col :xs="24" v-show="parentId">
            <a-form-item label="parentId">
              {{ parentId }}
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="排序号">
              <a-input-number v-model:value="vm.form.orderNumber" :min="1" :max="999" class="w100" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="部门名称">
              <a-input v-model:value="vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="负责人">
              <a-input v-model:value="vm.form.leader" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="联系电话">
              <a-input v-model:value="vm.form.phone" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="邮箱">
              <a-input v-model:value="vm.form.email" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="状态">
              <a-radio-group v-model:value="vm.form.state">
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
<script>
import { defineComponent, reactive, toRefs } from "vue";
import tools from "@/scripts/tools";
import service from "@/service/system/organizationService";

export default defineComponent({
  name: "system_organization_info",
  props: {
    onSuccess: Function,
  },
  setup(props, context) {
    const state = reactive({
      vm: {
        id: "",
        form: {},
      },
      visible: false,
      saveLoading: false,
      parentId: null,
    });

    const methods = {
      findForm() {
        state.saveLoading = true;
        service.findForm(state.vm.id, state.parentId).then((res) => {
          state.saveLoading = false;
          if (res.code != 1) return;
          state.vm = res.data;
        });
      },
      saveForm() {
        state.saveLoading = true;
        if (state.parentId) state.vm.form.parentId = state.parentId;
        service.saveForm(state.vm.form).then((res) => {
          state.saveLoading = false;
          if (res.code != 1) return;
          tools.message("操作成功!", "成功");
          context.emit("onSuccess", res.data);
          state.visible = false;
        });
      },
      //打开表单初始化
      openForm({ visible, key, parentId }) {
        state.visible = visible;
        if (visible) {
          state.vm.id = key;
          state.parentId = parentId;
          methods.findForm();
        }
      },
    };

    context.expose({ ...methods });

    return {
      ...toRefs(state),
      ...methods,
    };
  },
});
</script>
<style lang="less" scoped>
.ant-form-item {
  margin-bottom: 0;
}
</style>
