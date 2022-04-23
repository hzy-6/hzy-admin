<template>
  <div>
    <a-card class="mb-15" v-show="state.search.state">
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
    </a-card>

    <a-card>
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
          <a-space :size="15">
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
          </a-space>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" class="text-right" style="display: inline-flex; justify-content: end">
          <a-space :size="15">
            <!-- 检索 -->
            <template v-if="power.search">
              <a-button @click="state.search.state = !state.search.state">
                <template #icon>
                  <AppIcon :name="state.search.state ? 'UpOutlined' : 'DownOutlined'" />
                </template>
                检索
              </a-button>
            </template>
          </a-space>
        </a-col>
      </a-row>

      <!-- 表格 -->
      <a-spin :spinning="state.loading">
        <vxe-table
          class="mt-15"
          ref="refTable"
          border
          stripe
          :data="state.data"
          :row-config="{ isCurrent: true, isHover: true }"
          :column-config="{ isCurrent: true, resizable: true }"
          :checkbox-config="{ highlight: true }"
          :tree-config="{ transform: true, rowField: 'id', parentField: 'parentId' }"
          @toggle-tree-expand="methods.onToggleTreeExpand"
        >
          <vxe-column type="checkbox" width="40"></vxe-column>
          <vxe-column field="name" title="名称" show-overflow tree-node width="200"></vxe-column>
          <vxe-column field="icon" title="图标" width="60">
            <template #default="{ row }">
              <AppIcon :name="row.icon" />
            </template>
          </vxe-column>
          <vxe-column field="number" title="编号" width="80"></vxe-column>
          <vxe-column field="componentName" title="组件名称" show-overflow min-width="220"></vxe-column>
          <vxe-column field="url" title="组件地址" show-overflow width="250"></vxe-column>
          <vxe-column field="router" title="路由地址" show-overflow width="250"></vxe-column>
          <!-- <vxe-column field="parentName" title="父级菜单"></vxe-column> -->
          <vxe-column field="lastModificationTime" title="更新时间" width="120">
            <template #default="{ row }">
              {{ dayjs(row.lastModificationTime).format("YYYY-MM-DD") }}
            </template>
          </vxe-column>
          <vxe-column field="creationTime" title="创建时间" width="120">
            <template #default="{ row }">
              {{ dayjs(row.creationTime).format("YYYY-MM-DD") }}
            </template>
          </vxe-column>
          <vxe-column field="id" title="操作" width="200">
            <template #default="{ row }">
              <template v-if="power.insert">
                <a href="javascript:void(0)" @click="methods.openForm(null, row.id)">新建</a>
                <a-divider type="vertical" />
              </template>
              <template v-if="power.update">
                <a href="javascript:void(0)" @click="methods.openForm(row.id, row.parentId)">编辑</a>
                <a-divider type="vertical" />
              </template>
              <template v-if="power.delete">
                <a-popconfirm title="您确定要删除吗?" @confirm="methods.deleteList(row.id)" okText="确定" cancelText="取消">
                  <a class="text-danger">删除</a>
                </a-popconfirm>
              </template>
            </template>
          </vxe-column>
        </vxe-table>
      </a-spin>
    </a-card>
    <!--表单弹层-->
    <Info ref="refForm" @onSuccess="() => methods.findList()" />
  </div>
</template>
<script>
export default { name: "system_menu" };
</script>
<script setup>
import { onMounted, reactive, ref, nextTick } from "vue";
import { useAppStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";
import service from "@/service/system/menuService";
import router from "@/router/index";
import dayjs from "dayjs";

const appStore = useAppStore();
const state = reactive({
  //检索
  search: {
    state: false,
    fieldCount: 2,
    vm: {
      name: null,
    },
  },
  loading: false,
  data: [],
  expandRows: [],
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
      searchVm[key] = null;
    }
    methods.findList();
  },
  //获取列表数据
  findList() {
    state.loading = true;
    service.getAll(state.search.vm).then((res) => {
      let data = res.data;
      state.loading = false;
      state.data = data;
      nextTick(() => methods.recoveryOpenRows());
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
      methods.findList();
    });
  },
  //打开表单页面
  openForm(id, parentId) {
    refForm.value.openForm({
      visible: true,
      key: id,
      parentId,
    });
  },
  //{ expanded, row, column, columnIndex, $columnIndex, $event }
  onToggleTreeExpand() {
    // console.log(expanded, row, column, columnIndex, $columnIndex, $event, refTable.value.getTreeExpandRecords());
    state.expandRows = refTable.value.getTreeExpandRecords();
  },
  //保存完成刷新表格数据后,恢复展开行
  recoveryOpenRows() {
    var rows = state.expandRows;
    if (rows.length > 0) {
      refTable.value.setTreeExpand(state.data[1], true);
      rows.forEach((element) => {
        refTable.value.setTreeExpand(
          state.data.filter((w) => w.id == element.id),
          true
        );
      });
    }
  },
};

onMounted(() => {
  methods.findList();
});
</script>
