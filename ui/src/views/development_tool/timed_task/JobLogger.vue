<template>
  <a-button class="mb-24" @click="firstPage"> 首页 </a-button>
  <a-spin :spinning="loading">
    <a-steps progress-dot direction="vertical">
      <a-step v-for="item in dataSource" :key="item.id" status="process" :title="item.text" />
      <div v-if="showLoadingMore" :style="{ textAlign: 'center', marginTop: '12px', height: '32px', lineHeight: '32px' }">
        <a-spin v-if="loadingMore" />
        <a-button v-else @click="onLoadMore"> 更多... </a-button>
      </div>
    </a-steps>
  </a-spin>
</template>
<script>
import { defineComponent, onMounted, reactive, toRefs } from "vue";
import tools from "@/scripts/tools";
import moment from "moment";
import service from "@/service/development_tool/timedTaskService";

export default defineComponent({
  props: {
    formId: String,
  },
  setup(props) {
    const state = reactive({
      vm: props.formId,
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
      timeFormat(time) {
        return moment(time).format("YYYY-MM-DD HH:mm:ss");
      },
    };

    onMounted(() => {
      methods.getloginfo();
    });

    return {
      ...toRefs(state),
      ...methods,
    };
  },
});
</script>
