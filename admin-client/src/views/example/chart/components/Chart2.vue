<script lang="ts" setup>
import {onMounted, reactive} from "vue";
import {Chart} from "@antv/g2";

var chartObject: Chart | null = null;

/**
 * 初始化 chart
 */
const chartInit = () => {

  chartObject = new Chart({
    container: 'container2',
    height: 500,
  });

  chartObject.coordinate({type: 'theta'});

  chartObject
      .interval()
      .transform({type: 'stackY'})
      .data({
        type: 'fetch',
        value:
            'https://gw.alipayobjects.com/os/bmw-prod/79fd9317-d2af-4bc4-90fa-9d07357398fd.csv',
      })
      .encode('y', 'value')
      .encode('color', 'name')
      .style('stroke', 'white')
      .scale('color', {
        palette: 'spectral',
        offset: (t) => t * 0.8 + 0.1,
      })
      .label({
        text: 'name',
        radius: 0.8,
        fontSize: 10,
        fontWeight: 'bold',
      })
      .label({
        text: (d, i, data) => (i < data.length - 3 ? d.value : ''),
        radius: 0.8,
        fontSize: 9,
        dy: 12,
      })
      .animate('enter', {type: 'waveIn'})
      .legend(false);

  chartObject.render();
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
  // createData();
  // setInterval(() => createData(), 2000);
});
</script>

<template>
  <div id="container2"></div>
</template>

<style scoped></style>
