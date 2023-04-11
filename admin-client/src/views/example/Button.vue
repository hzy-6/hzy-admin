<script lang="ts" setup>
import { ref } from "vue";
import { Button, message, ConfigProvider } from "ant-design-vue";
import PageContainer from "@/core/components/PageContainer.vue";
defineOptions({ name: "ButtonCom" });

const messageText = ref("hello");

function onHello() {
  message.success(messageText.value);
}
</script>

<template>
  <PageContainer>
    <div class="text-center btns" @click="onHello()">
      <Button type="primary">Primary</Button>
      <Button>Default</Button>
      <Button type="dashed">Dashed</Button>
      <Button type="primary" danger>Danger</Button>
      <ConfigProvider :auto-insert-space-in-button="false">
        <Button type="primary">按钮</Button>
      </ConfigProvider>
      <Button type="primary">按钮</Button>
      <Button type="link">Link</Button>
      <Button class="btn-success">Success</Button>
      <Button class="btn-info">Info</Button>
      <Button class="btn-warning">warning</Button>
    </div>
  </PageContainer>
</template>

<style lang="less" scope>
.btns {
  .ant-btn {
    margin: 10px;
  }
}
</style>
