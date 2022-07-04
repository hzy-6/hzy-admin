<template>
  <a-tabs v-model:activeKey="state.activeKey">
    <a-tab-pane key="1" tab="字段设置">
      <div>
        <a-card class="mb-15" v-show="state.table.search.state">
          <a-row :gutter="[15, 15]">
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
              <a-input v-model:value="state.table.search.vm.columnName" placeholder="名称" />
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
              <a-input v-model:value="state.table.search.vm.describe" placeholder="显示名称" />
            </a-col>
            <!--button-->
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" style="float: right">
              <a-button type="primary" class="mr-15" @click="methods.findList">查询</a-button>
              <a-button class="mr-15" @click="methods.onResetSearch">重置</a-button>
            </a-col>
          </a-row>
        </a-card>

        <!-- <a-card> -->
        <a-row :gutter="[15, 15]">
          <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <a-space :size="15">
              <!-- 检索 -->
              <template v-if="power.search">
                <a-button @click="state.table.search.state = !state.table.search.state">
                  <template #icon>
                    <AppIcon :name="state.table.search.state ? 'UpOutlined' : 'DownOutlined'" />
                  </template>
                  检索
                </a-button>
              </template>

              <!-- 同步表 -->
              <a-popconfirm title="您确定要更新表吗?可能会导致数据丢失" @confirm="methods.synchronization()" okText="确定" cancelText="取消">
                <a-button type="primary">
                  <template #icon>
                    <AppIcon name="ReloadOutlined" />
                  </template>
                  同步字段
                </a-button>
              </a-popconfirm>
              <!-- 提交更改 -->
              <a-popconfirm title="您确定要提交更改?" @confirm="methods.change()" okText="确定" cancelText="取消">
                <a-button type="primary">
                  <template #icon>
                    <AppIcon name="PlusOutlined" />
                  </template>
                  提交更改
                </a-button>
              </a-popconfirm>
              <!-- 删除 -->
              <a-popconfirm title="您确定要删除吗?" @confirm="methods.deleteList()" okText="确定" cancelText="取消">
                <a-button type="danger">
                  <template #icon>
                    <AppIcon name="DeleteOutlined" />
                  </template>
                  批量删除
                </a-button>
              </a-popconfirm>
            </a-space>
          </a-col>
          <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" class="text-right">
            <!-- <a-dropdown>
            <template #overlay>
              <a-menu>
                <a-menu-item key="1" @click="exportExcel">导出 Excel</a-menu-item>
              </a-menu>
            </template>
            <a-button>
              更多操作
              <AppIcon name="DownOutlined" />
            </a-button>
          </a-dropdown> -->
          </a-col>
        </a-row>
        <!-- 表格 -->
        <a-spin :spinning="state.table.loading">
          <vxe-table
            class="mt-15"
            ref="refTable"
            size="medium"
            border
            stripe
            :data="state.table.data"
            :row-config="{ isCurrent: true, isHover: true }"
            :column-config="{ isCurrent: true, resizable: true }"
            :checkbox-config="{ highlight: true }"
            :edit-config="{ trigger: 'click', mode: 'cell' }"
          >
            <vxe-column type="seq" width="50"></vxe-column>
            <vxe-column type="checkbox" width="50"></vxe-column>
            <vxe-column field="columnName" title="列名称"> </vxe-column>
            <vxe-column field="databaseColumnType" title="数据库类型" width="130px"> </vxe-column>
            <vxe-column field="csField" title="C#字段名称"> </vxe-column>
            <vxe-column field="csType" title="C#数据类型" width="100px"> </vxe-column>
            <vxe-column field="isPrimary" title="是否主键" width="100px">
              <template #default="{ row }">
                <a-tag color="success" v-if="row.isPrimary">是</a-tag>
                <a-tag color="default" v-else>否</a-tag>
              </template>
            </vxe-column>
            <vxe-column field="isIdentity" title="是否自增" width="100px">
              <template #default="{ row }">
                <a-tag color="success" v-if="row.isIdentity">是</a-tag>
                <a-tag color="default" v-else>否</a-tag>
              </template>
            </vxe-column>
            <!-- 显示名称 -->
            <vxe-column field="displayName" title="显示名称" :edit-render="{}" width="150px">
              <template #default="{ row }">{{ row.displayName }}</template>
              <template #edit="{ row }">
                <a-input v-model:value="row.displayName" placeholder="显示名称" />
              </template>
            </vxe-column>
            <!-- 列描述 -->
            <vxe-column field="describe" title="列描述" :edit-render="{}" width="150px">
              <template #default="{ row }">{{ row.describe }}</template>
              <template #edit="{ row }">
                <a-input v-model:value="row.describe" placeholder="列描述" />
              </template>
            </vxe-column>
            <!-- <vxe-column field="isNullable" title="能否为null" width="100px"> </vxe-column> -->
            <!-- <vxe-column field="position" title="位置" width="60px"> </vxe-column> -->
            <vxe-column field="lastModificationTime" title="更新时间" width="120px"></vxe-column>
            <vxe-column field="creationTime" title="创建时间" width="120px"></vxe-column>
            <vxe-column field="id" title="操作" width="80px">
              <template #default="{ row }">
                <!-- 
                <a href="javascript:void(0)" @click="openForm(row.id)">编辑</a>
     
              <a-divider type="vertical" /> -->
                <a-popconfirm title="您确定要删除吗?" @confirm="methods.deleteList(row.id)" okText="确定" cancelText="取消">
                  <a class="text-danger">删除</a>
                </a-popconfirm>
              </template>
            </vxe-column>
          </vxe-table>
          <vxe-pager
            background
            v-model:current-page="state.table.page"
            v-model:page-size="state.table.rows"
            :total="state.table.total"
            :page-sizes="state.table.pageSizeOptions"
            :layouts="['PrevJump', 'PrevPage', 'JumpNumber', 'NextPage', 'NextJump', 'Sizes', 'FullJump', 'Total']"
            @page-change="methods.onChange"
          >
          </vxe-pager>
        </a-spin>
        <!-- </a-card> -->
      </div>
    </a-tab-pane>
    <!-- <a-tab-pane key="2" tab="多表配置"> 多表配置 </a-tab-pane> -->
    <a-tab-pane key="3" tab="代码预览">
      <!--生成代码-->
      <CodeGenerationVue ref="refCodeGenerationVue" v-model:tableName="state.row.tableName" />
    </a-tab-pane>
    <a-tab-pane key="4" tab="代码载入项目">
      <CodeLoadToProjectVue ref="refCodeLoadToProjectVue" v-model:tableName="state.row.tableName" />
    </a-tab-pane>
  </a-tabs>
