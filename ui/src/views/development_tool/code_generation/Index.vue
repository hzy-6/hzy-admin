<template>
  <div>
    <List ref="refList" :tableData="state" @onChange="methods.onChange">
      <!-- 检索插槽 -->
      <template #search>
        <!-- <a-row :gutter="[15, 15]">
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
            <a-input v-model:value="state.search.vm.tableName" placeholder="名称" />
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" style="float: right">
            <a-button type="primary" class="mr-15" @click="methods.findList">查询</a-button>
            <a-button class="mr-15" @click="methods.onResetSearch">重置</a-button>
          </a-col>
        </a-row> -->
      </template>
      <!-- 工具栏左侧插槽 -->
      <template #toolbar-left>
        <a-button type="primary" class="mr-15" @click="createDataDictionary()">
          <template #icon>
            <AppIcon name="DownloadOutlined" />
          </template>
          下载数据库设计(Excel)
        </a-button>
      </template>
      <!-- 工具栏左侧插槽 -->
      <template #toolbar-right>
        <a-input v-model:value="state.search.vm.tableName" placeholder="名称" @keyup="methods.findList" />
        <a-button @click="methods.onResetSearch">重置</a-button>
        <!-- 检索 -->
        <!-- <template v-if="power.search">
          <a-button @click="state.search.state = !state.search.state">
            <template #icon>
              <AppIcon :name="state.search.state ? 'UpOutlined' : 'DownOutlined'" />
            </template>
            检索
          </a-button>
        </template> -->
      </template>

      <!-- 表格 -->
      <template #table-col-default>
        <vxe-column field="schema" title="数据库空间"></vxe-column>
        <vxe-column field="tableName" title="表名称"></vxe-column>
        <vxe-column field="remark" title="表备注"></vxe-column>
        <vxe-column field="type" title="表类型"></vxe-column>
        <vxe-column field="id" title="操作">
          <template #default="{ row }">
            <a href="javascript:void(0)" @click="methods.openForm(row.tableName)">查看代码</a>
            <!-- <a-divider type="vertical" /> -->
          </template>
        </vxe-column>
      </template>
    </List>

    <!--表单弹层-->
    <Info ref="refForm" @onSuccess="() => findList()" />
  </div>
</template>

<script>
export default { name: "code_generation_index" };
</script>
<script setup>
import { defineComponent, onMounted, reactive, toRefs, ref } from "vue";
import { useAppStore } from "@/store";
import List from "@/components/curd/List.vue";
import AppIcon from "@/components/AppIcon.vue";
import Info from "./Info.vue";
import service from "@/service/development_tool/code_generation_service";
import router from "@/router/index";

const appStore = useAppStore();
const state = reactive({
  //检索
  search: {
    state: false,
    vm: {
      tableName: null,
    },
  },
  loading: false,
  pageSizeOptions: [10, 20, 50, 100, 500, 1000],
  rows: 10,
  page: 1,
  total: 0,
  data: [],
});

//表单 ref 对象
const refForm = ref(null);
const refList = ref(null);

//权限
const power = appStore.getPowerByMenuId(router.currentRoute.value.meta.menuId);

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
    service.findList(state.rows, state.page, state.search.vm).then((res) => {
      let data = res.data;
      state.loading = false;
      state.page = data.page;
      state.rows = data.size;
      state.total = data.total;
      state.data = data.dataSource;
    });
  },
  //打开表单页面
  openForm(id) {
    refForm.value.openForm({ visible: true, key: id });
  },
  // exportExcel() {
  //   service.exportExcel(state.search.vm);
  // },

  /**
   * 创建数据库设计字典
   */
  createDataDictionary() {
    service.createDataDictionary();
  },
};

onMounted(() => {
  methods.findList();
});
</script>
