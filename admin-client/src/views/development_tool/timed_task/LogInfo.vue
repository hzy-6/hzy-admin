<script lang="ts" setup>
import { reactive } from "vue";
import TimedTaskService from "@/services/development_tool/TimedTaskService";

const state = reactive({
  vm: {
    id: "",
    form: {} as any,
  },
  visible: false,
  loading: false,
  page: 1,
});

//向父级导出 函数
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  open: (key: string = "") => {
    state.visible = true;
    if (state.visible) {
      state.vm.id = key;
    }
    getJobLoggers(key, true);
  },
});

/**
 * 获取日志列表
 * @param key
 * @param isFrist
 */
function getJobLoggers(key: string, isFrist: boolean) {
  //初始化表单数据
  state.loading = true;
  TimedTaskService.getJobLoggers(key, state.page).then((res) => {
    state.loading = false;
    if (res.code != 1) return;
    state.vm.form.data = res.data;
    if (!res.data || res.data.length == 0) {
      state.page = state.page - 1;
      return;
    }

    const newData: any[] = [];
    if (!isFrist) {
      state.vm.form.data.forEach((element: any) => {
        newData.push(element);
      });
    }
    res.data.forEach((element: any) => {
      newData.push(element);
    });

    state.vm.form.data = newData;
  });
}

/**
 * 更多
 */
function more() {
  state.page = state.page + 1;
  getJobLoggers(state.vm.id, false);
}
</script>

<template>
  <a-drawer v-model:visible="state.visible" title="任务日志" centered @ok="state.visible = false" :width="1200">
    <a-spin :spinning="state.loading">
      <a-timeline>
        <a-timeline-item v-for="item in state.vm.form.data">{{ item.text }}</a-timeline-item>
      </a-timeline>
      <a-button type="primary" class="mt-18" block @click="more()">Next Page {{ state.page }}</a-button>
    </a-spin>
  </a-drawer>
</template>
