<template>
  <div>
    <a-row :gutter="[15, 15]">
      <a-col :xs="24" :sm="12" :md="12" :lg="5" :xl="5">
        <a-card title="组织架构" class="w100 mb-15 min-height">
          <template #extra>
            <a href="javascript:void(0)" @click="methods.getFirst">查看一级</a>
          </template>
          <a-spin :spinning="state.tree.loadingTree">
            <a-tree v-model:expandedKeys="state.tree.expandedKeys" v-model:selectedKeys="state.tree.selectedKeys" :tree-data="state.tree.data" />
          </a-spin>
        </a-card>
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="19" :xl="19">
        <List ref="refList" :tableData="state" @onChange="methods.onChange">
          <!-- 检索插槽 -->
          <template #search>
            <a-row :gutter="[15, 15]">
              <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
                <a-input v-model:value="state.search.vm.name" placeholder="真实名称" />
              </a-col>
              <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
                <a-input v-model:value="state.search.vm.loginName" placeholder="账户名称" />
              </a-col>
              <!--button-->
              <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6" style="float: right">
                <a-button type="primary" class="mr-15" @click="methods.findList">查询</a-button>
                <a-button class="mr-15" @click="methods.onResetSearch">重置</a-button>
              </a-col>
            </a-row>
          </template>
          <!-- 工具栏左侧插槽 -->
          <template #toolbar-left>
            <!-- 新建 -->
            <template v-if="power.insert && !$props.isFindBack">
              <a-button type="primary" @click="methods.openForm()">
                <template #icon>
                  <AppIcon name="PlusOutlined" />
                </template>
                新建
              </a-button>
            </template>
            <!-- 批量删除 -->
            <template v-if="power.delete && !$props.isFindBack">
              <a-popconfirm title="您确定要删除吗?" @confirm="methods.deleteList()" okText="确定" cancelText="取消">
                <a-button type="danger">
                  <template #icon>
                    <AppIcon name="DeleteOutlined" />
                  </template>
                  批量删除
                </a-button>
              </a-popconfirm>
            </template>
            <!-- 查找带回按钮 -->
            <template v-if="$props.isFindBack">
              <a-button type="primary" @click="methods.findBack.onChange()">
                <template #icon>
                  <AppIcon name="CheckOutlined" />
                </template>
                带回数据
              </a-button>
            </template>
            <!-- 更多操作 -->
            <a-dropdown>
              <template #overlay>
                <a-menu>
                  <a-menu-item key="1" @click="methods.exportExcel">导出 Excel</a-menu-item>
                </a-menu>
              </template>
              <a-button>
                更多操作
                <AppIcon name="DownOutlined" />
              </a-button>
            </a-dropdown>
          </template>
          <!-- 工具栏右侧插槽 -->
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
            <!-- 列的隐藏显示 -->
            <a-popover>
              <template #content>
                <div v-for="item in state.columns.filter((w) => w.fieldName.substr(0, 1) != '_')">
                  <a-checkbox v-model:checked="item.show" @change="() => nextTick(() => refList.table.refreshColumn())">{{ item.title }}</a-checkbox>
                </div>
              </template>
              <a-button><AppIcon name="BarsOutlined" /></a-button>
            </a-popover>
            <!--  -->
          </template>
          <!-- 表格 -->
          <template #table-col-default>
            <!-- 动态列 -->
            <template v-for="item in state.columns.filter((w) => w.fieldName != 'id')">
              <vxe-column :field="item.fieldName" :title="item.title" :visible="item.show" :key="item.id" v-if="item.fieldName != 'id'"></vxe-column>
            </template>
            <!--  v-if="power.update || power.delete" 预防操作列还存在 -->
            <vxe-column field="id" title="操作" v-if="(power.update || power.delete) && !$props.isFindBack">
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
      </a-col>
    </a-row>
    <!--表单弹层-->
    <Info ref="refForm" @onSuccess="() => methods.findList()" />
  </div>
