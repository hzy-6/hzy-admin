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
//   { type: "事例一", value: 40, percent: 0.4 },
//   { type: "事例二", value: 21, percent: 0.21 },
//   { type: "事例三", value: 17, percent: 0.17 },
//   { type: "事例四", value: 13, percent: 0.13 },
//   { type: "事例五", value: 9, percent: 0.09 },
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

  state.chartObject.coordinate("theta", {
    radius: 0.75,
  });

  state.chartObject.scale("percent", {
    formatter: (val) => {
      val = (val * 100).toFixed(2) + "%";
      return val;
    },
  });

  state.chartObject.tooltip({
    showTitle: false,
    showMarkers: false,
  });

  state.chartObject
    .interval()
    .position("percent")
    .color("type")
    .label("percent", {
      content: (data) => {
        return `${data.type}: ${(data.percent * 100).toFixed(2)}%`;
      },
    })
    .adjust("stack");

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
