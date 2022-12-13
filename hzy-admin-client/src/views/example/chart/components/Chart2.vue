<script lang="ts" setup>
import { onMounted, reactive } from "vue";
import { Chart } from "@antv/g2";

var chartObject: Chart | null = null;
const data = reactive([
  { item: "事例一", count: 40, percent: 0.4 },
  { item: "事例二", count: 21, percent: 0.21 },
  { item: "事例三", count: 17, percent: 0.17 },
  { item: "事例四", count: 13, percent: 0.13 },
  { item: "事例五", count: 9, percent: 0.09 },
]);

/**
 * 初始化 chart
 */
const chartInit = () => {
  chartObject = new Chart({
    container: "container2",
    autoFit: true,
    height: 500,
  });

  chartObject.data(data);

  chartObject.coordinate("theta", {
    radius: 0.85,
  });

  chartObject.scale("percent", {
    formatter: (val) => {
      val = val * 100 + "%";
      return val;
    },
  });
  chartObject.tooltip({
    showTitle: false,
    showMarkers: false,
  });
  chartObject.axis(false); // 关闭坐标轴
  const interval = chartObject
    .interval()
    .adjust("stack")
    .position("percent")
    .color("item")
    .label("percent", {
      offset: -40,
      style: {
        textAlign: "center",
        shadowBlur: 2,
        shadowColor: "rgba(0, 0, 0, .45)",
        fill: "#fff",
      },
    })
    .tooltip("item*percent", (item, percent) => {
      percent = percent * 100 + "%";
      return {
        name: item,
        value: percent,
      };
    })
    .style({
      lineWidth: 1,
      stroke: "#fff",
    });
  chartObject.interaction("element-single-selected");
  chartObject.render();

  // 默认选择
  interval.elements[0].setState("selected", true);
};

const createData = () => {
  var data = [];
  for (var i = 1; i < 6; i++) {
    var number = Math.floor(Math.random() * 100);
    var per = number / 100;
    data.push({
      item: "示例 " + i + Math.floor(Math.random() * 5),
      count: number,
      percent: per,
    });
  }
  chartObject!.changeData(data);
};

onMounted(() => {
  chartInit();
  createData();
  setInterval(() => createData(), 2000);
});
</script>

<template>
  <div id="container2"></div>
</template>

<style scoped></style>
