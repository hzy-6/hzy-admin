<template>
  <div>
    <a-drawer :title="$props.title" placement="right" :visible="visible" :width="1300" @close="visible = false">
      <slot></slot>
    </a-drawer>
    <!-- input 输入 -->
    <slot name="input">
      <a-input-search placeholder="请选择" v-model:value="$props.label" readonly @click="visible = !visible" @search="onClear">
        <template #enterButton>
          <AppIcon name="DeleteOutlined" />
        </template>
      </a-input-search>
    </slot>
  </div>
</template>

<script>
import { defineComponent, reactive, toRefs, watch } from "vue";
import AppIcon from "@/components/AppIcon.vue";

export default defineComponent({
  name: "FindBack",
  props: {
    title: String,
    label: String,
    onClear: Function,
    visible: Boolean,
  },
  components: { AppIcon, AppIcon },
  setup(props, context) {
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
        context.emit("update:visible", value);
      }
    );

    const onClear = () => {
      context.emit("onClear");
      state.visible = !state.visible;
    };

    return {
      ...toRefs(state),
      onClear,
    };
  },
});
</script>

<style lang="less" scoped>
.ant-btn-primary {
  border-color: red;
  background: red;
}
</style>