</template>

<script>
export default { name: "LowCode-ColumnIndex" };
</script>
<script setup>
import { reactive, ref, watch, nextTick } from "vue";
import { useAppStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import tools from "@/scripts/tools";
import service from "@/service/development_tool/low_code/low_code_table_info_service";
import router from "@/router/index";
import CodeGenerationVue from "./CodeGeneration.vue";
import CodeLoadToProjectVue from "./CodeLoadToProject.vue";

const appStore = useAppStore();
const state = reactive({
  table: {
    //检索
    search: {
      state: false,
      vm: {
        columnName: null,
        describe: null,
        //父组件传递过来的 表 id
        low_Code_TableId: null,
      },
    },
    loading: false,
    pageSizeOptions: [10, 20, 50, 100, 500, 1000],
    rows: 20,
    page: 1,
    total: 0,
    data: [],
  },
  row: {}, //主表传递过来的行信息
  title: "",
  activeKey: "1",
});

//表单 ref 对象
const refForm = ref(null);
const refTable = ref(null);
const refCodeGenerationVue = ref(null);
const refCodeLoadToProjectVue = ref(null);

//权限
const power = appStore.getPowerByMenuId(router.currentRoute.value.meta.menuId);

const methods = {
  onChange(info) {
    const { currentPage, pageSize } = info;
    state.table.page = currentPage == 0 ? 1 : currentPage;
    state.table.rows = pageSize;
    methods.findList();
  },
  //重置检索条件
  onResetSearch() {
    state.table.page = 1;
    let searchVm = state.table.search.vm;
    for (let key in searchVm) {
      if (key != "low_Code_TableId") {
        searchVm[key] = null;
      }
    }
    methods.findList();
  },
  //获取列表数据
  findList() {
    state.table.loading = true;
    service.findList(state.table.rows, state.table.page, state.table.search.vm).then((res) => {
      let data = res.data;
      state.table.loading = false;
      state.table.page = data.page;
      state.table.rows = data.size;
      state.table.total = data.total;
      state.table.data = data.dataSource;
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
  openForm(id) {
    refForm.value.openForm({ visible: true, key: id });
  },
  //同步表
  synchronization() {
    service.synchronization(state.row.id).then((res) => {
      tools.message("同步成功!", "成功");
      methods.findList();
    });
  },
  //变更数据
  change() {
    service.change(state.table.data).then((res) => {
      tools.message("数据变更成功!", "成功");
      methods.findList();
    });
  },
  loadData(row) {
    state.row = row;
    state.table.search.vm.low_Code_TableId = state.row.id;
    methods.findList();
  },
};

defineExpose({ ...methods });

//监控行变化
watch(
  () => state.activeKey,
  (value) => {
    if (value == "3") {
      nextTick(() => {
        refCodeGenerationVue.value.openForm({ key: state.row.tableName });
      });
    }
  }
);
</script>
