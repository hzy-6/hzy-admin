<script lang="ts" setup>
import { reactive, watch } from "vue";

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

const onClear = () => {
  emits("onClear");
  state.visible = !state.visible;
};
</script>

<template>
  <div>
    <a-drawer :title="props.title" placement="right" :visible="state.visible" :width="1300" @close="state.visible = false">
      <slot></slot>
    </a-drawer>
    <!-- input 输入 -->
    <slot name="input">
      <el-input v-model="props.label" readonly placeholder="请选择" @click="state.visible = !state.visible">
        <template #append>
          <el-button icon="DeleteOutlined" @click="onClear" />
        </template>
      </el-input>
    </slot>
  </div>
</template>

<style lang="less" scoped>
.ant-btn-primary {
  border-color: red;
  background: red;
}
</style>
