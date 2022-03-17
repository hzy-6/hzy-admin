<template>
  <div>
    <a-card class="mb-15" v-show="table.search.state">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="table.search.vm.name" placeholder="名称" />
        </a-col>
        <!--button-->
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" style="float: right">
          <a-button type="primary" class="mr-15" @click="findList">查询</a-button>
          <a-button class="mr-15" @click="onResetSearch">重置</a-button>
        </a-col>
      </a-row>
    </a-card>

    <a-card>
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
          <template v-if="power.search">
            <a-button class="mr-15" @click="table.search.state = !table.search.state">
              <div v-if="table.search.state"><AppIcon name="UpOutlined" />&nbsp;&nbsp;收起</div>
              <div v-else><AppIcon name="DownOutlined" />&nbsp;&nbsp;展开</div>
            </a-button>
          </template>
          <template v-if="power.insert">
            <a-button type="primary" class="mr-15" @click="openForm()">
              <template #icon>
                <AppIcon name="PlusOutlined" />
              </template>
              新建
            </a-button>
          </template>
          <template v-if="power.delete">
            <a-popconfirm title="您确定要删除吗?" @confirm="deleteList()" okText="确定" cancelText="取消">
              <a-button type="danger" class="mr-15">
                <template #icon>
                  <AppIcon name="DeleteOutlined" />
                </template>
                批量删除
              </a-button>
            </a-popconfirm>
          </template>
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
      <a-spin :spinning="table.loading">
        <vxe-table
          class="mt-15"
          ref="refTable"
          size="medium"
          border
          stripe
          :data="table.data"
          :row-config="{ isCurrent: true, isHover: true }"
          :column-config="{ isCurrent: true, resizable: true }"
          :checkbox-config="{ highlight: true }"
        >
          <vxe-column type="checkbox" width="60"></vxe-column>
          <vxe-column field="number" title="编号"></vxe-column>
          <vxe-column field="name" title="名称"></vxe-column>
          <vxe-column field="byName" title="英文名称"></vxe-column>
          <vxe-column field="lastModificationTime" title="更新时间"></vxe-column>
          <vxe-column field="creationTime" title="创建时间"></vxe-column>
          <vxe-column field="id" title="操作">
            <template #default="{ row }">
              <template v-if="power.update">
                <a href="javascript:void(0)" @click="openForm(row.id)">编辑</a>
              </template>
              <a-divider type="vertical" />
              <template v-if="power.delete">
                <a-popconfirm title="您确定要删除吗?" @confirm="deleteList(row.id)" okText="确定" cancelText="取消">
                  <a class="text-danger">删除</a>
                </a-popconfirm>
              </template>
            </template>
          </vxe-column>
        </vxe-table>
        <vxe-pager
          class="mt-15"
          background
          v-model:current-page="table.page"
          v-model:page-size="table.rows"
          :total="table.total"
          :page-sizes="table.pageSizeOptions"
          :layouts="['PrevJump', 'PrevPage', 'JumpNumber', 'NextPage', 'NextJump', 'Sizes', 'FullJump', 'Total']"
          @page-change="onChange"
        >
        </vxe-pager>
      </a-spin>
    </a-card>
    <!--表单弹层-->
    <Info ref="refForm" @onSuccess="() => findList()" />
  </div>
</template>
<script>
import { defineComponent, onMounted, reactive, toRefs, ref } from "vue";
import { useAppStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";
import service from "@/service/system/functionService";
import router from "@/router/index";

export default defineComponent({
  name: "system_function",
  components: { AppIcon, Info },
  setup() {
    const appStore = useAppStore();
    const state = reactive({
      table: {
        //检索
        search: {
          state: false,
          vm: {
            name: null,
          },
        },
        loading: false,
        pageSizeOptions: [10, 20, 50, 100, 500, 1000],
        rows: 10,
        page: 1,
        total: 0,
        data: [],
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
      // exportExcel() {
      //   service.exportExcel(state.table.search.vm);
      // },
    };

    onMounted(() => {
      methods.findList();
    });

    return {
      ...toRefs(state),
      ...methods,
      power,
      refForm,
      refTable,
    };
  },
});
</script>
