<script lang="ts">
// 组件命名
export default { name: "system_function" };
</script>
<!-- 逻辑代码 -->
<script lang="ts" setup>
import { reactive, ref, onMounted, nextTick } from "vue";
import CrudList from "@/infrastructure/components/curd/CrudList.vue";
import tools, { EMessageType } from "@/infrastructure/scripts/tools";
import Info from "./Info.vue";
import service from "@/services/system/FunctionService";

const state = reactive<{
  loading: boolean;
  rows: number;
  page: number;
  total: number;
  columns: any[]; //表列头
  data: any[];
  search: {
    state: boolean;
    vm: any;
  };
}>({
  loading: false,
  rows: 15,
  page: 1,
  total: 0,
  columns: [], //表列头
  data: [],
  search: {
    state: false,
    vm: {
      name: "",
    },
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
  findList();
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
 * 重置检索
 */
function onResetSearch(): void {
  state.page = 1;
  let searchVm = state.search.vm;
  for (let key in searchVm) {
    searchVm[key] = null;
  }
  findList();
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
    ids = refCrudList.value?.table?.getSelectionRows().map((w: any) => w.id);
  }
  service.deleteList(ids)?.then((res) => {
    if (res.code != 1) return;
    tools.message("删除成功!", EMessageType.成功);
    findList();
  });
}

/**
 * 打开表单页面
 */
function openForm(id: string | null) {
  //初始化表单
  nextTick(() => {
    refInfo.value?.init({ id });
  });
}
</script>

<template>
  <div class="p-20">
    <CrudList ref="refCrudList" :tableData="state" @onCurrentChange="() => findList()" @onSizeChange="() => findList()">
      <!-- 高级检索 -->
      <template #search>
        <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
          <el-form-item label-width="80px" label="名称">
            <el-input v-model="state.search.vm.name" placeholder="名称" style="width: 250px" />
          </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
          <!--button-->
          <el-form-item>
            <el-button plain type="primary" @click="findList()">检索</el-button>
            <el-button plain @click="onResetSearch()">重置</el-button>
            <el-button plain type="danger" @click="state.search.state = false">关闭</el-button>
          </el-form-item>
        </el-col>
      </template>

      <!-- 工具栏插槽 -->
      <template #toolbar>
        <el-space wrap :size="[20, 20]">
          <!-- 检索 -->
          <el-input v-model="state.search.vm.name" placeholder="请输入名称">
            <template #append>
              <el-button icon="Search" type="primary" @click="findList()" />
            </template>
          </el-input>
          <!-- 高级检索 -->
          <el-button plain icon="Filter" @click="state.search.state = !state.search.state"> 高级检索 </el-button>
          <!-- 新建 -->
          <el-button plain icon="PlusOutlined" type="primary" @click="openForm(null)" v-power="$router.currentRoute.value.meta.menuId + ':insert'"> 新建 </el-button>
          <!-- 批量删除 -->
          <el-popconfirm title="您确定要删除?" @confirm="deleteList(null)" v-power="$router.currentRoute.value.meta.menuId + ':delete'">
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
        <el-table-column prop="name" label="岗位名称" />
        <el-table-column prop="byName" label="岗位名称" />
        <el-table-column prop="lastModificationTime" label="更新时间" />
        <el-table-column prop="creationTime" label="创建时间" />
        <el-table-column prop="action" label="操作">
          <template #default="scope">
            <!-- 编辑 -->
            <el-button link type="primary" @click="openForm(scope.row.id)">编辑</el-button>
            <!-- 删除 -->
            <el-popconfirm title="您确定要删除?" @confirm="deleteList(scope.row.id)">
              <template #reference>
                <el-button link type="danger">删除</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </template>
    </CrudList>
    <!-- 表单弹框 -->
    <Info ref="refInfo" @onSuccess="() => findList()" />
  </div>
</template>
