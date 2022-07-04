<template>
  <div>
    <a-card class="mb-15" v-show="state.table.search.state">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.table.search.vm.tableName" placeholder="表名称" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.table.search.vm.entityName" placeholder="实体名称" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.table.search.vm.displayName" placeholder="显示名称" />
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
                同步表
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

            <!-- 下载数据库表设计 -->
            <template v-if="power.search">
              <a-button @click="methods.createDataDictionary()">
                <template #icon>
                  <AppIcon name="DownloadOutlined" />
                </template>
                下载数据库表设计
              </a-button>
            </template>
          </a-space>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" class="text-right">
          <!-- <a-dropdown>
            <template #overlay>
              <a-menu>
                <a-menu-item key="1" @click="methods.exportExcel">导出 Excel</a-menu-item>
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
          <vxe-column type="seq" width="60"></vxe-column>
          <vxe-column type="checkbox" width="60"></vxe-column>
          <vxe-column field="tableName" title="表名称"> </vxe-column>
          <vxe-column field="displayName" title="显示名称" :edit-render="{}">
            <template #default="{ row }">{{ row.displayName }}</template>
            <template #edit="{ row }">
              <a-input v-model:value="row.displayName" placeholder="显示名称" />
            </template>
          </vxe-column>
          <vxe-column field="entityName" title="实体名称" :edit-render="{}">
            <template #default="{ row }">{{ row.entityName }}</template>
            <template #edit="{ row }">
              <a-input v-model:value="row.entityName" placeholder="实体名称" />
            </template>
          </vxe-column>
          <vxe-column field="remark" title="备注" :edit-render="{}">
            <template #default="{ row }">{{ row.remark }}</template>
            <template #edit="{ row }">
              <a-input v-model:value="row.remark" placeholder="备注" />
            </template>
          </vxe-column>
          <vxe-column field="lastModificationTime" title="更新时间" width="120px"></vxe-column>
          <vxe-column field="creationTime" title="创建时间" width="120px"></vxe-column>
          <vxe-column field="id" title="操作" width="120px">
            <template #default="{ row }">
              <a href="javascript:void(0)" @click="methods.loadColumnIndex(row)"> 配置 </a>
              <a-divider type="vertical" />
              <template v-if="power.delete">
                <a-popconfirm title="您确定要删除吗?" @confirm="methods.deleteList(row.id)" okText="确定" cancelText="取消">
                  <a class="text-danger">删除</a>
                </a-popconfirm>
              </template>
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
    </a-card>
    <!-- 配置 -->
    <a-drawer width="90%" :title="'[ ' + state.row.tableName + ' - ' + state.row.displayName + ' ] 配置'" placement="right" :visible="state.visible" @close="state.visible = !state.visible">
      <!--表单弹层-->
      <ColumnIndexVue ref="refColumnIndex" />
    </a-drawer>
  </div>
</template>

<script>
export default { name: "LowCode" };
</script>

<script setup>
import { nextTick, onMounted, reactive, ref } from "vue";
import { useAppStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import tools from "@/scripts/tools";
import service from "@/service/development_tool/low_code/low_code_table_service";
import router from "@/router/index";
import ColumnIndexVue from "./components/ColumnIndex.vue";
import codeGenerationService from "@/service/development_tool/code_generation_service";

const appStore = useAppStore();
const state = reactive({
  table: {
    //检索
    search: {
      state: false,
      vm: {
        tableName: null,
        entityName: null,
        displayName: null,
      },
    },
    loading: false,
    pageSizeOptions: [10, 20, 50, 100, 500, 1000],
    rows: 10,
    page: 1,
    total: 0,
    data: [],
  },
  visible: false,
  //当前选着的行
  row: {},
});

//表单 ref 对象
const refForm = ref(null);
const refTable = ref(null);
const refColumnIndex = ref(null);

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
      searchVm[key] = null;
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
    service.synchronization().then((res) => {
      tools.message("同步成功!", "成功");
      methods.findList();
    });
  },
  //变更数据
  change() {
    console.log(state.table.data);
    service.change(state.table.data).then((res) => {
      tools.message("数据变更成功!", "成功");
      methods.findList();
    });
  },
  //打开 ColumnIndex 组件
  loadColumnIndex(row) {
    state.visible = true;
    state.row = row;
    nextTick(() => {
      refColumnIndex.value.loadData(row);
    });
  },
  //创建数据库设计
  createDataDictionary() {
    codeGenerationService.createDataDictionary();
  },
};

onMounted(() => {
  methods.findList();
});
</script>
