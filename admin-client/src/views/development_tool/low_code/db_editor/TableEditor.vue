<script lang="ts" setup>
import { ref } from "vue";

const open = ref<boolean>(false);

const afterOpenChange = (bool: boolean) => {
  console.log("open", bool);
};

const showDrawer = () => {
  open.value = true;
};

//向父级导出 函数
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  open: (key: string = "") => {
    open.value = true;
  },
});
</script>

<template>
  <a-drawer
    v-model:open="open"
    class="custom-class"
    root-class-name="root-class-name"
    :root-style="{ color: 'blue' }"
    style="color: red"
    title="数据库编辑器"
    placement="right"
    @after-open-change="afterOpenChange"
    width="60%"
  >
    <p>Some contents...</p>
    <p>Some contents...</p>
    <p>Some contents...</p>
  </a-drawer>
</template>
