<template>
  <div class="p-24">
    <a-card class="w100 mb-24" bodyStyle="padding:0" v-show="table.search.state">
      <a-row :gutter="[24, 24]" class="p-24">
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="table.search.vm.name" placeholder="名称" />
        </a-col>
        <!--button-->
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" style="float: right">
          <a-button type="primary" class="mr-24" @click="findList">查询</a-button>
          <a-button class="mr-24" @click="onResetSearch">重置</a-button>
        </a-col>
      </a-row>
    </a-card>

    <a-card>
      <a-row :gutter="[24, 24]">
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
          <template v-if="power.search">
            <a-button class="mr-24" @click="table.search.state = !table.search.state">
              <div v-if="table.search.state"><AppIcons name="UpOutlined" />&nbsp;&nbsp;收起</div>
              <div v-else><AppIcons name="DownOutlined" />&nbsp;&nbsp;展开</div>
            </a-button>
          </template>
          <template v-if="power.insert">
            <a-button type="primary" class="mr-24" @click="openForm()">
              <template #icon>
                <AppIcons name="PlusOutlined" />
              </template>
              新建
            </a-button>
          </template>
          <template v-if="power.delete">
            <a-popconfirm title="您确定要删除吗?" @confirm="deleteList()" okText="确定" cancelText="取消">
              <a-button type="danger" class="mr-24">
                <template #icon>
                  <AppIcons name="DeleteOutlined" />
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
              <AppIcons name="DownOutlined" />
            </a-button>
          </a-dropdown> -->
        </a-col>
      </a-row>

      <!-- 表格 -->
      <a-spin :spinning="table.loading">
        <vxe-table
          class="mt-24"
          ref="refTable"
          size="medium"
          border
          stripe
          :data="table.data"
          :row-config="{ isCurrent: true, isHover: true }"
          :column-config="{ isCurrent: true, resizable: true }"
          :checkbox-config="{ highlight: true }"
          :tree-config="{ transform: true, rowField: 'id', parentField: 'parentId' }"
          @toggle-tree-expand="onToggleTreeExpand"
        >
          <vxe-column type="checkbox" width="40"></vxe-column>
          <vxe-column field="name" title="名称" show-overflow tree-node width="200"></vxe-column>
          <vxe-column field="icon" title="图标" width="60">
            <template #default="{ row }">
              <AppIcons :name="row.icon" />
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
                <a href="javascript:void(0)" @click="openForm(null, row.id)">新建</a>
                <a-divider type="vertical" />
              </template>
              <template v-if="power.update">
                <a href="javascript:void(0)" @click="openForm(row.id, row.parentId)">编辑</a>
                <a-divider type="vertical" />
              </template>
              <template v-if="power.delete">
                <a-popconfirm title="您确定要删除吗?" @confirm="deleteList(row.id)" okText="确定" cancelText="取消">
                  <a class="text-danger">删除</a>
                </a-popconfirm>
              </template>
            </template>
          </vxe-column>
        </vxe-table>
      </a-spin>
    </a-card>
    <!--表单弹层-->
    <Info ref="refForm" @onSuccess="() => findList()" />
  </div>
</template>
<script>
import { defineComponent, onMounted, reactive, toRefs, ref, nextTick } from "vue";
import useAppStore from "@/store/index";
import AppIcons from "@/components/AppIcons.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";
import service from "@/service/system/menuService";
import router from "@/router/index";
import dayjs from "dayjs";

export default defineComponent({
  name: "system_menu",
  components: { AppIcons, Info },
  setup() {
    const appStore = useAppStore();
    const state = reactive({
      table: {
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
        service.getAll(state.table.search.vm).then((res) => {
          let data = res.data;
          state.table.loading = false;
          state.table.data = data;
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
        state.table.expandRows = refTable.value.getTreeExpandRecords();
      },
      //保存完成刷新表格数据后,恢复展开行
      recoveryOpenRows() {
        var rows = state.table.expandRows;
        if (rows.length > 0) {
          refTable.value.setTreeExpand(state.table.data[1], true);
          rows.forEach((element) => {
            refTable.value.setTreeExpand(
              state.table.data.filter((w) => w.id == element.id),
              true
            );
          });
        }
      },
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
      dayjs,
    };
  },
});
</script>
