<script lang="ts">
// 组件命名
export default { name: "system_user" };
</script>
<!-- 逻辑代码 -->
<script lang="ts" setup>
import { reactive, ref, onMounted } from "vue";
import CrudList from "@/infrastructure/components/curd/CrudList.vue";
import tools, { EMessageType } from "@/infrastructure/scripts/tools";
import Info from "./Info.vue";
import service from "@/services/system/UserService";

const state = reactive<any>({
  search: {
    state: false,
    vm: {
      value: "",
    },
  },
  loading: false,
  rows: 15,
  page: 1,
  total: 0,
  columns: [], //表列头
  data: [],
});

//表单操作对象
const refInfo = ref<InstanceType<typeof Info>>();

onMounted(() => {
  methods.findList();
  // HttpClient.get("/app/AppTest").then(res => {
  //   console.log(res);
  // });
});

const methods = {
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
    });
  },
  exportExcel() {
    tools.notice("导出Excel成功!", EMessageType.警告, "提醒");
  },
  confirm() {
    tools.message("删除成功!", EMessageType.成功);
    methods.findList();
  },
  //打开表单页面
  openForm(id: string) {
    refInfo.value!.openForm({ visible: true, key: id });
  },
};
</script>

<template>
  <div class="p-20">
    <CrudList ref="" :tableData="state" @on-current-change="">
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
            <el-button plain type="primary" @click="methods.findList">检索</el-button>
            <el-button plain @click="methods.findList()">重置</el-button>
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
              <el-button icon="Search" type="primary" @click="methods.findList()" />
            </template>
          </el-input>
          <!-- 高级检索 -->
          <el-button plain icon="Filter" @click="state.search.state = !state.search.state"> 高级检索 </el-button>
          <!-- 新建 -->
          <el-button plain icon="PlusOutlined" type="primary" @click="methods.openForm('')"> 新建 </el-button>
          <!-- 批量删除 -->
          <el-popconfirm title="您确定要删除?" @confirm="methods.confirm()">
            <template #reference>
              <el-button plain type="danger" icon="DeleteOutlined"> 批量删除 </el-button>
            </template>
          </el-popconfirm>
          <!-- 更多操作 -->
          <el-dropdown>
            <el-button plain icon="DownOutlined"> 更多操作 </el-button>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item @click="methods.exportExcel">导出 Excel</el-dropdown-item>
                <el-dropdown-item @click="methods.exportExcel">下载 导入模板</el-dropdown-item>
                <el-dropdown-item @click="methods.exportExcel">导入 Excel</el-dropdown-item>
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
          <template #default>
            <el-button link type="primary" @click="methods.openForm('')">编辑</el-button>
            <el-button link type="danger" @click="methods.confirm()">删除</el-button>
          </template>
        </el-table-column>
      </template>
    </CrudList>

    <Info ref="refInfo" @onSuccess="() => methods.findList()" />
  </div>
</template>
