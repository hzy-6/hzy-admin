<template>
  <div>
    <div class="login">
      <div class="login-card">
        <div class="flex-left">
          <img src="../assets/images/info_service.png" alt="" />
        </div>
        <div class="flex-right p-30">
          <div class="title">{{ title }}</div>

          <div class="mt-24">
            <a-input v-model:value="state.userName" placeholder="请输入" size="large" allow-clear>
              <template #prefix>
                <AppIcon name="UserOutlined" style="color: #1890ff; font-size: 14px" />
              </template>
            </a-input>
          </div>

          <div class="mt-24">
            <a-input-password type="password" v-model:value="state.userPassword" size="large" ref="inputPassword" @keyup.enter="methods.check">
              <template #prefix>
                <AppIcon name="LockOutlined" style="color: #1890ff; font-size: 14px" />
              </template>
            </a-input-password>
          </div>

          <div class="mt-40">
            <a-button type="primary" @click="methods.check" :loading="loading" size="large" block>登录</a-button>
          </div>
        </div>
      </div>
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
        if (res.code !== 1) {
          loading.value = false;
          return;
        }
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
body {
  margin: 0;
  padding: 0;
  overflow: hidden;
}

.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  //可以解开一下注解 放置一个背景图片
  background: url("../assets/images/login.jpg") no-repeat;
  // background: url("../assets/undraw_Tree_swing_re_pqee.png") no-repeat;
  background-size: cover;
  // background: #f0f2f5 url("../assets/background.svg") no-repeat 50%;

  .login-card {
    height: 450px;
    width: 900px;
    box-shadow: 0px 16px 48px 16px rgba(0, 0, 0, 0.72), 0px 12px 32px #000000, 0px 8px 16px -8px #000000;
    display: flex;
    border-radius: 5px;
    .flex-left {
      flex: 1;
      img {
        height: 100%;
      }
    }

    .flex-right {
      flex: 1;
      background-color: #ffffff;
      display: flex;
      justify-content: center;
      flex-direction: column;
      border-top-right-radius: 5px;
      border-bottom-right-radius: 5px;
    }

    .title {
      text-align: center;
      font-size: 30px;
      padding: 20px;
      font-weight: bold;
    }

    .el-input-group__append {
      padding: 0 !important;
      .login-code {
        height: 38px;
      }
    }
  }
}

//小于 1024 像素 选择采用此样式
@media (max-width: 1024px) {
  .flex-left {
    display: none;
    flex: 0 !important;
    img {
      height: auto !important;
      width: 80% !important;
    }
  }
  .flex-right{
    border-radius: 5px;
  }
}

@media (min-width: 600px) and (max-width: 1024px) {
  .login-card {
    width: 70% !important;
  }
}

@media (max-width: 600px) {
  .login-card {
    // flex-direction: column;
    width: 100% !important;
  }
}
</style>
