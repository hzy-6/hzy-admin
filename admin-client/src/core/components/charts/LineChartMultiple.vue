<script lang="ts" setup>
import { reactive, watch, computed, onMounted } from "vue";
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
//   { x: "Jan", group: "Tokyo", y: 7 },
//   { x: "Jan", group: "London", y: 3.9 },
//   { x: "Feb", group: "Tokyo", y: 6.9 },
//   { x: "Feb", group: "London", y: 4.2 },
//   { x: "Mar", group: "Tokyo", y: 9.5 },
//   { x: "Mar", group: "London", y: 5.7 },
//   { x: "Apr", group: "Tokyo", y: 14.5 },
//   { x: "Apr", group: "London", y: 8.5 },
//   { x: "May", group: "Tokyo", y: 18.4 },
//   { x: "May", group: "London", y: 11.9 },
//   { x: "Jun", group: "Tokyo", y: 21.5 },
//   { x: "Jun", group: "London", y: 15.2 },
//   { x: "Jul", group: "Tokyo", y: 25.2 },
//   { x: "Jul", group: "London", y: 17 },
//   { x: "Aug", group: "Tokyo", y: 26.5 },
//   { x: "Aug", group: "London", y: 16.6 },
//   { x: "Sep", group: "Tokyo", y: 23.3 },
//   { x: "Sep", group: "London", y: 14.2 },
//   { x: "Oct", group: "Tokyo", y: 18.3 },
//   { x: "Oct", group: "London", y: 10.3 },
//   { x: "Nov", group: "Tokyo", y: 13.9 },
//   { x: "Nov", group: "London", y: 6.6 },
//   { x: "Dec", group: "Tokyo", y: 9.6 },
//   { x: "Dec", group: "London", y: 4.8 },
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
    x: {
      min: 0,
    },
    y: {
      type: "pow", //非均匀度量与nice配合使用
      nice: true,
      // min:0
      // alias: this.axisTitle.z,
    },
    group: {
      // type: "pow", //非均匀度量与nice配合使用
      // nice: true,
      // alias: this.axisTitle.y,
    },
  });

  state.chartObject.axis("y", {
    label: {
      formatter: (val) => {
        return parseFloat(val).toFixed(2);
      },
    },
  });

  state.chartObject.tooltip({
    showCrosshairs: true, // 展示 Tooltip 辅助线
    shared: true,
  });
  state.chartObject.line().position("x*y").color("group").shape("smooth");
  state.chartObject.point().position("x*y").color("group").shape("circle");
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
  <!-- 折线图-带多条线 -->
  <div :id="state.id"></div>
</template>
