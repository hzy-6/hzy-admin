<template>
  <div id="login">
    <div class="login-modal"></div>
    <div class="login-container">
      <a-card>
        <div class="login-title">{{ title }}</div>
        <div class="p-24">
          <a-form layout="vertical">
            <a-form-item>
              <a-input v-model:value="state.userName" placeholder="请输入" size="large" allow-clear>
                <template #prefix>
                  <AppIcon name="UserOutlined" style="color: #1890ff; font-size: 14px" />
                </template>
              </a-input>
            </a-form-item>
            <a-form-item>
              <a-input-password type="password" v-model:value="state.userPassword" size="large" ref="inputPassword" @keyup.enter="state.check">
                <template #prefix>
                  <AppIcon name="LockOutlined" style="color: #1890ff; font-size: 14px" />
                </template>
              </a-input-password>
            </a-form-item>
            <a-form-item>
              <a-button type="primary" @click="methods.check" :loading="loading" size="large" block>登录</a-button>
            </a-form-item>
          </a-form>
        </div>
      </a-card>
    </div>
  </div>
</template>

<script setup>
import { reactive, ref, onMounted } from "vue";
import { useLayoutStore, useAppStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import router from "@/router/index";
import tools from "@/scripts/tools";
import loginService from "@/service/system/loginService";

const state = reactive({
  userName: "admin",
  userPassword: "123456",
});
const inputPassword = ref(null);
const loading = ref(false);

const layoutStore = useLayoutStore();
const appStore = useAppStore();
const title = layoutStore.state.title;

const methods = {
  check() {
    if (!state.userName) return tools.message("用户名不能为空!", "警告");
    if (!state.userPassword) return tools.message("密码不能为空!", "警告");
    loading.value = true;
    loginService
      .login(state.userName, state.userPassword)
      .then((res) => {
        if (res.code !== 1) return;
        tools.setAuthorization(res.data.token);
        router.push("/").then(() => {
          loading.value = false;
        });
      })
      .catch(() => {
        loading.value = false;
      });
  },
  // 重置系统信息
  reset() {
    tools.delAuthorization();
    appStore.resetInfo();
  },
};

onMounted(() => {
  methods.reset();
  inputPassword.value.focus();
});
</script>
<style lang="less" scoped>
#login {
  text-align: center;
  position: fixed;
  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
  //可以解开一下注解 放置一个背景图片
  background: url("../assets/images/login3.jpg") no-repeat;
  // background: url("../assets/undraw_Tree_swing_re_pqee.png") no-repeat;
  background-size: cover;
  // background: #f0f2f5 url("../assets/background.svg") no-repeat 50%;

  .login-modal {
    position: absolute;
    width: 100%;
    height: 100%;
    // background-color: #000000;
    // background: #f0f2f5;
    margin: 0 auto;
    // opacity: 0.3;
  }

  .login-container {
    position: absolute;
    width: 26rem;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);

    .login-title {
      padding: 20px;
      font-size: 25px;
      font-weight: 500;
      padding-top: 24px;
      padding-bottom: 24px;
    }

    .form-title {
      text-align: left;
    }

    .ant-card {
      border: 0;
    }
  }

  @media (max-width: 720px) {
    .login-container {
      width: 100%;

      .ant-card {
        padding: 0;
      }
    }
  }
}
</style>
