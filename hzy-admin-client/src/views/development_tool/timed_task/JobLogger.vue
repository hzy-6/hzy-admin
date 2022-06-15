<template>
  <a-button class="mb-15" @click="methods.firstPage"> 首页 </a-button>
  <a-spin :spinning="state.loading">
    <a-steps progress-dot direction="vertical">
      <a-step v-for="item in state.dataSource" :key="item.id" status="process" :title="item.text" />
      <div v-if="state.showLoadingMore" :style="{ textAlign: 'center', marginTop: '12px', height: '32px', lineHeight: '32px' }">
        <a-spin v-if="state.loadingMore" />
        <a-button v-else @click="methods.onLoadMore"> 更多... </a-button>
      </div>
    </a-steps>
  </a-spin>
</template>
<script setup>
import { computed, onMounted, reactive } from "vue";
import tools from "@/scripts/tools";
import service from "@/service/development_tool/timedTaskService";

const props = defineProps({
  formId: String,
});

const state = reactive({
  vm: computed(() => props.formId),
  loading: true,
  loadingMore: false,
  showLoadingMore: true,
  table: {
    page: 1,
    size: 20,
  },
  dataSource: [],
  input: "1",
  timer: undefined,
});
const methods = {
  getloginfo() {
    state.loading = true;
    service
      .getJobLoggers(state.vm, state.table.page, state.table.size)
      .then((res) => {
        if (res.data.length > 0) {
          if (state.table.page == 1) state.dataSource = res.data.concat(state.dataSource);
          else state.dataSource = state.dataSource.concat(res.data);
        } else {
          tools.message("未查询到数据");
          state.showLoadingMore = false;
        }
      })
      .finally(() => {
        state.loading = false;
        state.loadingMore = false;
      });
    // get(`/JobLogger/${state.vm}/${state.table.page}/${state.table.size}`)
    //   .finally(() => {
    //     state.loading = false;
    //     state.loadingMore = false;
    //   })
    //   .then((res) => {
    //     if (res.data.length > 0) {
    //       if (state.table.page == 1) state.dataSource = res.data.concat(state.dataSource);
    //       else state.dataSource = state.dataSource.concat(res.data);
    //     } else {
    //       tools.message("未查询到数据");
    //       state.showLoadingMore = false;
    //     }
    //   });
  },
  onLoadMore() {
    state.loadingMore = true;
    state.table.page += 1;
    methods.getloginfo(state.table.page);
  },
  firstPage() {
    state.table.page = 1;
    state.dataSource = [];
    methods.getloginfo();
  },
};

onMounted(() => {
  methods.getloginfo();
});
</script>
