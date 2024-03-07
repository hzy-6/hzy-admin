<script setup lang="ts">
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import { useForm } from "ant-design-vue/es/form";
import TimedTaskService from "@/services/development_tool/TimedTaskService";
import Tools from "@/core/utils/Tools";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

let columns = [
  {
    title: "创建时间",
    dataIndex: "creationTime",
    align: "center",
    width: 200,
  },
  {
    title: "日志",
    dataIndex: "text",
    align: "center",
    // width: 300,
    ellipsis: true,
  },
];

let state = reactive({
  open: false,
  loading: false,
  key: "",
  pageIndex: 1,
  pageSize: 10,
  pageTotal: 0,
  pageList: [] as any[],
});

//向父级导出 函数
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  openWindow: (key: string = "") => {
    state.open = true;
    state.key = key;
    getJobLoggers(true);
  },
});

/**
 * 获取日志列表
 */
function getJobLoggers() {
  //初始化表单数据
  state.loading = true;
  TimedTaskService.getJobLoggers(state.key, state.pageIndex).then((res) => {
    state.loading = false;
    if (res.code != 200) return;
    state.pageList = res.data.list;
    state.pageTotal = res.data.total;
    // if (!res.data || res.data.length == 0) {
    //   state.page = state.page - 1;
    //   return;
    // }

    // const newData: any[] = [];
    // if (!isFirst) {
    //   state.vm.form.data.forEach((element: any) => {
    //     newData.push(element);
    //   });
    // }
    // res.data.forEach((element: any) => {
    //   newData.push(element);
    // });

    // state.vm.form.data = newData;
  });
}
</script>
<template>
  <a-drawer v-model:open="state.open" title="日志" :footer="false" width="80%">
    <a-spin :spinning="state.loading">
      <a-table
        :columns="columns"
        :data-source="state.pageList"
        bordered
        :pagination="{
        current: state.pageIndex,
        pageSize: state.pageSize,
        total: state.pageTotal,
        showSizeChanger: true,
        showQuickJumper: true,
        showTotal: (total: number) => `共 ${total} 条`,
        onChange: (page: number, pageSize: number) => {
          state.pageIndex = page;
          state.pageSize = pageSize;
          getJobLoggers();
        },
        onShowSizeChange: (current: number, size: number) => {
          state.pageIndex = current;
          state.pageSize = size;
          getJobLoggers();
        },
      }"
        size="small"
      >
        <!--        <template #bodyCell="{ column, text }">-->
        <!--          <template v-if="column.dataIndex === 'name'">-->
        <!--            <a>{{ text }}</a>-->
        <!--          </template>-->
        <!--        </template>-->
        <!--        <template #title>Header</template>-->
        <!--        <template #footer>Footer</template>-->
      </a-table>
    </a-spin>
  </a-drawer>
</template>
