<template>
  <div>
    <a-row :gutter="[15, 15]">
      <a-col :xs="24" :sm="12" :md="12" :lg="5" :xl="5">
        <a-card title="数据字典树" class="w100 mb-15">
          <template #extra><a href="javascript:void(0)" @click="methods.getFirst">查看一级</a></template>
          <a-spin :spinning="state.tree.loadingTree">
            <a-tree v-model:selectedKeys="state.tree.selectedKeys" :tree-data="state.tree.data" />
          </a-spin>
        </a-card>
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="19" :xl="19">
        <List ref="refList" :tableData="state" @onChange="methods.onChange">
          <!-- 检索插槽 -->
          <template #search>
            <a-row :gutter="[15, 15]">
              <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
                <a-input v-model:value="state.search.vm.name" placeholder="名称" />
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
            <!-- 新建 -->
            <template v-if="power.insert">
              <a-button type="primary" @click="methods.openForm()">
                <template #icon>
                  <AppIcon name="PlusOutlined" />
                </template>
                新建
              </a-button>
            </template>
            <!-- 批量删除 -->
            <template v-if="power.delete">
              <a-popconfirm title="您确定要删除吗?" @confirm="methods.deleteList()" okText="确定" cancelText="取消">
                <a-button type="danger">
                  <template #icon>
                    <AppIcon name="DeleteOutlined" />
                  </template>
                  批量删除
                </a-button>
              </a-popconfirm>
            </template>
          </template>
          <!-- 工具栏左侧插槽 -->
          <template #toolbar-right>
            <a-input v-model:value="state.search.vm.name" placeholder="名称" @keyup="methods.findList" />
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
          <template #table-col-default>
            <vxe-column field="sort" title="序号"></vxe-column>
            <vxe-column field="code" title="编号"></vxe-column>
            <vxe-column field="name" title="分组名称/键"></vxe-column>
            <vxe-column field="value" title="值"></vxe-column>
            <vxe-column field="lastModificationTime" title="更新时间"></vxe-column>
            <vxe-column field="creationTime" title="创建时间"></vxe-column>
            <vxe-column field="id" title="操作">
              <template #default="{ row }">
                <template v-if="power.update">
                  <a href="javascript:void(0)" @click="methods.openForm(row.id)">编辑</a>
                </template>
                <a-divider type="vertical" />
                <template v-if="power.delete">
                  <a-popconfirm title="您确定要删除吗?" @confirm="methods.deleteList(row.id)" okText="确定" cancelText="取消">
                    <a class="text-danger">删除</a>
                  </a-popconfirm>
                </template>
              </template>
            </vxe-column>
          </template>
        </List>

        <!--表单弹层-->
        <Info ref="refForm" @onSuccess="() => methods.onSaveSuccess()" />
      </a-col>
    </a-row>
  </div>
</template>

<script>
export default { name: "system_dictionary" };
</script>
<script setup>
import { onMounted, reactive, ref, watch } from "vue";
import { useAppStore } from "@/store";
import List from "@/components/curd/List.vue";
import AppIcon from "@/components/AppIcon.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";
import service from "@/service/system/dictionary_service";
import router from "@/router/index";

const appStore = useAppStore();
const state = reactive({
  //检索
  search: {
    state: false,
    fieldCount: 2,
    vm: {
      name: null,
      parentId: null,
    },
  },
  loading: false,
  pageSizeOptions: [10, 20, 50, 100, 500, 1000],
  rows: 10,
  page: 1,
  total: 0,
  data: [],
  tree: {
    data: [],
    expandedKeys: [],
    autoExpandParent: true,
    checkedKeys: [],
    selectedKeys: [],
    loadingTree: false,
  },
});
//表单 ref 对象
const refForm = ref(null);
const refTable = ref(null);

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
      if (key == "parentId") continue;
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
  //删除数据
  deleteList(id) {
    let ids = [];
    if (id) {
      ids.push(id);
    } else {
      ids = refTable.value.getCheckboxRecords().map((w) => w.id);
    }
    service.deleteList(ids).then((res) => {
      if (res.code != 1) return;
      tools.message("删除成功!", "成功");
      methods.getDictionaryTree();
      methods.findList();
    });
  },
  //打开表单页面
  openForm(id) {
    refForm.value.openForm({
      visible: true,
      key: id,
      parentId: state.search.vm.parentId,
    });
  },
  //表单保存成功
  onSaveSuccess() {
    methods.getDictionaryTree();
    methods.findList();
  },
  //获取菜单树
  getDictionaryTree() {
    state.tree.loadingTree = true;
    service.getDictionaryTree().then((res) => {
      state.tree.loadingTree = false;
      if (res.code != 1) return;
      let data = res.data;
      state.tree.data = data;
      // state.tree.expandedKeys = data.defaultExpandedKeys;
      // state.tree.checkedKeys = data.defaultCheckedKeys;
    });
  },
  //获取一级菜单
  getFirst() {
    state.tree.selectedKeys = [];
  },
};

watch(
  () => state.tree.selectedKeys,
  (value) => {
    state.search.vm.parentId = value.length > 0 ? value[0] : null;
    methods.findList();
  }
);

onMounted(() => {
  methods.getDictionaryTree();
  methods.findList();
});
</script>
