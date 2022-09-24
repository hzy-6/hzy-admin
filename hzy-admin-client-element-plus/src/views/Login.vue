<script setup lang="ts">
import router from "@/infrastructure/router";
import { reactive, ref } from "vue";
import { useDark, useToggle } from "@vueuse/core";
import AppConsts from "@/infrastructure/scripts/AppConsts";

const jumpHome = () => {
  router.push("/home");
};

const state = reactive({
  userName: "admin",
  userPassword: "123456",
  code: 12,
});

const isDark = useDark();
const toggleDark = useToggle(isDark);

const windowWidth = ref(window.innerWidth);
</script>

<template>
  <div>
    <div class="login">
      <div class="login-card">
        <div class="flex-left">
          <img src="../assets/images/info_service.png" alt="" />
        </div>
        <div class="flex-right p-20" :class="{ 'flex-right-black': isDark, 'flex-right-white': !isDark }">
          <div class="title">{{ AppConsts.appTitle }}</div>

          <div class="mt-20">
            <el-input v-model="state.userName" size="large" placeholder="请输入账号">
              <template #prefix>
                <el-icon>
                  <User />
                </el-icon>
              </template>
            </el-input>
          </div>

          <div class="mt-20">
            <el-input v-model="state.userPassword" size="large" placeholder="请输入密码">
              <template #prefix>
                <el-icon>
                  <Key />
                </el-icon>
              </template>
            </el-input>
          </div>

          <div class="mt-20">
            <el-input v-model="state.code" placeholder="请输入验证码">
              <template #prefix>
                <el-icon>
                  <Lock />
                </el-icon>
              </template>
              <template #append>
                <img
                  src="http://demo.ruoyi.vip/captcha/captchaImage?type=math&s=0.9697355836417079
"
                  class="login-code"
                  alt=""
                />
              </template>
            </el-input>
          </div>

          <div class="mt-40">
            <!-- 暗色按钮样式处理 -->
            <el-button @click="jumpHome()" type="primary" text bg size="large" class="w100" v-if="isDark">登录 </el-button>
            <el-button @click="jumpHome()" type="primary" size="large" class="w100" v-else>登录 </el-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style lang="less">
.login {
  .el-input-group__append,
  .el-input-group__prepend {
    padding: 0 !important;
  }
}
</style>

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
  background: url(../assets/images/login.jpg) no-repeat;
  background-size: cover;

  .login-card {
    height: 450px;
    width: 900px;
    box-shadow: var(--el-box-shadow-dark);
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
      display: flex;
      justify-content: center;
      flex-direction: column;
      border-top-right-radius: 5px;
      border-bottom-right-radius: 5px;
    }

    .flex-right-white {
      background-color: #ffffff;
    }

    .flex-right-black {
      background-color: var(--el-bg-color);
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