<template>
  <a-modal v-model:visible="props.visible" title="实时通讯消息" @cancel="close" :footer="null">
    <a-textarea :rows="10" placeholder="消息面板" v-model:value="state.cmd" class="mb-24" :bordered="false" :autosize="true" />
    <a-input-search v-model:value="state.userName" placeholder="请输入用户名" enter-button="登录" @search="login" class="mb-24" />
    <a-input v-model:value="state.sayValue" placeholder="消息内容" class="mb-24" />
    <a-button type="primary" block @click="say" class="mb-24">发送</a-button>
  </a-modal>
</template>
<script setup>
import appConsts from "@/scripts/app-consts";
import tools from "@/scripts/tools";
import * as microsoftSignalr from "@microsoft/signalr";
import { reactive } from "vue";

const props = defineProps({
  visible: Boolean,
});
const emits = defineEmits(["update:visible"]);

const close = () => {
  emits("update:visible", false);
};

const state = reactive({
  signalR: null,
  cmd: "",
  sayValue: "",
  userName: "",
});

// 连接地址
const url = appConsts.domainName + "/hub";

// 1、构建 signalR
state.signalR = new microsoftSignalr.HubConnectionBuilder().withUrl(url).configureLogging(microsoftSignalr.LogLevel.Error).withAutomaticReconnect().build();

// 2、监听服务端事件
state.signalR.on("onLogin", (userName) => {
  state.cmd += `${userName}>上线成功!\r\n`;
});
state.signalR.on("onSay", (userName, message, now) => {
  state.cmd += `${userName}>${message} --${now}--\r\n`;
});

// 3.启动连接
async function start() {
  try {
    await state.signalR.start();
    state.cmd += "SignaR 连接成功!\r\n";
  } catch (err) {}
}

// 4、监听关闭连接
state.signalR.onclose(async () => {});

// 5、启动连接
start();

const login = () => {
  if (!state.userName) {
    return tools.message("请输入用户名");
  }
  state.signalR.invoke("Login", state.userName);
};

const say = () => {
  if (!state.userName) {
    return tools.message("请输入用户名");
  }
  if (!state.sayValue) {
    return tools.message("请输入发送消息内容");
  }
  state.signalR.invoke("Say", state.userName, state.sayValue);
};
</script>

<style lang="less" scoped>
.cmd {
  background: black;
  color: #ffffff;
}
</style>
