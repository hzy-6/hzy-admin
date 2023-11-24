<script lang="ts" setup>
import PageContainer from "@/core/components/PageContainer.vue";
import MonitorEFCoreService from "@/services/development_tool/MonitorEFCoreService";
import { onBeforeUnmount, onMounted, ref } from "vue";
defineOptions({ name: "monitor_efcore" });

const loading = ref(false);
const context = ref<any>({});
const data = ref<any>();
let timer: any = null;

onMounted(() => {
  init();
  timer = setInterval(() => {
    init();
  }, 15 * 1000);
});

onBeforeUnmount(() => {
  clearInterval(timer);
});

/**
 * 初始化数据
 */
async function init() {
  //处理上下文数据
  loading.value = true;
  const result = await MonitorEFCoreService.getEFCoreMonitorContext();
  loading.value = false;
  if (result.code != 200) return;
  context.value = result.data;
  //处理获取耗时排行榜
  loading.value = true;
  const result1 = await MonitorEFCoreService.getTimeConsumingRanking();
  loading.value = false;
  if (result1.code != 200) return;
  data.value = result1.data;
}
</script>

<template>
  <PageContainer>
    <a-card :title="false" :bodyStyle="{ display: 'flex' }">
      <a-card-grid>
        <div>数据连接打开</div>
        <h1>{{ context.openDbConnectionCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
      <a-card-grid>
        <div>数据连接断开</div>
        <h1>{{ context.closeDbConnectionCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
      <a-card-grid>
        <div>连接失败</div>
        <h1>{{ context.connectionFailedCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
      <a-card-grid>
        <div>创建命令</div>
        <h1>{{ context.createCommandCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
      <a-card-grid>
        <div>执行命令</div>
        <h1>{{ context.executeCommandCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
    </a-card>
    <a-card :title="false" :bodyStyle="{ display: 'flex' }" style="border-top: 0">
      <a-card-grid>
        <div>命令执行失败</div>
        <h1>{{ context.commandFailedCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
      <a-card-grid>
        <div>创建事务</div>
        <h1>{{ context.createTransactionCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
      <a-card-grid>
        <div>提交事务</div>
        <h1>{{ context.submitTransactionCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
      <a-card-grid>
        <div>回滚事务</div>
        <h1>{{ context.rollBackCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
      <a-card-grid>
        <div>事务失败</div>
        <h1>{{ context.transactionFailedCount ?? 0 }} <span>次</span></h1>
      </a-card-grid>
    </a-card>
    <a-table :data-source="data" :size="'middle'" :pagination="false">
      <a-table-column key="sql" title="Sql Script" data-index="sql" />
      <a-table-column key="elapsedMilliseconds" title="耗时" data-index="elapsedMilliseconds" :width="100">
        <template #default="{ record }">
          <span class="text-danger">{{ record.elapsedMilliseconds }} 毫秒</span>
        </template>
      </a-table-column>
      <a-table-column key="time" title="执行时间" data-index="time" :width="200" />
    </a-table>
  </PageContainer>
</template>

<style lang="less" scoped>
.ant-card-grid {
  cursor: pointer;
  text-align: center;
}
h1 {
  font-size: 24px;
  font-weight: 500;
}
</style>
