<script lang="ts">
// 组件命名
export default { name: "ListIndexCom" };
</script>
<!-- 逻辑代码 -->
<script lang="ts" setup>
import { reactive, ref, onMounted } from "vue";
import CrudList from "@/infrastructure/components/curd/CrudList.vue";
import tools, { EMessageType } from "@/infrastructure/scripts/tools";
import HttpClient from "@/infrastructure/scripts/Http";
import Info from "./Info.vue";

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
  findList();
});

/**
 * 获取列表数据
 */
function findList() {
  state.loading = true;
  setTimeout(() => {
    const data = [];
    for (let i = 0; i < 15; i++) {
      data.push({
        key: i + 1,
        name: `Hzy ${i + 1}`,
        age: 18 + i,
        address: `addr. ${i + 1}`,
        column1: `London Park no1. ${i}`,
        column2: `London Park no2. ${i}`,
        column3: `London Park no3. ${i}`,
        column4: `London Park no4. ${i}`,
        column5: `London Park no5. ${i}`,
        id: i,
      });
    }
    state.total = 290;
    state.data = data;
    state.loading = false;
  }, 1 * 1000);
  // HttpClient.get("/app/AppTest").then(res => {
  //   console.log(res);
  // });
}

/**
 * 导出数据
 */
function exportExcel() {
  tools.notice("导出Excel成功!", EMessageType.警告, "提醒");
}

/**
 * 是否删除
 */
function confirm() {
  tools.message("删除成功!", EMessageType.成功);
  findList();
}

/**
 * 打开表单页面
 */
function openForm(id: string) {
  refInfo.value!.openForm({ visible: true, key: id });
}
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
            <el-button plain type="primary" @click="findList">检索</el-button>
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
          <el-button plain icon="PlusOutlined" type="primary" @click="openForm('')"> 新建 </el-button>
          <!-- 批量删除 -->
          <el-popconfirm title="您确定要删除?" @confirm="confirm()">
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
                <el-dropdown-item @click="exportExcel()">下载 导入模板</el-dropdown-item>
                <el-dropdown-item @click="exportExcel()">导入 Excel</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </el-space>
      </template>
      <!-- 表格 表列头 -->
      <template #table-col>
        <el-table-column prop="name" label="姓名" width="180" />
        <el-table-column prop="age" label="年龄" width="180" />
        <el-table-column prop="address" label="家庭地址" />
        <el-table-column prop="column1" label="列1" />
        <el-table-column prop="column2" label="列2" />
        <el-table-column prop="column3" label="列3" />
        <el-table-column prop="column4" label="列4" />
        <el-table-column prop="column5" label="列5" />
        <el-table-column prop="action" label="操作">
          <template #default>
            <el-button link type="primary" @click="openForm('')">编辑</el-button>
            <el-button link type="danger" @click="confirm()">删除</el-button>
          </template>
        </el-table-column>
      </template>
    </CrudList>

    <Info ref="refInfo" @onSuccess="() => findList()" />
  </div>
</template>
