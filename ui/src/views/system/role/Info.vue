<template>
  <a-modal v-model:visible="visible" :title="vm.id ? '编辑' : '新建'" centered @ok="visible = false" :width="400">
    <template #footer>
      <a-button type="primary" @click="saveForm()" :loading="saveLoading">提交</a-button>
      <a-button type="danger" ghost @click="visible = false" class="ml-24">关闭</a-button>
    </template>
    <a-spin :spinning="saveLoading">
      <a-form layout="vertical" :model="vm.form">
        <a-row :gutter="[24, 24]">
          <a-col :xs="24">
            <a-form-item label="编号">
              <a-input v-model:value="vm.form.number" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="角色名称">
              <a-input v-model:value="vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="删除锁定">
              <a-radio-group v-model:value="vm.form.deleteLock">
                <a-radio :value="true">锁定</a-radio>
                <a-radio :value="false">不锁定</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="备注">
              <a-textarea v-model:value="vm.form.remark" placeholder="请输入" :rows="4" />
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
import service from "@/service/system/roleService";

export default defineComponent({
  name: "system_role_info",
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
    });

    const methods = {
      findForm() {
        state.saveLoading = true;
        service.findForm(state.vm.id).then((res) => {
          state.saveLoading = false;
          if (res.code != 1) return;
          state.vm = res.data;
        });
      },
      saveForm() {
        state.saveLoading = true;
        service.saveForm(state.vm.form).then((res) => {
          state.saveLoading = false;
          if (res.code != 1) return;
          tools.message("操作成功!", "成功");
          context.emit("onSuccess", res.data);
          state.visible = false;
        });
      },
      //打开表单初始化
      openForm({ visible, key }) {
        state.visible = visible;
        if (visible) {
          state.vm.id = key;
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
