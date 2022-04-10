<template>
  <div>
    <a-table :data-source="list">
      <a-table-column key="index" title="序号" :width="80">
        <template #default="{ index }">
          <span> {{ index + 1 }} </span>
        </template>
      </a-table-column>
      <a-table-column key="sql" title="Sql 脚本" data-index="sql" :ellipsis="true">
        <template #default="{ text }">
          <a-popover title="Sql 脚本">
            <template #content> {{ text }} </template>
            <div>{{ text }}</div>
          </a-popover>
        </template>
      </a-table-column>
      <a-table-column key="elapsedMilliseconds" title="耗时" data-index="elapsedMilliseconds" :width="100">
        <template #default="{ text }">
          <span class="text-danger"> {{ text }} 毫秒</span>
        </template>
      </a-table-column>
      <a-table-column key="time" title="记录时间" data-index="time" :width="200" />
    </a-table>
  </div>
</template>
<script setup>
import { ref, onBeforeUnmount } from "vue";
import service from "@/service/development_tool/monitor_ef_core_service.js";

const list = ref([]);
const methods = {
  getTimeConsumingRanking() {
    service.getTimeConsumingRanking().then((res) => {
      list.value = res.data;
    });
  },
};

methods.getTimeConsumingRanking();

//定时加载
let timer = ref(null);
timer.value = setInterval(() => {
  methods.getTimeConsumingRanking();
}, 10 * 1000);

onBeforeUnmount(() => {
  clearInterval(timer.value);
});
</script>