</template>
<script>
export default { name: "system_user" };
</script>
<script setup>
import { onMounted, reactive, ref, watch, computed, nextTick } from "vue";
import { useAppStore } from "@/store";
import List from "@/components/curd/List.vue";
import AppIcon from "@/components/AppIcon.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";
import service from "@/service/system/userService";
import organizationService from "@/service/system/organizationService";
import router from "@/router/index";

//定义组件事件
const emits = defineEmits(["onChange"]);
//定义组件属性
const props = defineProps({
  //查找带回
  isFindBack: {
    type: Boolean,
    default() {
      return false;
    },
  },
  //默认选中的行id
  defaultRowIds: Array,
  //类型 带回 多条(false)还是单条(true)
  type: {
    type: Boolean,
    default() {
      return true;
    },
  },
});

const appStore = useAppStore();
const state = reactive({
  //检索
  search: {
    state: false,
    vm: {
      name: null,
      loginName: null,
      organizationId: null,
    },
  },
  loading: false,
  pageSizeOptions: [10, 20, 50, 100, 500, 1000],
  rows: 10,
  page: 1,
  total: 0,
  columns: [], //表列头
  data: [],
  tree: {
    data: [],
    expandedKeys: [],
    selectedKeys: [],
    loadingTree: false,
  },
  findBack: {
    defaultRowIds: computed(() => props.defaultRowIds),
  },
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
      state.columns = data.columns;
      state.data = data.dataSource;
      //设置选中项
      methods.findBack.setCheckboxRow();
    });
  },
  //删除数据
  deleteList(id) {
    let ids = [];
    if (id) {
      ids.push(id);
    } else {
      ids = refList.value.table.getCheckboxRecords().map((w) => w.id);
    }
    service.deleteList(ids).then((res) => {
      if (res.code != 1) return;
      tools.message("删除成功!", "成功");
      methods.findList();
    });
  },
  //打开表单页面
  openForm(id) {
    if (!id && !state.search.vm.organizationId) {
      return tools.message("请选择组织!", "警告");
    }
    refForm.value.openForm({
      visible: true,
      key: id,
      organizationId: state.search.vm.organizationId,
    });
  },
  exportExcel() {
    service.exportExcel(state.search.vm);
  },
  //获取部门树
  sysOrganizationTree() {
    state.tree.loadingTree = true;
    organizationService.sysOrganizationTree().then((res) => {
      state.tree.loadingTree = false;
      let data = res.data;
      state.tree.data = data.rows;
      state.tree.expandedKeys = data.expandedRowKeys;
      // state.tree.selectedKeys = [data.rows[0].key];
      methods.findList();
    });
  },
  //获取一级菜单
  getFirst() {
    state.tree.selectedKeys = [];
  },
  //查找带回处理
  findBack: {
    initRows() {
      if (!props.isFindBack) return;
      watch(
        () => props.defaultRowIds,
        (value) => {
          methods.findBack.setCheckboxRow();
        }
      );
    },
    //设置默认选中项
    setCheckboxRow() {
      if (!props.isFindBack) return;
      refList.value.table.setAllCheckboxRow(false);
      refList.value.table.setCheckboxRow(methods.findBack.getRowsByIds(state.findBack.defaultRowIds), true);
    },
    //查找带回事件
    onChange() {
      if (!props.isFindBack) return;
      var rows = refList.value.table.getCheckboxRecords();
      if (props.type && rows.length > 1) {
        return tools.message("只能选择一条数据!", "警告");
      }
      emits("onChange", refList.value.table.getCheckboxRecords());
    },
    getRowsByIds(ids) {
      if (!props.isFindBack) return;
      var rows = [];
      var data = state.data;
      for (let index = 0; index < data.length; index++) {
        const element = data[index];
        if (ids.filter((w) => w == element.id).length > 0) {
          rows.push(element);
        }
      }
      return rows;
    },
  },
};

//初始化查找待会行数据
methods.findBack.initRows();

watch(
  () => state.tree.selectedKeys,
  (value) => {
    state.search.vm.organizationId = value.length > 0 ? value[0] : null;
    methods.findList();
  }
);

onMounted(() => {
  methods.sysOrganizationTree();
});
</script>
<style scoped lang="less">
.min-height {
  min-height: calc(100vh - 130px);
}
</style>
