<script lang="ts" setup>
import { onMounted, reactive, watch, computed } from "vue";
import { Chart } from "@antv/g2";

interface IProps {
  id: string;
  data: any[];
  height: number;
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
//   { year: '1991', value: 3 },
//   { year: '1992', value: 4 },
//   { year: '1993', value: 3.5 },
//   { year: '1994', value: 5 },
//   { year: '1995', value: 4.9 },
//   { year: '1996', value: 6 },
//   { year: '1997', value: 7 },
//   { year: '1998', value: 9 },
//   { year: '1999', value: 13 },
// ];

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
    year: {
      range: [0, 1],
    },
    value: {
      min: 0,
      nice: true,
    },
  });

  state.chartObject.tooltip({
    showCrosshairs: true, // 展示 Tooltip 辅助线
    shared: true,
  });

  state.chartObject.line().position("year*value").label("value");
  state.chartObject.point().position("year*value");
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
  <!-- 折线图-只带单条线 -->
  <div :id="state.id"></div>
</template>
