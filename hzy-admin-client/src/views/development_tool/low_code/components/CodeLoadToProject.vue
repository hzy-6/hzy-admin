<template>
  <div>
    <a-button type="primary" @click="methods.autoImport()">开始载入</a-button>
  </div>
</template>
<script setup>
import tools from "@/scripts/tools";
import service from "@/service/development_tool/code_generation_service";
import { reactive } from "vue";

//定义组件事件
// const emits = defineEmits(["onSuccess"]);
const props = defineProps({
  tableName: String,
});

const state = reactive({
  vm: {
    form: {},
  },
});

const methods = {
  autoImport() {
    console.log("执行");
    service
      .autoImprotProject({ tableName: props.tableName })
      .then((res) => {
        if (res.code === 1) {
          tools.message("导入成功,请查看!","成功");
        }
      })
      .finally(() => {
        tools.message("导入结束");
      });
  },
};

// 暴露函数或者属性到外部
defineExpose({ ...methods });
</script>
