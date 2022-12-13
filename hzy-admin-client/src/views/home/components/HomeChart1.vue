<script lang="ts" setup>
import { onMounted } from "vue";
import { Line } from "@antv/g2plot";

onMounted(() => {
  fetch("https://gw.alipayobjects.com/os/bmw-prod/1d565782-dde4-4bb6-8946-ea6a38ccf184.json")
    .then((res) => res.json())
    .then((data) => {
      document.getElementById("container-home-chart1")!.innerHTML = "";
      const line = new Line("container-home-chart1", {
        data,
        padding: "auto",
        xField: "Date",
        yField: "scales",
        xAxis: {
          tickCount: 5,
        },
        slider: {
          start: 0.1,
          end: 0.5,
        },
        height: 280,
      });

      line.render();
    });
});
</script>

<template>
  <a-card title="带缩略轴的折线" :bordered="false" :headStyle="{ 'border-bottom': 0 }">
    <template #extra>
      <a href="https://g2plot.antv.vision/zh/docs/manual/getting-started" target="_black"> 组件地址</a>
    </template>
    <div id="container-home-chart1"></div>
  </a-card>
</template>

<style lang="less">
.work-order {
  .icon-size {
    font-size: 70px;
  }
}
</style>
