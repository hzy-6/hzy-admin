<script lang="ts" setup>
import { reactive, ref, onMounted, watch, watchEffect } from "vue";
import { FormInstance } from "ant-design-vue";
import AppIcon from "@/core/components/AppIcon.vue";
import Tools from "@/core/utils/Tools";
import TableCurd from "@/core/components/curd/TableCurd.vue";
import LowCodeTableInfoService from "@/services/development_tool/low_code/LowCodeTableInfoService";

//定义组件事件
const props = defineProps<{ rowData: any }>();

const state = reactive({
  search: {
    state: false,
    vm: {
      Low_Code_TableId: null,
      columnName: null,
      describe: null,
    },
  },
  loading: false,
  page: 1,
  size: 100,
  total: 100,
  columns: [] as any,
  data: [] as any,
});

//表格
const refTableCurd = ref<InstanceType<typeof TableCurd>>();
//检索表单
const refSearchForm = ref<FormInstance>();

watchEffect(() => {
  if (props.rowData) {
    findList();
  }
}, props.rowData);

/**
 *获取数据
 */
async function findList() {
  state.loading = true;
  state.search.vm.Low_Code_TableId = props.rowData.id;
  const result = await LowCodeTableInfoService.findList(state.page, state.size, state.search.vm);
  state.loading = false;
  if (result.code != 1) return;
  state.page = result.data.page;
  state.size = result.data.size;
  state.total = result.data.total;
  state.columns = result.data.columns;
  state.data = result.data.dataSource;
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

  state.loading = true;
  const result = await LowCodeTableInfoService.deleteList(ids);
  state.loading = false;
  if (result.code != 1) return;
  Tools.message.success("删除成功!");
  findList();
}

/**
 * 同步表
 */
function synchronization() {
  LowCodeTableInfoService.synchronization().then((res) => {
    Tools.message.success("同步成功!");
    findList();
  });
}

/**
 * 数据变更
 */
function change() {
  LowCodeTableInfoService.change(state.data).then((res) => {
    Tools.message.success("数据变更成功!");
    findList();
  });
}
</script>

<template>
  <TableCurd
    ref="refTableCurd"
    :config="state"
    @change="
      ({ page, pageSize }) => {
        state.page = page == 0 ? 1 : page;
        state.size = pageSize;
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
      <a-form ref="refSearchForm" :model="state.search.vm">
        <a-row :gutter="[16, 0]">
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
            <a-form-item class="mb-0" name="columnName" label="列名称">
              <a-input v-model:value="state.search.vm.columnName" placeholder="列名称" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
            <a-form-item class="mb-0" name="describe" label="显示名称">
              <a-input v-model:value="state.search.vm.describe" placeholder="显示名称" />
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
      <a-button @click="state.search.state = !state.search.state">
        <div v-if="state.search.state"><AppIcon name="UpOutlined" />&nbsp;&nbsp;收起</div>
        <div v-else><AppIcon name="DownOutlined" />&nbsp;&nbsp;展开</div>
      </a-button>

      <!-- 同步字段 -->
      <a-popconfirm title="您确定要更新表吗?可能会导致数据丢失" @confirm="synchronization()" okText="确定" cancelText="取消">
        <a-button type="primary">
          <template #icon>
            <AppIcon name="ReloadOutlined" />
          </template>
          同步字段
        </a-button>
      </a-popconfirm>

      <!-- 提交更改 -->
      <a-popconfirm title="您确定要提交更改?" @confirm="change()" okText="确定" cancelText="取消">
        <a-button type="primary">
          <template #icon>
            <AppIcon name="PlusOutlined" />
          </template>
          提交更改
        </a-button>
      </a-popconfirm>

      <!-- 批量删除 -->
      <a-popconfirm title="您确定要删除?" @confirm="deleteList()" okText="确定" cancelText="取消">
        <a-button type="primary" danger>
          <template #icon>
            <AppIcon name="DeleteOutlined" />
          </template>
          批量删除
        </a-button>
      </a-popconfirm>
    </template>
    <!-- toolbar-right -->
    <template #toolbar-right>
      <!-- <a-dropdown>
          <template #overlay>
            <a-menu>
              <a-menu-item key="1" @click="exportExcel()">导出 Excel</a-menu-item>
            </a-menu>
          </template>
          <a-button> 更多 <AppIcon name="ellipsis-outlined" /> </a-button>
        </a-dropdown> -->
      <!-- 列设置 -->
      <a-popover>
        <template #content>
          <div v-for="item in state.columns.filter((w:any) => w.fieldName.substr(0, 1) != '_')">
            <a-checkbox v-model:checked="item.show">{{ item.title }}</a-checkbox>
          </div>
        </template>
        <a-button type="text">
          <template #icon><AppIcon name="setting-outlined" /> </template>
        </a-button>
      </a-popover>
    </template>
    <!-- table-col -->
    <template #table-col>
      <a-table-column title="列名称" data-index="columnName" />
      <a-table-column title="数据库类型" data-index="databaseColumnType" />
      <a-table-column title="C#字段名称" data-index="csField" />
      <a-table-column title="C#数据类型" data-index="csType" />
      <a-table-column title="是否主键" data-index="isPrimary">
        <template #default="{ record }">
          <a-tag color="success" v-if="record.isPrimary">是</a-tag>
          <a-tag color="default" v-else>否</a-tag>
        </template>
      </a-table-column>
      <a-table-column title="是否自增" data-index="isIdentity">
        <template #default="{ record }">
          <a-tag color="success" v-if="record.isIdentity">是</a-tag>
          <a-tag color="default" v-else>否</a-tag>
        </template>
      </a-table-column>
      <a-table-column title="显示名称" data-index="displayName">
        <template #default="{ record }">
          <a-input v-model:value="record.displayName" />
        </template>
      </a-table-column>
      <a-table-column title="列描述" data-index="describe">
        <template #default="{ record }">
          <a-input v-model:value="record.describe" />
        </template>
      </a-table-column>
      <a-table-column title="更新时间" data-index="lastModificationTime" width="120px" />
      <a-table-column title="创建时间" data-index="creationTime" width="120px" />
      <!-- 操作 -->
      <a-table-column title="操作" data-index="id">
        <template #default="{ record }">
          <a-popconfirm title="您确定要删除?" @confirm="deleteList(record.id)" okText="确定" cancelText="取消">
            <a class="text-danger">删除</a>
          </a-popconfirm>
        </template>
      </a-table-column>
    </template>
  </TableCurd>
</template>
