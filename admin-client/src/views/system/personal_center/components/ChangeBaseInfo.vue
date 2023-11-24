<script lang="ts" setup>
import { reactive, ref, computed } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import PersonalCenterService from "@/services/system/PersonalCenterService";
import AppStore from "@/core/store/AppStore";
defineOptions({ name: "change_base_info" });

const appStore = AppStore();
const userInfo = computed(() => appStore.state.userInfo as any);
const refForm = ref<FormInstance>();
const state = reactive({
  vm: {
    name: userInfo.value.name,
    loginName: userInfo.value.loginName,
    phone: userInfo.value.phone,
    email: userInfo.value.email,
  },
});

const rules = {
  name: [{ required: true, message: "请输入真实姓名", trigger: "blur" }],
  loginName: [{ required: true, message: "请输入账户名称", trigger: "blur" }],
  phone: [{ required: true, message: "请输入联系电话", trigger: "blur" }],
  email: [{ required: true, message: "请输入邮箱", trigger: "blur" }],
} as any;

function saveForm() {
  refForm.value?.validate().then(() => {
    PersonalCenterService.saveForm(state.vm).then((res) => {
      if (res.code != 200) return;
      appStore.refreshUserInfo().then(() => {
        Tools.message.success("操作成功!");
      });
    });
  });
}
</script>

<template>
  <a-form layout="vertical" ref="refForm" :model="state.vm" :rules="rules">
    <a-row :gutter="[16, 0]">
      <a-col :xs="24">
        <a-form-item label="真实姓名" name="name">
          <a-input v-model:value="state.vm.name" placeholder="真实姓名" />
        </a-form-item>
      </a-col>
      <a-col :xs="24">
        <a-form-item label="账户名称" name="loginName">
          <a-input v-model:value="state.vm.loginName" placeholder="账户名称" />
        </a-form-item>
      </a-col>
      <a-col :xs="24">
        <a-form-item label="联系电话" name="phone">
          <a-input v-model:value="state.vm.phone" placeholder="联系电话" />
        </a-form-item>
      </a-col>
      <a-col :xs="24">
        <a-form-item label="邮箱" name="email">
          <a-input v-model:value="state.vm.email" placeholder="邮箱" />
        </a-form-item>
      </a-col>
      <a-col :xs="24">
        <a-form-item :wrapper-col="{ span: 14 }">
          <a-button type="primary" @click="saveForm()">提交</a-button>
          <!-- <a-button style="margin-left: 10px" @click="resetForm">重置</a-button> -->
        </a-form-item>
      </a-col>
    </a-row>
  </a-form>
</template>
