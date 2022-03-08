<template>
  <div class="p-24">
    <a-row :gutter="[24, 24]">
      <a-col :xs="24" :sm="12" :md="12" :lg="5" :xl="5">
        <a-card title="数据字典树" class="w100 mb-24">
          <template #extra><a href="javascript:void(0)" @click="getFirst">查看一级</a></template>
          <a-spin :spinning="tree.loadingTree">
            <a-tree v-model:selectedKeys="tree.selectedKeys" :tree-data="tree.data" />
          </a-spin>
        </a-card>
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="19" :xl="19">
        <a-card class="mb-24" v-show="table.search.state">
          <a-row :gutter="[24, 24]">
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
            <vxe-table class="mt-24" ref="refTable" size="medium" border stripe :data="table.data" :row-config="{ isHover: true }" :column-config="{resizable: true}">
              <vxe-column type="checkbox" width="60"></vxe-column>
              <vxe-column field="sort" title="序号"></vxe-column>
              <vxe-column field="code" title="编号"></vxe-column>
              <vxe-column field="name" title="分组名称/键"></vxe-column>
              <vxe-column field="value" title="值"></vxe-column>
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
              class="mt-24"
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
        <Info ref="refForm" @onSuccess="() => onSaveSuccess()" />
      </a-col>
    </a-row>
  </div>
</template>
<script>
import { defineComponent, onMounted, reactive, toRefs, ref, watch } from "vue";
import useAppStore from "@/store/index";
import AppIcons from "@/components/AppIcons.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";
import service from "@/service/system/dictionary_service";
import router from "@/router/index";

export default defineComponent({
  name: "system_dictionary",
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
            parentId: null,
          },
        },
        loading: false,
        pageSizeOptions: [10, 20, 50, 100, 500, 1000],
        rows: 10,
        page: 1,
        total: 0,
        data: [],
      },
      tree: {
        data: [],
        expandedKeys: [],
        autoExpandParent: true,
        checkedKeys: [],
        selectedKeys: [],
        loadingTree: false,
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
          if (key == "parentId") continue;
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
          methods.getDictionaryTree();
          methods.findList();
        });
      },
      //打开表单页面
      openForm(id) {
        refForm.value.openForm({
          visible: true,
          key: id,
          parentId: state.table.search.vm.parentId,
        });
      },
      //表单保存成功
      onSaveSuccess() {
        methods.getDictionaryTree();
        methods.findList();
      },
      //获取菜单树
      getDictionaryTree() {
        state.tree.loadingTree = true;
        service.getDictionaryTree().then((res) => {
          state.tree.loadingTree = false;
          if (res.code != 1) return;
          let data = res.data;
          state.tree.data = data;
          // state.tree.expandedKeys = data.defaultExpandedKeys;
          // state.tree.checkedKeys = data.defaultCheckedKeys;
        });
      },
      //获取一级菜单
      getFirst() {
        state.tree.selectedKeys = [];
      },
    };

    watch(
      () => state.tree.selectedKeys,
      (value) => {
        state.table.search.vm.parentId = value.length > 0 ? value[0] : null;
        methods.findList();
      }
    );

    onMounted(() => {
      methods.getDictionaryTree();
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
