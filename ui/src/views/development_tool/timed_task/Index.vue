<template>
  <div class="p-24">
    <!-- <a-tag color="pink">pink</a-tag>
    <a-tag color="red">red</a-tag>
    <a-tag color="orange">orange</a-tag>
    <a-tag color="green">green</a-tag>
    <a-tag color="cyan">cyan</a-tag>
    <a-tag color="blue">blue</a-tag>
    <a-tag color="purple">purple</a-tag> -->

    <a-row :gutter="[24, 24]" class="mb-24">
      <a-col :span="8">
        <a-button type="primary" @click="openForm(null)">添加</a-button>
      </a-col>
      <a-col :span="8" :offset="8">
        <a-input-search v-model:value="filter" placeholder="请输入关键字检索" enter-button @search="onSearch" />
      </a-col>
    </a-row>

    <a-row :gutter="[24, 24]">
      <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" v-for="item in list">
        <a-tooltip placement="top">
          <template #title>
            <span> {{ item.apiUrl }}</span>
          </template>
          <a-card hoverable>
            <h3 v-if="item.state == 0"><span class="normal bg-danger"></span> {{ item.name }}</h3>
            <h3 v-if="item.state == 1"><span class="normal bg-cyan"></span> {{ item.name }}</h3>
            <h4>{{ item.groupName }}</h4>
            <p>任务规则<a-divider type="vertical" />{{ item.cron }}</p>
            <a-tag color="blue" v-if="item.requsetMode == 0">POST</a-tag>
            <a-tag color="green" v-if="item.requsetMode == 1">GET</a-tag>
            <a-tag color="orange" v-if="item.requsetMode == 2">DELETE</a-tag> {{ item.executeTime }}
            <a-divider />
            <a-button type="primary" size="small" v-if="item.state == 0" @click="run(item.id)"> 启动 </a-button>
            <a-button type="primary" size="small" danger v-if="item.state == 1" @click="close(item.id)"> 停止 </a-button>
            <a-dropdown class="ml-24">
              <template #overlay>
                <a-menu>
                  <a-menu-item key="1" @click="openForm(item.id)">修改</a-menu-item>
                  <a-menu-item key="2" @click="deleteList(item.id)">删除</a-menu-item>
                  <a-menu-item key="3" @click="openJobLogger(item.id)">执行记录</a-menu-item>
                </a-menu>
              </template>
              <a-button size="small">
                <AppIcon name="DashOutlined" />
              </a-button>
            </a-dropdown>
          </a-card>
        </a-tooltip>
      </a-col>
    </a-row>
    <Info ref="refForm" @onSuccess="findList()" />
    <!--弹层-->
    <a-drawer title="执行记录" placement="right" :closable="false" v-model:visible="jobForm.visible" :width="1000" destroyOnClose>
      <JobLogger v-model:formId="jobForm.key" />
    </a-drawer>
  </div>
</template>

<script>
import { defineComponent, onBeforeUnmount, onMounted, reactive, ref, toRefs } from "vue";
import AppIcon from "@/components/AppIcon.vue";
import Info from "./Info.vue";
import service from "@/service/development_tool/timedTaskService.js";
import tools from "@/scripts/tools.js";
import JobLogger from "./JobLogger.vue";

export default defineComponent({
  name: "TimedTaskCom",
  components: { AppIcon, Info, JobLogger },
  setup() {
    const state = reactive({
      list: [],
      filter: "",
      jobForm: {
        visible: false,
        key: Object,
      },
      timer: null,
    });

    const refForm = ref(null);

    const methods = {
      findList() {
        service.findList(state.filter).then((res) => {
          state.list = res.data;
        });
      },
      //删除数据
      deleteList(id) {
        let ids = [];
        if (id) {
          ids.push(id);
        } else {
          ids = [];
        }
        service.deleteList(ids).then((res) => {
          if (res.code != 1) return;
          tools.message("删除成功!", "成功");
          methods.findList();
        });
      },
      //打开表单页面
      openForm(id) {
        refForm.value.openForm({
          visible: true,
          key: id,
        });
      },
      //运行
      run(id) {
        let ids = [];
        ids.push(id);
        service.run(ids).then((res) => {
          if (res.code != 1) return;
          tools.message("运行成功!", "成功");
          methods.findList();
        });
      },
      //关闭
      close(id) {
        let ids = [];
        ids.push(id);
        service.close(ids).then((res) => {
          if (res.code != 1) return;
          tools.message("关闭成功!", "成功");
          methods.findList();
        });
      },
      /**
       * 打开日志界面
       * @param {*} id
       */
      openJobLogger(id) {
        state.jobForm.visible = true;
        state.jobForm.key = id;
      },
      onSearch() {
        methods.findList();
      },
    };

    onMounted(() => {
      methods.findList();
      state.timer = setInterval(() => {
        methods.findList();
      }, 10 * 1000);
    });

    onBeforeUnmount(() => {
      clearInterval(state.timer);
    });

    return {
      ...methods,
      ...toRefs(state),
      refForm,
    };
  },
});
</script>
<style lang="less" scoped>
.normal {
  width: 8px;
  height: 8px;
  display: block;
  border-radius: 50%;
  position: absolute;
  left: 15px;
  top: 28px;
}
</style>
