<script lang="ts" setup>
import { reactive, ref, onMounted, computed, watch } from "vue";
import { FormInstance } from "ant-design-vue";
import { useAuthority } from "@/utils/Authority";
import AppIcon from "@/core/components/AppIcon.vue";
import Info from "./Info.vue";
import Tools from "@/core/utils/Tools";
import PageContainer from "@/core/components/PageContainer.vue";
import TableCurd from "@/core/components/curd/TableCurd.vue";
import SysUserService from "@/services/system/SysUserService";
import SysOrganizationService from "@/services/system/SysOrganizationService";

defineOptions({ name: "system_user" });

//定义组件事件
const emits = defineEmits<{
  (e: "findBackChange", rows: any[]): void;
}>();
//定义组件属性
const props = withDefaults(
  defineProps<{
    //查找带回
    isFindBack: boolean;
    /**
     * 默认选中行ids
     */
    defaultRowIds: string[];
    /**
     * 类型 带回 多条(false)还是单条(true)
     */
    type: boolean;
  }>(),
  {
    isFindBack: false,
    type: true,
  }
);

const columns: any[] = [
  {
    fieldName: "name",
    title: "用户名称",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "name",
  },
  {
    fieldName: "loginName",
    title: "登录名称",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "loginName",
  },
  {
    fieldName: "所属角色",
    title: "所属角色",
    show: true,
    width: "",
    sorter: false,
    dataIndex: "所属角色",
  },
  {
    fieldName: "organizationName",
    title: "所属组织",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "organizationName",
  },
  {
    fieldName: "phone",
    title: "联系电话",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "phone",
  },
  {
    fieldName: "_Email",
    title: "邮件地址",
    show: false,
    width: "",
    sorter: true,
    dataIndex: "_Email",
  },
  {
    fieldName: "lastModificationTime",
    title: "更新时间",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "lastModificationTime",
  },
  {
    fieldName: "creationTime",
    title: "创建时间",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "creationTime",
  },
  {
    fieldName: "id",
    title: "操作",
    show: true,
    width: "",
    sorter: true,
    dataIndex: "id",
  },
];

const state = reactive({
  search: {
    state: false,
    vm: {
      name: undefined,
      loginName: undefined,
      organizationId: undefined,
    },
    sort: [] as any[],
  },
  loading: false,
  page: 1,
  size: 10,
  total: 100,
  columns: columns,
  data: [] as any[],
});

//权限
const power = useAuthority();
//表格
const refTableCurd = ref<InstanceType<typeof TableCurd>>();
//表单操作对象
const refInfo = ref<InstanceType<typeof Info>>();
//检索表单
const refSearchForm = ref<FormInstance>();
//组织树
const organizationTree = ref<any[]>();
//查找带回
const findBack = ref({
  defaultRowIds: computed(() => props.defaultRowIds),
});

/**
 * 初始化
 */
onMounted(() => {
  findList();
  SysOrganizationService.sysOrganizationTree().then((res) => {
    organizationTree.value = res.data.rows;
  });
});

/**
 *获取数据
 */
