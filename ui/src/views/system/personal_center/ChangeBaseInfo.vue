<template>
  <a-form layout="vertical" ref="formRef" :model="state.vm" :rules="rules">
    <a-row :gutter="[15, 15]">
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
          <a-button type="primary" @click="methods.saveForm">提交</a-button>
          <!-- <a-button style="margin-left: 10px" @click="resetForm">重置</a-button> -->
        </a-form-item>
      </a-col>
    </a-row>
  </a-form>
</template>

<script>
export default { name: "change_base_info" };
</script>
<script setup>
import { reactive, ref, computed } from "vue";
import tools from "@/scripts/tools";
import service from "@/service/system/personal_center_service";
import { useAppStore } from "@/store";

const appStore = useAppStore();
const userInfo = computed(() => appStore.state.userInfo).value;
const formRef = ref();
const state = reactive({
  vm: {
    name: userInfo.name,
    loginName: userInfo.loginName,
    phone: userInfo.phone,
    email: userInfo.email,
  },
});

const rules = {
  name: [{ required: true, message: "请输入真实姓名", trigger: "blur" }],
  loginName: [{ required: true, message: "请输入账户名称", trigger: "blur" }],
  phone: [{ required: true, message: "请输入联系电话", trigger: "blur" }],
  email: [{ required: true, message: "请输入邮箱", trigger: "blur" }],
};

const methods = {
  saveForm() {
    formRef.value
      .validate()
      .then(() => {
        service.saveForm(state.vm).then((res) => {
          if (res.code != 1) return;
          appStore.refreshUserInfo().then(() => {
            tools.message("操作成功!", "成功");
          });
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
</script>
