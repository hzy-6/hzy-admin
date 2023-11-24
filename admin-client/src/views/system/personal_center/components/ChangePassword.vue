<script lang="ts" setup>
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import PersonalCenterService from "@/services/system/PersonalCenterService";

defineOptions({ name: "system_change_password" });

const refForm = ref<FormInstance>();
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
} as any;

/**
 * 保存
 */
function saveForm() {
  refForm.value?.validate().then(() => {
    if (state.vm.newPassword != state.vm.qrPassword) {
      return Tools.message.warning("两次密码不一致!");
    }
    PersonalCenterService.changePassword(state.vm).then((res) => {
      if (res.code != 200) return;
      Tools.message.success("操作成功!");
    });
  });
}
</script>

<template>
  <a-form layout="vertical" ref="refForm" :model="state.vm" :rules="rules">
    <a-row :gutter="[16, 0]">
      <a-col :xs="24">
        <a-form-item label="旧密码" name="oldPassword">
          <a-input v-model:value="state.vm.oldPassword" type="password" placeholder="旧密码" />
        </a-form-item>
      </a-col>
      <a-col :xs="24">
        <a-form-item label="新密码" name="newPassword">
          <a-input v-model:value="state.vm.newPassword" type="password" placeholder="新密码" />
        </a-form-item>
      </a-col>
      <a-col :xs="24">
        <a-form-item label="确认新密码" name="qrPassword">
          <a-input v-model:value="state.vm.qrPassword" type="password" placeholder="确认新密码" />
        </a-form-item>
      </a-col>
      <a-col :xs="24">
        <a-form-item :wrapper-col="{ span: 14 }">
          <a-button type="primary" @click="saveForm()">提交</a-button>
          <a-button style="margin-left: 10px" @click="() => refForm?.resetFields()">重置</a-button>
        </a-form-item>
      </a-col>
    </a-row>
  </a-form>
</template>
