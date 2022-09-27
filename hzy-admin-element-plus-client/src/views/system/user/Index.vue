<script lang="ts">
// 组件命名
export default { name: "system_user" };
</script>
<!-- 逻辑代码 -->
<script lang="ts" setup>
import { reactive, ref, onMounted, watch } from "vue";
import CrudList from "@/infrastructure/components/curd/CrudList.vue";
import tools, { EMessageType } from "@/infrastructure/scripts/tools";
import Info from "./Info.vue";
import service from "@/services/system/UserService";
import organizationService from "@/services/system/OrganizationService";

const state = reactive<any>({
  search: {
    state: false,
    vm: {
      //当前选择的组织 id
      organizationId: null,
      value: "",
    },
  },
  loading: false,
  rows: 15,
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
});

//表单操作对象
const refInfo = ref<InstanceType<typeof Info>>();
//集合
const refCrudList = ref<InstanceType<typeof CrudList>>();

/**
 * 页面加载完成
 */
onMounted(() => {
  // findList();
  sysOrganizationTree();
});

/**
 * 获取列表数据
 */
function findList(): void {
  state.loading = true;
  service.findList(state.rows, state.page, state.search.vm).then((res) => {
    let data = res.data;
    state.loading = false;
    state.page = data.page;
    state.rows = data.size;
    state.total = data.total;
    state.columns = data.columns;
    state.data = data.dataSource;
  });
}

/**
 * 导出 excel 数据表格
 */
function exportExcel() {
  service.exportExcel(state.search.vm);
}

/**
 * 删除数据
 */
function deleteList(id: string | null): void {
  let ids = [];
  if (id) {
    ids.push(id);
  } else {
    console.log(refCrudList.value);
    ids = refCrudList.value.table.getSelectionRows().map((w) => w.id);
  }
  service.deleteList(ids).then((res) => {
    if (res.code != 1) return;
    tools.message("删除成功!", EMessageType.成功);
    findList();
  });
}

/**
 * 打开表单页面
 */
function openForm(id: string | null) {
  if (!id && !state.search.vm.organizationId) {
    return tools.message("请选择组织!", EMessageType.警告);
  }
  refInfo.value.openForm({
    visible: true,
    key: id,
    organizationId: state.search.vm.organizationId,
  });
}

/**
 * 获取部门树
 */
function sysOrganizationTree() {
  state.tree.loadingTree = true;
  organizationService.sysOrganizationTree().then((res) => {
    state.tree.loadingTree = false;
    let data = res.data;
    state.tree.data = data.rows;
    state.tree.expandedKeys = data.expandedRowKeys;
    findList();
  });
}

//如果选中组织有变化则请求接口查询
watch(
  () => state.search.vm.organizationId,
  (value) => {
    findList();
  }
);
</script>

<template>
  <div class="p-20">
    <el-row :gutter="20">
      <el-col :xs="24" :sm="12" :md="6" :lg="5" :xl="5" v-loading="state.tree.loadingTree">
        <el-card style="height: calc(100vh - 142px)">
          <template #header>
            <div style="display: flex; justify-content: space-between; align-items: center">
              <span>组织架构</span>
              <el-button class="button" text bg @click="state.search.vm.organizationId = null">查看所有用户</el-button>
            </div>
          </template>
          <el-tree
            :data="state.tree.data"
            default-expand-all
            :props="{ children: 'children', label: 'title' }"
            highlight-current
            :expand-on-click-node="false"
            @node-click="(res) => (state.search.vm.organizationId = res.key)"
          />
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="18" :lg="19" :xl="19">
        <CrudList ref="refCrudList" :tableData="state" @onCurrentChange="() => findList()" @onSizeChange="() => findList()">
          <!-- 高级检索 -->
          <template #search>
            <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6" v-for="item in 10">
              <el-form-item label-width="80px" label="用户名">
                <el-input v-model:value="state.search.vm.value" placeholder="用户名" style="width: 250px" />
              </el-form-item>
            </el-col>
            <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <!--button-->
              <el-form-item>
                <el-button plain type="primary" @click="findList()">检索</el-button>
                <el-button plain @click="findList()">重置</el-button>
                <el-button plain type="danger" @click="state.search.state = false">关闭</el-button>
              </el-form-item>
            </el-col>
          </template>

          <!-- 工具栏插槽 -->
          <template #toolbar>
            <el-space wrap :size="[20, 20]">
              <!-- 检索 -->
              <el-input v-model="state.search.vm.value" placeholder="请输入姓名">
                <template #append>
                  <el-button icon="Search" type="primary" @click="findList()" />
                </template>
              </el-input>
              <!-- 高级检索 -->
              <el-button plain icon="Filter" @click="state.search.state = !state.search.state"> 高级检索 </el-button>
              <!-- 新建 -->
              <el-button plain icon="PlusOutlined" type="primary" @click="openForm()"> 新建 </el-button>
              <!-- 批量删除 -->
              <el-popconfirm title="您确定要删除?" @confirm="deleteList()">
                <template #reference>
                  <el-button plain type="danger" icon="DeleteOutlined"> 批量删除 </el-button>
                </template>
              </el-popconfirm>
              <!-- 更多操作 -->
              <el-dropdown>
                <el-button plain icon="DownOutlined"> 更多操作 </el-button>
                <template #dropdown>
                  <el-dropdown-menu>
                    <el-dropdown-item @click="exportExcel()">导出 Excel</el-dropdown-item>
                  </el-dropdown-menu>
                </template>
              </el-dropdown>
            </el-space>
          </template>
          <!-- 表格 表列头-->
          <template #table-col>
            <!-- 动态列 -->
            <template v-for="item in state.columns.filter((w) => w.fieldName != 'id' && w.show)" :key="item.id">
              <el-table-column :prop="item.fieldName" :label="item.title" />
            </template>
            <el-table-column prop="action" label="操作">
              <template #default="scope">
                <el-button link type="primary" @click="openForm(scope.row.id)">编辑</el-button>
                <el-button link type="danger" @click="deleteList(scope.row.id)">删除</el-button>
              </template>
            </el-table-column>
          </template>
        </CrudList>
      </el-col>
    </el-row>

    <Info ref="refInfo" @onSuccess="() => findList()" />
  </div>
</template>
