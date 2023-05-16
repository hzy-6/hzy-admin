<script lang="ts" setup>
import { onMounted, ref, onBeforeUnmount } from "vue";
import { Column } from "@antv/g2plot";

const data = [
  {
    type: "1月",
    sales: 38,
  },
  {
    type: "2月",
    sales: 52,
  },
  {
    type: "3月",
    sales: 61,
  },
  {
    type: "4月",
    sales: 145,
  },
  {
    type: "5月",
    sales: 48,
  },
  {
    type: "6月",
    sales: 38,
  },
  {
    type: "7月",
    sales: 38,
  },
  {
    type: "8月",
    sales: 38,
  },
  {
    type: "9月",
    sales: 38,
  },
  {
    type: "10月",
    sales: 38,
  },
  {
    type: "11月",
    sales: 38,
  },
  {
    type: "12月",
    sales: 38,
  },
];

let timer = ref();

onMounted(() => {
  document.getElementById("WorkOrderStatisticsContainer")!.innerHTML = "";
  const columnPlot = new Column("WorkOrderStatisticsContainer", {
    data,
    xField: "type",
    yField: "sales",
    height: 250,
    label: {
      // 可手动配置 label 数据标签位置
      position: "middle", // 'top', 'bottom', 'middle',
      // 配置样式
      style: {
        fill: "#FFFFFF",
        opacity: 0.6,
      },
    },
    xAxis: {
      label: {
        autoHide: true,
        autoRotate: false,
      },
    },
    meta: {
      type: {
        alias: "月份",
      },
      sales: {
        alias: "处理工单量",
      },
    },
  });

  columnPlot.render();

  //动态改变数据
  timer.value = setInterval(() => {
    var data = [];
    for (var i = 1; i < 13; i++) {
      data.push({
        type: i + "月",
        sales: Math.floor(Math.random() * 200),
      });
    }
    columnPlot.changeData(data);
  }, 2 * 1000);
});

onBeforeUnmount(() => {
  clearInterval(timer.value);
});
</script>

<template>
  <a-card title="近一年设备销售量" :bordered="false" :headStyle="{ 'border-bottom': 0 }">
    <template #extra>
      <a href="https://g2plot.antv.vision/zh/docs/manual/getting-started" target="_black">组件地址</a>
    </template>
    <div id="WorkOrderStatisticsContainer"></div>
  </a-card>
</template>

<style lang="less">
.work-order {
  .icon-size {
    font-size: 70px;
  }
}
</style>
