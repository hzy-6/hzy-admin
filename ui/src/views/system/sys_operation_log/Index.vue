<template>
  <div>
    <a-card class="mb-15" v-show="table.search.state">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="table.search.vm.api" placeholder="接口地址" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="table.search.vm.browser" placeholder="浏览器" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="table.search.vm.ip" placeholder="ip地址" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="table.search.vm.os" placeholder="操作系统" />
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
          <a-space :size="15">
            <!-- 检索 -->
            <template v-if="power.search">
              <a-button @click="table.search.state = !table.search.state">
                <template #icon>
                  <AppIcon :name="table.search.state ? 'UpOutlined' : 'DownOutlined'" />
                </template>
                检索
              </a-button>
            </template>
            <!-- 清空所有数据 -->
            <template v-if="power.delete">
              <a-popconfirm title="您确定要删除吗?" @confirm="deleteList()" okText="确定" cancelText="取消">
                <a-button type="danger">
                  <template #icon>
                    <AppIcon name="DeleteOutlined" />
                  </template>
                  清空所有数据
                </a-button>
              </a-popconfirm>
            </template>
          </a-space>
        </a-col>
      </a-row>

      <!-- 表格 -->
      <a-spin :spinning="table.loading">
        <!-- max-height="650" -->
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
          <!-- <vxe-column type="checkbox" width="60"></vxe-column> -->
          <vxe-column field="api" title="接口地址" show-overflow min-width="300"></vxe-column>
          <vxe-column field="browser" title="浏览器" width="120"></vxe-column>
          <vxe-column field="ip" title="ip地址" width="120"></vxe-column>
          <vxe-column field="os" title="操作系统" width="120"></vxe-column>
          <vxe-column field="takeUpTime" title="接口耗时" width="100">
            <template #default="{ row }">
              <a-tag v-if="row.takeUpTime >= 1000" color="orange">{{ row.takeUpTime }}(毫秒)</a-tag>
              <a-tag v-else-if="row.takeUpTime >= 2000" color="red">{{ row.takeUpTime }}(毫秒)</a-tag>
              <a-tag v-else color="#87d068">{{ row.takeUpTime }}(毫秒)</a-tag>
            </template>
          </vxe-column>
          <vxe-column field="userName" title="操作人姓名" width="120"></vxe-column>
          <vxe-column field="loginName" title="操作人账号" width="120"></vxe-column>
          <vxe-column field="creationTime" title="创建时间" width="180"></vxe-column>
          <vxe-column field="id" title="操作" width="100">
            <template #default="{ row }">
              <a href="javascript:void(0)" @click="openForm(row.id)">详情</a>
            </template>
          </vxe-column>
        </vxe-table>
        <vxe-pager
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
import service from "@/service/system/sys_operation_log_serivce";
import router from "@/router/index";

export default defineComponent({
  name: "sys_operation_log",
  components: { AppIcon, Info },
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
        pageSizeOptions: [10, 20, 50, 100, 500, 1000],
        rows: 10,
        page: 1,
        total: 0,
        data: [],
      },
      form: {
        visible: false,
        key: "",
      },
    });
    //表单 ref 对象
    const refForm = ref(null);
    const refTable = ref(null);

    //权限
    const power = appStore.getPowerByMenuId(router.currentRoute.value.meta.menuId);

    //事件 函数
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
      deleteList() {
        service.deleteAllData().then((res) => {
          if (res.code != 1) return;
          tools.message("删除成功!", "成功");
          methods.findList();
        });
      },
      //打开表单页面
      openForm(id) {
        refForm.value.openForm({ visible: true, key: id });
      },
      exportExcel() {
        service.exportExcel(state.table.search.vm);
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
    };
  },
});
</script>
