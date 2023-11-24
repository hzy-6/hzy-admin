<script lang="ts" setup>
import {ref} from "vue";
import {Button, message, ConfigProvider} from "ant-design-vue";
import PageContainer from "@/core/components/PageContainer.vue";
import {Dayjs} from 'dayjs';

defineOptions({name: "ButtonCom"});

const messageText = ref("hello");

function onHello() {
  message.success(messageText.value);
}

const value = ref<Dayjs>();
const onPanelChange = (value: Dayjs, mode: string) => {
  console.log(value, mode);
};
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
    <div style="display: flex; justify-content: center;" class="mt-46">
      <div :style="{ width: '300px', border: '1px solid #d9d9d9', borderRadius: '4px' }">
        <a-calendar v-model:value="value" :fullscreen="false" @panelChange="onPanelChange"/>
      </div>
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
