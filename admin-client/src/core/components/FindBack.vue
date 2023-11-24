<script lang="ts" setup>
import { reactive, watch } from "vue";
import AppIcon from "@/core/components/AppIcon.vue";

//定义 props
const props = defineProps<{
  title: string;
  label: string;
  visible: boolean;
}>();
//定义事件
const emits = defineEmits<{
  (e: "onClear"): void;
  (e: "update:visible", visible: boolean): void;
}>();

const state = reactive({
  visible: false,
});

watch(
  () => props.visible,
  (value) => {
    state.visible = value;
  }
);

watch(
  () => state.visible,
  (value) => {
    emits("update:visible", value);
  }
);

/**
 * 清空信息
 */
function onClear() {
  emits("onClear");
  state.visible = !state.visible;
}
</script>

<template>
  <div>
    <a-drawer :title="props.title" placement="right" :open="state.visible" :width="1300" @close="state.visible = false" :bodyStyle="{ padding: '16px', background: '#f0f2f5' }">
      <slot></slot>
    </a-drawer>
    <!-- input 输入 -->
    <slot name="input">
      <a-input-search placeholder="请选择" v-model:value="props.label" readonly @click="state.visible = !state.visible" @search="onClear">
        <template #enterButton>
          <AppIcon name="DeleteOutlined" />
        </template>
      </a-input-search>
    </slot>
  </div>
</template>

<style lang="less" scoped>
.ant-btn-primary {
  border-color: red;
  background: red;
}
</style>
