<script lang="ts" setup>
import { onMounted } from "vue";
import { Bar } from "@antv/g2plot";

onMounted(() => {
  const data = [
    { year: "1951 年", value: 38 },
    { year: "1952 年", value: 52 },
    { year: "1956 年", value: 61 },
    { year: "1957 年", value: 145 },
    { year: "1958 年", value: 48 },
  ];
  document.getElementById("container-home-chart2")!.innerHTML = "";
  const bar = new Bar("container-home-chart2", {
    data,
    xField: "value",
    yField: "year",
    seriesField: "year",
    legend: {
      position: "top-left",
    },
    height: 280,
  });

  bar.render();
});
</script>

<template>
  <a-card title="基础条形图" :bordered="false" :headStyle="{ 'border-bottom': 0 }">
    <template #extra>
      <a href="https://g2plot.antv.vision/zh/docs/manual/getting-started" target="_black"> 组件地址</a>
    </template>
    <div id="container-home-chart2"></div>
  </a-card>
</template>

<style lang="less">
.work-order {
  .icon-size {
    font-size: 70px;
  }
}
</style>
