<script setup lang="ts">
import {computed} from "vue";
import AppIcon from "@/core/components/AppIcon.vue";
// 拖拽插件
import draggable from 'vuedraggable';
import ThemeStore from "@/core/store/layouts/ThemeStore";

const themeStore = ThemeStore();

interface IProps {
  /**
   * 列头
   */
  columns: any[]
}

//定义 props
const props = withDefaults(
    defineProps<IProps>(),
    {}
);

const emits = defineEmits<{
  (e: "update:columns", value: any[]): void;
}>();

const columns = computed({
  get: () => props.columns,
  set: (value) => {
    // 持久化 到 localstorage
    // localStorage.setItem("columns", JSON.stringify(value));
    // console.log(value)
    // alert(666);
    emits("update:columns", value);
  }
});

/**
 * 拖拽开始的事件
 */
const onStart = () => {
  console.log("开始拖拽");
}

/**
 * 拖拽结束的事件
 */
const onEnd = () => {
  console.log("结束拖拽");
}

/**
 * 变更字段的固定列属性
 * @param row
 * @param fixed
 */
function changeFixed(row: any, fixed: 'left' | 'right') {
  if (row.fixed == 'left' && fixed == 'left') {
    row.fixed = undefined;
    return;
  }

  if (row.fixed == 'right' && fixed == 'right') {
    row.fixed = undefined;
    return;
  }

  row.fixed = fixed;
}
</script>
<template>
  <a-popover placement="bottomRight">
    <template #content>
      <!--      ghost-class="ghost"-->
      <!--      chosen-class="chosenClass"-->
      <draggable
          :list="columns"
          animation="200"
          @start="onStart"
          @end="onEnd"
          item-key="title"
      >
        <template #item="{ element }">
          <div class="mt-12" :key="element.title">
            <a-space>
              <AppIcon name="DragOutlined" class="mr-12" style="cursor: move"/>
              <a-checkbox v-model:checked="element.show">
                <div class="w-100">{{ element.title }}</div>
              </a-checkbox>
              <AppIcon
                  name="VerticalRightOutlined"
                  @click="changeFixed(element,'left')"
                  :style="{color:element.fixed == 'left'?themeStore.state.tokenTheme?.colorPrimary:''}"/>
              <a-divider type="vertical"/>
              <AppIcon
                  name="VerticalLeftOutlined"
                  @click="changeFixed(element,'right')"
                  :style="{color:element.fixed == 'right'?themeStore.state.tokenTheme?.colorPrimary:''}"/>
            </a-space>
          </div>
        </template>
      </draggable>
    </template>
    <a-button type="text">
      <template #icon>
        <AppIcon name="setting-outlined"/>
      </template>
    </a-button>
  </a-popover>
</template>
