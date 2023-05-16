<script lang="ts" setup>
import { reactive, ref, onMounted } from "vue";
import AppIcon from "@/core/components/AppIcon.vue";
import router from "@/core/router";
import Tools from "@/core/utils/Tools";
import AppStore from "@/core/store/AppStore";
import LoginService from "@/services/LoginService";

const state = reactive({
  userName: "admin",
  userPassword: "123456",
});
const inputPassword = ref<HTMLElement | null>(null);
const loading = ref(false);

const appStore = AppStore();
const title = appStore.state.title;

onMounted(() => {
  reset();
  inputPassword.value!.focus();
});

/**
 * 检查账户并登录
 */
async function check() {
  if (!state.userName) return Tools.message.warning("用户名不能为空!");
  if (!state.userPassword) return Tools.message.warning("密码不能为空!");

  try {
    loading.value = true;
    const result = await LoginService.login(state.userName, state.userPassword);
    loading.value = false;
    if (result.code != 1) return;
    Tools.setAuthorization(result.data.token);
    router.push("/");
  } catch (error) {
    loading.value = false;
  }
}

/**
 * 重置系统信息
 */
function reset() {
  Tools.removeAuthorization();
  appStore.resetInfo();
}
</script>

<template>
  <div>
    <div class="login">
      <div class="login-card">
        <div class="flex-left">
          <img src="../assets/images/info_service.png" alt="" />
        </div>
        <div class="flex-right p-30">
          <div class="title">{{ title }}</div>

          <div class="mt-16">
            <a-input v-model:value="state.userName" placeholder="请输入" size="large" allow-clear>
              <template #prefix>
                <AppIcon name="UserOutlined" style="color: #1890ff; font-size: 14px" />
              </template>
            </a-input>
          </div>

          <div class="mt-16">
            <a-input-password type="password" v-model:value="state.userPassword" size="large" ref="inputPassword" @keyup.enter="check()">
              <template #prefix>
                <AppIcon name="LockOutlined" style="color: #1890ff; font-size: 14px" />
              </template>
            </a-input-password>
          </div>

          <div class="mt-40">
            <a-button type="primary" @click="check()" :loading="loading" size="large" block>登录</a-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

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
  background: url("../assets/images/login-1.jpg") no-repeat;
  background-size: cover;

  .login-card {
    height: 450px;
    width: 900px;
    box-shadow: 0px 16px 48px 16px rgba(0, 0, 0, 0.72), 0px 12px 32px #000000, 0px 8px 16px -8px #000000;
    display: flex;
    border-radius: 5px;
    .flex-left {
      flex: 1;
      width: 450px;
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
  .flex-right {
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
