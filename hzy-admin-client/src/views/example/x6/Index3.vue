<template>
  <div id="x6-container3" style="min-height: 500px"></div>
</template>

<script setup>
import { onMounted } from "vue";
import { Graph } from "@antv/x6";
import "@antv/x6-vue-shape";
import Count from "./Index3Count.vue";

Graph.registerNode("hzy-count", {
  inherit: "vue-shape",
  x: 200,
  y: 150,
  width: 150,
  height: 100,
  component: {
    template: `<Count />`,
    components: {
      Count,
    },
  },
});

onMounted(() => {
  const graph = new Graph({
    container: document.getElementById("x6-container3"),
    // width: 600,
    height: 400,
    grid: true,
  });

  graph.addNode({
    id: "1",
    shape: "hzy-count",
    x: 400,
    y: 150,
    width: 150,
    height: 100,
    data: {
      num: 0,
    },
  });
});
</script>