async function findList() {
  try {
    state.loading = true;
    const result = await SysUserService.findList(state.page, state.size, state.search.vm, state.search.sort);
    state.loading = false;
    if (result.code != 200) return;
    state.page = result.data.page;
    state.size = result.data.size;
    state.total = result.data.total;
    // state.columns = result.data.columns;
    state.data = result.data.dataSource;
    //查找带回初始化选中操作
    findBackMethods.setCheckboxRow();
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
    const result = await SysUserService.deleteList(ids);
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
  SysUserService.exportExcel(state.search.vm, state.search.sort);
}

/**
 * 查找带回处理
 */
const findBackMethods = {
  initRows() {
    if (!props.isFindBack) return;
    watch(
      () => props.defaultRowIds,
      (value) => {
        findBackMethods.setCheckboxRow();
      }
    );
  },
  //设置默认选中项
  setCheckboxRow() {
    if (!props.isFindBack) return;
    refTableCurd.value?.clearSelectedRowKeys();
    refTableCurd.value?.setSelectedRowKeys(findBack.value.defaultRowIds);
  },
  //查找带回事件
  onChange() {
    if (!props.isFindBack) return;
    var rows = refTableCurd.value?.getSelectedRowKeys() ?? [];
    if (rows && rows.length == 0) {
      return Tools.message.warning("请选择一条数据!");
    }
    if (props.type && rows.length > 1) {
      return Tools.message.warning("只能选择一条数据!");
    }
    emits("findBackChange", findBackMethods.getRowsByIds(rows));
  },
  /**
   * 根据 ids 获取行数据
   * @param ids
   */
  getRowsByIds(ids: string[]) {
    var rows = [];
    var data = state.data;
    for (let index = 0; index < data.length; index++) {
      const element = data[index];
      if (ids.filter((w) => w == element.id).length > 0) {
        rows.push(element);
      }
    }
    return rows;
  },
};

//初始化查找带回行数据
findBackMethods.initRows();
</script>

<template>
  <PageContainer :show="!$props.isFindBack">
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
                <a-input v-model:value="state.search.vm.name" placeholder="真实名称" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="loginName" label="账户名称">
                <a-input v-model:value="state.search.vm.loginName" placeholder="账户名称" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="organizationId" label="所属组织">
                <a-tree-select
                  v-model:value="state.search.vm.organizationId"
                  :dropdown-style="{ maxHeight: '400px', overflow: 'auto' }"
                  placeholder="所属组织"
                  allow-clear
                  tree-default-expand-all
                  show-search
                  tree-node-filter-prop="name"
                  :tree-data="organizationTree"
                  :field-names="{
                    children: 'children',
                    label: 'name',
                    value: 'id',
                  }"
                  class="w100"
                ></a-tree-select>
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
          <div v-if="state.search.state"><AppIcon name="UpOutlined" />&nbsp;&nbsp;收起</div>
          <div v-else><AppIcon name="DownOutlined" />&nbsp;&nbsp;展开</div>
        </a-button>
        <a-button type="primary" @click="() => refInfo?.open()" v-if="power.insert">
          <template #icon>
            <AppIcon name="PlusOutlined" />
          </template>
          新建
        </a-button>
        <a-popconfirm title="您确定要删除?" @confirm="deleteList()" okText="确定" cancelText="取消" v-if="power.delete">
          <a-button type="primary" danger>
            <template #icon>
              <AppIcon name="DeleteOutlined" />
            </template>
            批量删除
          </a-button>
        </a-popconfirm>
        <!-- 查找带回按钮 -->
        <template v-if="$props.isFindBack">
          <a-button type="primary" @click="findBackMethods.onChange()">
            <template #icon>
              <AppIcon name="CheckOutlined" />
            </template>
            带回数据
          </a-button>
        </template>
      </template>
      <!-- toolbar-right -->
      <template #toolbar-right>
        <a-dropdown>
          <template #overlay>
            <a-menu>
              <a-menu-item key="1" @click="exportExcel()">导出 Excel</a-menu-item>
            </a-menu>
          </template>
          <a-button>
            更多
            <AppIcon name="ellipsis-outlined" />
          </a-button>
        </a-dropdown>
      </template>

      <!--列插槽-->
      <template #id="item">
        <!-- 操作 -->
        <a-table-column v-bind="item" v-if="power.update || power.delete">
          <template #default="{ record }">
            <a href="javascript:;" @click="() => refInfo?.open(record.id)" v-if="power.update">编辑</a>
            <a-divider type="vertical" />
            <a-popconfirm title="您确定要删除?" @confirm="deleteList(record.id)" okText="确定" cancelText="取消" v-if="power.delete">
              <a class="text-danger">删除</a>
            </a-popconfirm>
          </template>
        </a-table-column>
      </template>
    </TableCurd>
    <!-- Info -->
    <Info ref="refInfo" :onSuccess="() => findList()" />
  </PageContainer>
</template>
