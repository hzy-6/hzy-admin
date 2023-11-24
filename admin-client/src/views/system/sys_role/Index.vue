<script lang="ts" setup>
import {reactive, ref, onMounted} from "vue";
import {FormInstance} from "ant-design-vue";
import {useAuthority} from "@/utils/Authority";
import AppIcon from "@/core/components/AppIcon.vue";
import Info from "./Info.vue";
import Tools from "@/core/utils/Tools";
import PageContainer from "@/core/components/PageContainer.vue";
import TableCurd from "@/core/components/curd/TableCurd.vue";
import SysRoleService from "@/services/system/SysRoleService";
import DataAuthority from "./components/DataAuthority.vue";
import FunctionAuthority from "./components/FunctionAuthority.vue";

defineOptions({name: "system_role"});

const columns: any[] = [
  {
    fieldName: "number",
    title: "编号",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "number"
  },
  {
    fieldName: "name",
    title: "角色名称",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "name"
  },
  {
    fieldName: "deleteLock",
    title: "删除锁定",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "deleteLock"
  },
  {
    fieldName: "permissionType",
    title: "数据权限",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "permissionType"
  },
  {
    fieldName: "remark",
    title: "备注",
    show: true,
    width: "",
    sorter: false,
    dataIndex: "remark"
  },
  {
    fieldName: "lastModificationTime",
    title: "更新时间",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "lastModificationTime"
  },
  {
    fieldName: "creationTime",
    title: "创建时间",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "creationTime"
  },
  {
    fieldName: "id",
    title: "操作",
    show: true,
    width: "",
    sorter: false,
    dataIndex: "id"
  }
];

const state = reactive({
  search: {
    state: false,
    vm: {
      name: undefined,
      loginName: undefined,
    },
    sort: [] as any[],
  },
  loading: false,
  page: 1,
  size: 10,
  total: 100,
  columns: columns,
  data: [] as any,
});

//权限
const power = useAuthority();
//表格
const refTableCurd = ref<InstanceType<typeof TableCurd>>();
//表单操作对象
const refInfo = ref<InstanceType<typeof Info>>();
//检索表单
const refSearchForm = ref<FormInstance>();
//数据权限实例
const refDataAuthority = ref<InstanceType<typeof DataAuthority>>();
//功能权限实例
const refFunctionAuthority = ref<InstanceType<typeof FunctionAuthority>>();

/**
 * 初始化
 */
onMounted(() => {
  findList();
});

/**
 *获取数据
 */
async function findList() {
  try {
    state.loading = true;
    const result = await SysRoleService.findList(state.page, state.size, state.search.vm, state.search.sort);
    state.loading = false;
    if (result.code != 200) return;
    state.page = result.data.page;
    state.size = result.data.size;
    state.total = result.data.total;
    // state.columns = result.data.columns;
    state.data = result.data.dataSource;
  } catch (error) {
    state.loading = false;
  }
}

/**
 * 删除数据
 * @param id
 */
async function deleteList(id?: string) {
  let ids: string[] = [];
  if (id) {
    ids.push(id);
  } else {
    ids = refTableCurd.value?.getSelectedRowKeys() ?? [];
  }

  if (ids.length == 0) return Tools.message.error("请选择要删除的行!");

  try {
    state.loading = true;
    const result = await SysRoleService.deleteList(ids);
    state.loading = false;
    if (result.code != 200) return;
    Tools.message.success("删除成功!");
    findList();
  } catch (error) {
    state.loading = false;
  }
}

/**
 * 导出excel
 */
function exportExcel() {
  SysRoleService.exportExcel(state.search.vm, state.search.sort);
}
</script>

