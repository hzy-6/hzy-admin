<template>
  <a-form ref="formRef" :model="vm" :rules="rules" layout="vertical">
    <a-form-item label="旧密码" name="oldPassword">
      <a-input v-model:value="vm.oldPassword" type="password" placeholder="旧密码" />
    </a-form-item>
    <a-form-item label="新密码" name="newPassword">
      <a-input v-model:value="vm.newPassword" type="password" placeholder="新密码" />
    </a-form-item>
    <a-form-item label="确认新密码" name="qrPassword">
      <a-input v-model:value="vm.qrPassword" type="password" placeholder="确认新密码" />
    </a-form-item>
    <a-form-item :wrapper-col="{ span: 14 }">
      <a-button type="primary" @click="saveForm">提交</a-button>
      <a-button style="margin-left: 10px" @click="resetForm">重置</a-button>
    </a-form-item>
  </a-form>
</template>

<script>
import { defineComponent, reactive, toRefs, ref } from "vue";
import tools from "@/scripts/tools";
import service from "@/service/system/personal_center_service";

export default defineComponent({
  name: "system_change_password",
  setup() {
    const formRef = ref();
    const state = reactive({
      vm: {
        oldPassword: "",
        newPassword: "",
        qrPassword: "",
      },
    });

    const rules = {
      oldPassword: [
        { required: true, message: "请输入旧密码", trigger: "blur" },
        { min: 3, max: 20, message: "长度在 3 至 20 之间", trigger: "blur" },
      ],
      newPassword: [
        { required: true, message: "请输入新密码", trigger: "blur" },
        { min: 3, max: 20, message: "长度在 3 至 20 之间", trigger: "blur" },
      ],
      qrPassword: [
        { required: true, message: "请输入确认新密码", trigger: "blur" },
        { min: 3, max: 20, message: "长度在 3 至 20 之间", trigger: "blur" },
      ],
    };

    const methods = {
      saveForm() {
        formRef.value
          .validate()
          .then(() => {
            if (state.vm.newPassword != state.vm.qrPassword) {
              return tools.message("两次密码不一致!", "警告");
            }
            service.changePassword(state.vm).then((res) => {
              if (res.code != 1) return;
              tools.message("操作成功!", "成功");
            });
          })
          .catch((error) => {
            console.log("error", error);
          });
      },
      resetForm() {
        formRef.value.resetFields();
      },
    };

    return {
      ...toRefs(state),
      ...methods,
      rules,
      formRef,
    };
  },
});
</script>
