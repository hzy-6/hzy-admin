<template>
  <div>
    <a-card class="mb-15" v-show="state.fromSearch.state">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.fromSearch.vm.value" placeholder="用户名" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.fromSearch.vm.value" placeholder="年龄" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.fromSearch.vm.value" placeholder="地址" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.fromSearch.vm.value" placeholder="用户名" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.fromSearch.vm.value" placeholder="地址" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.fromSearch.vm.value" placeholder="地址1" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.fromSearch.vm.value" placeholder="地址2" />
        </a-col>
        <!--button-->
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" style="float: right">
          <a-button type="primary" class="mr-15" @click="methods.findList()">查询</a-button>
          <a-button class="mr-15" @click="methods.findList()">重置</a-button>
        </a-col>
      </a-row>
    </a-card>
    <a-card>
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
          <a-button class="mr-15" @click="state.fromSearch.state = !state.fromSearch.state">
            <div v-if="state.fromSearch.state"><AppIcon name="UpOutlined" />&nbsp;&nbsp;收起</div>
            <div v-else><AppIcon name="DownOutlined" />&nbsp;&nbsp;展开</div>
          </a-button>
          <a-button type="primary" class="mr-15" @click="methods.openForm()">
            <template #icon>
              <AppIcon name="PlusOutlined" />
            </template>
            新建
          </a-button>
          <a-popconfirm title="您确定要删除?" @confirm="confirm" okText="确定" cancelText="取消">
            <a-button type="primary" danger class="mr-15">
              <template #icon>
                <AppIcon name="DeleteOutlined" />
              </template>
              批量删除
            </a-button>
          </a-popconfirm>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" class="text-right">
          <a-dropdown>
            <template #overlay>
              <a-menu @click="handleMenuClick">
                <a-menu-item key="1" @click="exportExcel">导出 Excel</a-menu-item>
                <a-menu-item key="2" @click="exportExcel">下载 导入模板</a-menu-item>
                <a-menu-item key="3" @click="exportExcel">导入 Excel</a-menu-item>
              </a-menu>
            </template>
            <a-button>
              更多操作
              <AppIcon name="DownOutlined" />
            </a-button>
          </a-dropdown>
        </a-col>
      </a-row>

      <a-table
        size="middle"
        class="mt-15"
        :columns="state.table.columns"
        :data-source="state.table.data"
        :pagination="{ pageSize: 10 }"
        :loading="state.table.loading"
        :scroll="{ x: 'calc(100wh - 300px)' }"
        :row-selection="rowSelection"
      >
        <template #bodyCell="{ column, text }">
          <template v-if="column.dataIndex === 'id'">
            <span>
              <a href="javascript:;" @click="methods.openForm(text)">修改</a>
              <a-divider type="vertical" />
              <a class="text-danger">删除{{ text }}</a>
            </span>
          </template>
        </template>
      </a-table>
    </a-card>
    <Info ref="refInfo" @onSuccess="() => methods.findList()" />
  </div>
</template>

<script>
export default { name: "ListIndexCom" };
</script>
<script setup>
import { reactive, ref, onMounted } from "vue";
import AppIcon from "@/components/AppIcon.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";

const columns = [
  {
    title: "序号",
    dataIndex: "key",
    width: 80,
    fixed: "left",
  },
  {
    title: "姓名",
    dataIndex: "name",
    ellipsis: true,
    width: 130,
  },
  {
    title: "年龄",
    dataIndex: "age",
    ellipsis: true,
    width: 180,
  },
  {
    title: "地址",
    dataIndex: "address",
    ellipsis: true,
    width: 180,
  },
  {
    title: "列1",
    dataIndex: "column1",
    ellipsis: true,
    width: 180,
  },
  {
    title: "列2",
    dataIndex: "column2",
    ellipsis: true,
    width: 180,
  },
  {
    title: "列3",
    dataIndex: "column3",
    ellipsis: true,
    width: 180,
  },
  {
    title: "列4",
    dataIndex: "column4",
    ellipsis: true,
    width: 180,
  },
  {
    title: "操作",
    dataIndex: "id",
    width: 120,
    fixed: "right",
  },
];

const state = reactive({
  fromSearch: {
    state: false,
    fieldCount: 7,
    vm: {
      value: "",
    },
  },
  table: {
    loading: false,
    columns: [],
    data: [],
  },
});

//表单操作对象
const refInfo = ref(null);

const methods = {
  findList() {
    state.table.loading = true;
    state.table.columns = columns;
    setTimeout(() => {
      const data = [];
      for (let i = 0; i < 100; i++) {
        data.push({
          key: i + 1,
          name: `Hzy ${i + 1}`,
          age: 18 + i,
          address: `addr. ${i + 1}`,
          column1: `London Park no. ${i}`,
          column2: `London Park no. ${i}`,
          column3: `London Park no. ${i}`,
          column4: `London Park no. ${i}`,
          id: i,
        });
      }
      state.table.data = data;
      state.table.loading = false;
    }, 1.5 * 1000);
  },
  exportExcel() {
    tools.notice("导出Excel成功!", "成功", "提醒");
  },
  confirm() {
    tools.message("删除成功!", "成功");
  },
  //打开表单页面
  openForm(id) {
    refInfo.value.openForm({ visible: true, key: id });
  },
};

//多选对象
const rowSelection = {
  onChange: (selectedRowKeys, selectedRows) => {
    console.log(`selectedRowKeys: ${selectedRowKeys}`, "selectedRows: ", selectedRows);
  },
  getCheckboxProps: (record) => ({
    // disabled: record.name === "Disabled User",
    // Column configuration not to be checked
    name: record.name,
  }),
};

onMounted(() => {
  methods.findList();
});
</script>
