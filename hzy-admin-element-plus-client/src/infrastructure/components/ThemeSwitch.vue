<script setup lang="ts">
//定义 props
const props = defineProps<{
  state: boolean;
  iconSize: number;
}>();
</script>

<template>
  <div class="theme-switch">
    <el-button size="small" round style="width: 50px">
      <template #icon>
        <el-icon :size="props.iconSize" :class="{ 'icon-right': props.state }">
          <slot name="icon">
            <Moon v-if="props.state" />
            <Sunny v-else />
          </slot>
        </el-icon>
      </template>
    </el-button>
  </div>
</template>
<style lang="less" scoped>
.theme-switch {
  .el-button {
    display: inline-flex !important;
    justify-content: flex-start !important;
    align-items: flex-start !important;
  }

  .icon-right {
    transform: translate(16px);
  }
}
</style>
