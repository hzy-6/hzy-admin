<template>
  <a-modal v-model:visible="visible" :title="vm.id ? '编辑' : '新建'" centered @ok="visible = false" :width="800">
    <template #footer>
      <a-button type="primary" @click="saveForm()" :loading="saveLoading">提交</a-button>
      <a-button type="danger" ghost @click="visible = false" class="ml-24">关闭</a-button>
    </template>
    <a-spin :spinning="saveLoading">
      <a-form ref="formRef" layout="vertical" :model="vm.form" :rules="rules">
        <a-row :gutter="[24, 24]">
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="真实姓名" ref="name" name="name">
              <a-input v-model:value="vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="账户名称" ref="loginName" name="loginName">
              <a-input v-model:value="vm.form.loginName" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="账户密码">
              <a-input v-model:value="vm.form.password" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="联系电话">
              <a-input v-model:value="vm.form.phone" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="邮箱地址">
              <a-input v-model:value="vm.form.email" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="删除锁定">
              <a-radio-group v-model:value="vm.form.deleteLock">
                <a-radio :value="true">锁定</a-radio>
                <a-radio :value="false">不锁定</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
          
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <a-form-item label="所属岗位">
              <a-checkbox-group v-model:value="vm.postIds" class="w100">
                <a-row :gutter="[16, 16]">
                  <a-col :span="6" v-for="(item, index) in vm.allPostList" :key="index">
                    <a-checkbox :value="item.id">
                      {{ item.name }}
                    </a-checkbox>
                  </a-col>
                </a-row>
              </a-checkbox-group>
            </a-form-item>
          </a-col>
          <a-col :xs="24">
            <a-form-item label="所属角色">
              <a-checkbox-group v-model:value="vm.roleIds" class="w100">
                <a-row :gutter="[16, 16]">
                  <a-col :span="6" v-for="(item, index) in vm.allRoleList" :key="index">
                    <a-checkbox :value="item.id">
                      {{ item.name }}
                    </a-checkbox>
                  </a-col>
                </a-row>
              </a-checkbox-group>
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
<script>
import { defineComponent, reactive, toRefs, ref, nextTick } from "vue";
import tools from "@/scripts/tools";
import service from "@/service/system/userService";

export default defineComponent({
  name: "system_user_info",
  props: {
    onSuccess: Function,
  },
  setup(props, context) {
    const state = reactive({
      vm: {
        id: "",
        form: {},
        roleIds: [],
        allRoleList: [],
        allPostList: [],
      },
      visible: false,
      saveLoading: false,
      organizationId: null,
    });
    const formRef = ref();

    //验证规则
    const rules = {
      name: [{ required: true, message: "请输入真实姓名", trigger: "blur" }],
      loginName: [{ required: true, message: "请输入账户名称", trigger: "blur" }],
    };

    const methods = {
      findForm() {
        state.saveLoading = true;
        service.findForm(state.vm.id).then((res) => {
          state.saveLoading = false;
          if (res.code != 1) return;
          state.vm = res.data;
          state.vm.form.password = "";
          state.organizationId = state.vm.form.organizationId;
        });
      },
      saveForm() {
        if (!state.organizationId) {
          return tools.message("请选择组织", "警告");
        }

        formRef.value.validate().then(() => {
          state.saveLoading = true;
          state.vm.form.organizationId = state.organizationId;
          service
            .saveForm(state.vm)
            .then((res) => {
              if (res.code != 1) return;
              tools.message("操作成功!", "成功");
              context.emit("onSuccess", res.data);
              state.visible = false;
            })
            .finally(() => {
              state.saveLoading = false;
            });
        });
        // .catch((error) => {
        //   console.log("error", error);
        // });
      },
      //打开表单初始化
      openForm({ visible, key, organizationId }) {
        state.visible = visible;
        if (visible) {
          state.vm.id = key;
          state.organizationId = organizationId;
          nextTick(() => {
            formRef.value.resetFields();
          });
          methods.findForm();
        }
      },
    };

    context.expose({ ...methods });

    return {
      ...toRefs(state),
      ...methods,
      rules,
      formRef,
    };
  },
});
</script>
<style lang="less" scoped>
.ant-form-item {
  margin-bottom: 0;
}
</style>
