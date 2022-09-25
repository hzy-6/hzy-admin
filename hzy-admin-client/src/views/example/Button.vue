<template>
  <div class="text-center" @click="methods.onHello">
    <a-button type="primary">Primary</a-button>
    <a-button>Default</a-button>
    <a-button type="dashed">Dashed</a-button>
    <a-button type="primary" danger>Danger</a-button>
    <a-config-provider :auto-insert-space-in-button="false">
      <a-button type="primary">按钮</a-button>
    </a-config-provider>
    <a-button type="primary">按钮</a-button>
    <a-button type="link">Link</a-button>
    <a-button class="btn-success">Success</a-button>
    <a-button class="btn-info">Info</a-button>
    <a-button class="btn-warning">warning</a-button>
  </div>
</template>

<script>
export default { name: "ButtonCom" };
</script>
<script setup>
import { ref } from "vue";
import { message } from "ant-design-vue";

const messageText = ref("hello");

const methods = {
  onHello() {
    message.success(messageText.value);
  },
};
</script>
<style lang="less" scope>
.ant-btn {
  margin: 10px;
}
</style>
