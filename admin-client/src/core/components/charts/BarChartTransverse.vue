<script lang="ts" setup>
import { onMounted, reactive, watch, computed } from "vue";
import { Chart } from "@antv/g2";

interface IProps {
  id: string;
  data: any[];
  height: number;
  valueAlias: string;
}
const props = withDefaults(defineProps<IProps>(), {
  id: new Date().getTime() + "_" + Math.floor(Math.random() * 1000),
  height: 500,
});

const state = reactive<{
  id: any;
  data: any;
  chartObject: Chart | null;
}>({
  id: computed(() => props.id),
  chartObject: null,
  data: computed(() => props.data),
});

//所需数据类型:
// const data = [
//     { type: "巴西", value: 18203 },
//     { type: "印尼", value: 23489 },
//     { type: "美国", value: 29034 },
//     { type: "印度", value: 104970 },
//     { type: "中国", value: 131744 },
//   ];

/**
 * 初始化 chart
 */
const chartInit = () => {
  state.chartObject = new Chart({
    container: state.id,
    autoFit: true,
    height: props.height,
  });

  state.chartObject.scale({
    value: {
      // max: 1400,
      min: 0,
      alias: props.valueAlias,
    },
  });

  state.chartObject.axis("type", {
    title: null,
    tickLine: null,
    line: null,
  });

  state.chartObject.axis("value", {
    label: null,
    title: {
      offset: 30,
      style: {
        fontSize: 12,
        fontWeight: 300,
      },
    },
  });

  state.chartObject.legend(false);
  state.chartObject.coordinate().transpose();
  state.chartObject
    .interval()
    .position("type*value")
    .size(26)
    .label("value", {
      style: {
        fill: "#8d8d8d",
      },
      offset: 10,
    });
  state.chartObject.interaction("element-active");
};

//绘制图表数据
const chartRender = (data: any) => {
  if (!state.chartObject) return;
  state.chartObject.annotation().clear(true); // 清理guide
  state.chartObject.data(data);
  state.chartObject.render();
};

onMounted(() => {
  chartInit();
  chartRender(state.data);
});

//监听数据变化
watch(state.data, (value) => {
  chartRender(value);
});
</script>

<template>
  <!-- 条形图-横向 -->
  <div :id="state.id"></div>
</template>
