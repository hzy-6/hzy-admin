<script lang="ts" setup>
import { ref } from "vue";
import Columns from "./components/Columns.vue";
import CodeGeneration from "./components/CodeGeneration.vue";
import CodeLoadToProject from "./components/CodeLoadToProject.vue";

const rowData = ref<any>();
const visible = ref<boolean>(false);
const loading = ref<boolean>(false);

//向父级导出 函数
defineExpose({
  open: (row: any) => {
    visible.value = true;
    rowData.value = row;
  },
});
</script>

<template>
  <a-drawer
    v-model:visible="visible"
    :title="'配置 - ' + rowData?.tableName"
    centered
    @close="
      () => {
        rowData = false;
        visible = false;
      }
    "
    width="90%"
  >
    <a-spin :spinning="loading">
      <a-tabs defaultActiveKey="1">
        <a-tab-pane key="1" tab="字段设置">
          <Columns :rowData="rowData" />
        </a-tab-pane>
        <a-tab-pane key="2" tab="代码预览">
          <CodeGeneration :rowData="rowData" />
        </a-tab-pane>
        <a-tab-pane key="3" tab="代码载入项目">
          <CodeLoadToProject :rowData="rowData" />
        </a-tab-pane>
      </a-tabs>
    </a-spin>
  </a-drawer>
</template>
