<template>
  <div>
    <List ref="refList" :tableData="state" @onChange="methods.onChange">
      <!-- 检索插槽 -->
      <template #search>
        <a-row :gutter="[15, 15]">
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
            <a-input v-model:value="state.search.vm.api" placeholder="接口地址" />
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
            <a-input v-model:value="state.search.vm.browser" placeholder="浏览器" />
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
            <a-input v-model:value="state.search.vm.ip" placeholder="ip地址" />
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
            <a-input v-model:value="state.search.vm.os" placeholder="操作系统" />
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
            <a-range-picker v-model:value="state.search.vm.rangeTime" />
          </a-col>

          <!--button-->
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" style="float: right">
            <a-button type="primary" class="mr-15" @click="methods.findList">查询</a-button>
            <a-button class="mr-15" @click="methods.onResetSearch">重置</a-button>
          </a-col>
        </a-row>
      </template>
      <!-- 工具栏左侧插槽 -->
      <template #toolbar-left>
        <!-- 清空所有数据 -->
        <template v-if="power.delete">
          <a-popconfirm title="您确定要删除吗?" @confirm="methods.deleteList()" okText="确定" cancelText="取消">
            <a-button type="danger">
              <template #icon>
                <AppIcon name="DeleteOutlined" />
              </template>
              清空所有数据
            </a-button>
          </a-popconfirm>
        </template>
      </template>
      <!-- 工具栏左侧插槽 -->
      <template #toolbar-right>
        <a-input v-model:value="state.search.vm.api" placeholder="接口地址" @keyup="methods.findList" />
        <a-button @click="methods.onResetSearch">重置</a-button>
        <!-- 检索 -->
        <template v-if="power.search">
          <a-button @click="state.search.state = !state.search.state">
            <template #icon>
              <AppIcon :name="state.search.state ? 'UpOutlined' : 'DownOutlined'" />
            </template>
            检索
          </a-button>
        </template>
      </template>

      <!-- 表格 -->
      <template #table-col>
        <vxe-column field="api" title="接口地址" show-overflow min-width="300"></vxe-column>
        <vxe-column field="os" title="操作系统" width="100"></vxe-column>
        <vxe-column field="browser" title="浏览器" width="100"></vxe-column>
        <vxe-column field="ip" title="ip地址" width="120"></vxe-column>
        <vxe-column title="接口描述" width="300">
          <template #default="{ row }">
            <!-- <a-tag>
              {{ row.controllerDisplayName }}
              <template v-if="row.controllerDisplayName && row.actionDisplayName"> - </template>
              {{ row.actionDisplayName }}
            </a-tag> -->
            {{ row.controllerDisplayName }}
            <template v-if="row.controllerDisplayName && row.actionDisplayName"> - </template>
            {{ row.actionDisplayName }}
          </template>
        </vxe-column>
        <vxe-column field="takeUpTime" title="接口耗时" width="100">
          <template #default="{ row }">
            <a-tag v-if="row.takeUpTime >= 1000" color="orange">{{ row.takeUpTime }}(毫秒)</a-tag>
            <a-tag v-else-if="row.takeUpTime >= 2000" color="red">{{ row.takeUpTime }}(毫秒)</a-tag>
            <a-tag v-else color="#87d068">{{ row.takeUpTime }}(毫秒)</a-tag>
          </template>
        </vxe-column>
        <vxe-column field="userName" title="操作人姓名" width="120"></vxe-column>
        <vxe-column field="loginName" title="操作人账号" width="120"></vxe-column>
        <vxe-column field="creationTime" title="创建时间" width="180"></vxe-column>
        <vxe-column field="id" title="操作" width="100">
          <template #default="{ row }">
            <a href="javascript:void(0)" @click="methods.openForm(row.id)">详情</a>
          </template>
        </vxe-column>
      </template>
    </List>

    <!--表单弹层-->
    <Info ref="refForm" @onSuccess="() => methods.findList()" />
  </div>
</template>
<script>
export default { name: "sys_operation_log" };
</script>
<script setup>
import { onMounted, reactive, ref } from "vue";
import { useAppStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import List from "@/components/curd/List.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";
import service from "@/service/system/sys_operation_log_serivce";
import router from "@/router/index";

const appStore = useAppStore();
const state = reactive({
  //检索
  search: {
    state: false,
    fieldCount: 2,
    vm: {
      name: null,
      api: null,
      browser: null,
      ip: null,
      os: null,
      rangeTime: [],
      startTime: null,
      endTime: null,
    },
  },
  loading: false,
  pageSizeOptions: [10, 20, 50, 100, 500, 1000],
  rows: 10,
  page: 1,
  total: 0,
  data: [],
  form: {
    visible: false,
    key: "",
  },
});
//表单 ref 对象
const refForm = ref(null);
const refList = ref(null);

//权限
const power = appStore.getPowerByMenuId(router.currentRoute.value.meta.menuId);

//事件 函数
const methods = {
  onChange(info) {
    const { currentPage, pageSize } = info;
    state.page = currentPage == 0 ? 1 : currentPage;
    state.rows = pageSize;
    methods.findList();
  },
  //重置检索条件
  onResetSearch() {
    state.page = 1;
    let searchVm = state.search.vm;
    for (let key in searchVm) {
      searchVm[key] = null;
    }
    methods.findList();
  },
  //获取列表数据
  findList() {
    state.loading = true;
    if (state.search.vm.rangeTime && state.search.vm.rangeTime.length == 2) {
      state.search.vm.startTime = state.search.vm.rangeTime[0].format("YYYY-MM-DD");
      state.search.vm.endTime = state.search.vm.rangeTime[1].format("YYYY-MM-DD");
    }

    service.findList(state.rows, state.page, state.search.vm).then((res) => {
      let data = res.data;
      state.loading = false;
      state.page = data.page;
      state.rows = data.size;
      state.total = data.total;
      state.data = data.dataSource;
    });
  },
  //删除数据
  deleteList() {
    service.deleteAllData().then((res) => {
      if (res.code != 1) return;
      tools.message("删除成功!", "成功");
      methods.findList();
    });
  },
  //打开表单页面
  openForm(id) {
    refForm.value.openForm({ visible: true, key: id });
  },
  exportExcel() {
    service.exportExcel(state.search.vm);
  },
};

onMounted(() => {
  methods.findList();
});
</script>