<template>
  <PageContainer>
    <TableCurd
        ref="refTableCurd"
        v-model:config="state"
        @change="
        (changeTable) => {
          state.page = changeTable.pagination.current ?? 1;
          state.size = changeTable.pagination.pageSize ?? state.size;
          state.search.sort = changeTable.sorter instanceof Array ? [...changeTable.sorter] : [changeTable.sorter];
          findList();
        }
      "
        @show-size-change="
        ({ current, size }) => {
          state.page = current == 0 ? 1 : current;
          state.size = size;
          findList();
        }
      "
    >
      <!-- search -->
      <template #search>
        <a-form ref="refSearchForm" :model="state.search.vm" v-if="power.search">
          <a-row :gutter="[16, 0]">
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="name" label="真实姓名">
                <a-input v-model:value="state.search.vm.name" placeholder="真实名称"/>
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="loginName" label="账户名称">
                <a-input v-model:value="state.search.vm.loginName" placeholder="账户名称"/>
              </a-form-item>
            </a-col>
            <!--button-->
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6" class="text-right">
              <a-space :size="8">
                <a-button
                    @click="
                    state.page = 1;
                    refSearchForm?.resetFields();
                    findList();
                  "
                >
                  重置
                </a-button>
                <a-button
                    type="primary"
                    @click="
                    state.page = 1;
                    findList();
                  "
                >
                  查询
                </a-button>
              </a-space>
            </a-col>
          </a-row>
        </a-form>
      </template>
      <!-- toolbar-left -->
      <template #toolbar-left>
        <a-button @click="state.search.state = !state.search.state" v-if="power.search">
          <div v-if="state.search.state">
            <AppIcon name="UpOutlined"/>&nbsp;&nbsp;收起
          </div>
          <div v-else>
            <AppIcon name="DownOutlined"/>&nbsp;&nbsp;展开
          </div>
        </a-button>
        <a-button type="primary" @click="() => refInfo?.open()" v-if="power.insert">
          <template #icon>
            <AppIcon name="PlusOutlined"/>
          </template>
          新建
        </a-button>
        <a-popconfirm title="您确定要删除?" @confirm="deleteList()" okText="确定" cancelText="取消" v-if="power.delete">
          <a-button type="primary" danger>
            <template #icon>
              <AppIcon name="DeleteOutlined"/>
            </template>
            批量删除
          </a-button>
        </a-popconfirm>
      </template>
      <!-- toolbar-right -->
      <template #toolbar-right>
        <a-dropdown>
          <template #overlay>
            <a-menu>
              <a-menu-item key="1" @click="exportExcel()">导出 Excel</a-menu-item>
            </a-menu>
          </template>
          <a-button> 更多
            <AppIcon name="ellipsis-outlined"/>
          </a-button>
        </a-dropdown>
      </template>

      <!--列插槽-->
      <template #permissionType="item">
        <a-table-column v-bind="item">
          <template #default="{ record }">
            <a-tag color="success" v-if="record.permissionType == 1">自定义权限</a-tag>
            <a-tag color="success" v-if="record.permissionType == 2">查看所有数据</a-tag>
            <a-tag color="success" v-if="record.permissionType == 3">仅查看本组织</a-tag>
            <a-tag color="success" v-if="record.permissionType == 4">仅查看本组织和下属组织</a-tag>
            <a-tag color="success" v-if="record.permissionType == 5">仅查看本人</a-tag>
          </template>
        </a-table-column>
      </template>
      <template #deleteLock="item">
        <a-table-column v-bind="item">
          <template #default="{ record }">
            <a-tag color="success" v-if="record.deleteLock">锁定</a-tag>
            <a-tag color="warning" v-else>不锁定</a-tag>
          </template>
        </a-table-column>
      </template>
      <template #id="item">
        <!-- 操作 -->
        <a-table-column v-bind="item">
          <template #default="{ record }">
            <a href="javascript:;" @click="() => refInfo?.open(record.id)" v-if="power.update">编辑</a>
            <a-divider type="vertical"/>
            <a-popconfirm title="您确定要删除?" @confirm="deleteList(record.id)" okText="确定" cancelText="取消"
                          v-if="power.delete">
              <a class="text-danger">删除</a>
            </a-popconfirm>
            <a-divider type="vertical"/>
            <a href="javascript:;" @click="() => refFunctionAuthority?.open(record.id)">功能权限</a>
            <a-divider type="vertical"/>
            <a href="javascript:;" @click="() => refDataAuthority?.open(record.id)">数据权限</a>
          </template>
        </a-table-column>
      </template>

    </TableCurd>
    <!-- Info -->
    <Info ref="refInfo" :onSuccess="() => findList()"/>
    <!-- DataAuthority -->
    <DataAuthority ref="refDataAuthority" :onSuccess="() => findList()"/>
    <!-- FunctionAuthority -->
    <FunctionAuthority ref="refFunctionAuthority" :onSuccess="() => findList()"/>
  </PageContainer>
</template>
