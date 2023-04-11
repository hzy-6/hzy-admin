
<script lang="ts" setup>
import { onMounted } from "vue";
import { Pie } from "@antv/g2plot";

onMounted(() => {
  const data = [
    { type: "分类一", value: 27 },
    { type: "分类二", value: 25 },
    { type: "分类三", value: 18 },
    { type: "分类四", value: 15 },
    { type: "分类五", value: 10 },
    { type: "其他", value: 5 },
  ];
  document.getElementById("container-home-chart3")!.innerHTML = "";
  const piePlot = new Pie("container-home-chart3", {
    appendPadding: 10,
    data,
    angleField: "value",
    colorField: "type",
    radius: 0.75,
    label: {
      type: "spider",
      labelHeight: 28,
      content: "{name}\n{percentage}",
    },
    interactions: [{ type: "element-selected" }, { type: "element-active" }],
    height: 280,
  });

  piePlot.render();
});
</script>

<template>
  <a-card title="饼图-蜘蛛布局标签" :bordered="false" :headStyle="{ 'border-bottom': 0 }">
    <template #extra>
      <a href="https://g2plot.antv.vision/zh/docs/manual/getting-started" target="_black"> 组件地址</a>
    </template>
    <div id="container-home-chart3"></div>
  </a-card>
</template>

<style lang="less">
.work-order {
  .icon-size {
    font-size: 70px;
  }
}
</style>
