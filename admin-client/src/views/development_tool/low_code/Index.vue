<script lang="ts" setup>
import { reactive, ref, onMounted } from "vue";
import { FormInstance } from "ant-design-vue";
import AppIcon from "@/core/components/AppIcon.vue";
import Info from "./Info.vue";
import Tools from "@/core/utils/Tools";
import PageContainer from "@/core/components/PageContainer.vue";
import TableCurd from "@/core/components/curd/TableCurd.vue";
import LowCodeTableService from "@/services/development_tool/low_code/LowCodeTableService";
import CodeGenerationService from "@/services/development_tool/low_code/CodeGenerationService";
import TableEditor from "@/views/development_tool/low_code/db_editor/TableEditor.vue";

defineOptions({ name: "LowCode" });

const state = reactive({
  search: {
    state: false,
    vm: {
      tableName: undefined,
      entityName: undefined,
      displayName: undefined,
    },
    sort: [] as any[],
  },
  loading: false,
  page: 1,
  size: 10,
  total: 100,
  columns: [] as any,
  data: [] as any,
});

//表格
const refTableCurd = ref<InstanceType<typeof TableCurd>>();
//表单操作对象
const refInfo = ref<InstanceType<typeof Info>>();
//检索表单
const refSearchForm = ref<FormInstance>();
// 表编辑器
const refTableEditor = ref<InstanceType<typeof TableEditor>>();

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
  state.loading = true;
  const result = await LowCodeTableService.findList(state.page, state.size, state.search.vm, state.search.sort);
  state.loading = false;
  if (result.code != 200) return;
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
  const result = await LowCodeTableService.deleteList(ids);
  state.loading = false;
  if (result.code != 200) return;
  Tools.message.success("删除成功!");
  findList();
}

/**
 * 同步表
 */
function synchronization() {
  LowCodeTableService.synchronization().then((res) => {
    Tools.message.success("同步成功!");
    findList();
  });
}

/**
 * 数据变更
 */
function change() {
  LowCodeTableService.change(state.data).then((res) => {
    Tools.message.success("数据变更成功!");
    findList();
  });
}

/**
 * 打开表编辑器
 */
function openTableEditor() {
  refTableEditor.value?.open();
}
</script>

<template>
  <PageContainer>
    <template #describe>
      <span class="text-danger">请在数据库中建表。在此界面点击扫描新表，然后在此界面配置表信息后点击提交变更保存数据即可!</span>
    </template>
    <TableCurd
      ref="refTableCurd"
      :config="state"
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
        <a-form ref="refSearchForm" :model="state.search.vm">
          <a-row :gutter="[16, 0]">
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="tableName" label="表名称">
                <a-input v-model:value="state.search.vm.tableName" placeholder="表名称" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="entityName" label="实体名称">
                <a-input v-model:value="state.search.vm.entityName" placeholder="实体名称" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="displayName" label="显示名称">
                <a-input v-model:value="state.search.vm.displayName" placeholder="显示名称" />
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

        <!-- 扫描新表 -->
        <a-popconfirm title="您确定要更新表吗?可能会导致数据丢失" @confirm="synchronization()" okText="确定" cancelText="取消">
          <a-button type="primary">
            <template #icon> <AppIcon name="scan-outlined" /> </template> 扫描新表
          </a-button>
        </a-popconfirm>

        <!-- 提交变更 -->
        <a-popconfirm title="您确定要提交更改?" @confirm="change()" okText="确定" cancelText="取消">
          <a-button type="primary">
            <template #icon> <AppIcon name="check-outlined" /> </template> 提交变更
          </a-button>
        </a-popconfirm>

        <!-- 下载数据库表设计 -->
        <a-button type="primary" @click="() => CodeGenerationService.createDataDictionary()">
          <template #icon> <AppIcon name="cloud-download-outlined" /> </template> 下载数据库表设计
        </a-button>

        <!-- 批量删除 -->
        <a-popconfirm title="您确定要删除?" @confirm="deleteList()" okText="确定" cancelText="取消">
          <a-button type="primary" danger>
            <template #icon>
              <AppIcon name="DeleteOutlined" />
            </template>
            批量删除
          </a-button>
        </a-popconfirm>

        <!-- 在线建表 -->
        <a-button type="primary" @click="openTableEditor">
          <template #icon>
            <AppIcon name="AppstoreAddOutlined" />
          </template>
          在线建表
        </a-button>
      </template>
      <!-- toolbar-right -->
      <template #toolbar-right> </template>
      <!-- table-col -->
      <template #table-col>
        <a-table-column title="表名称" data-index="tableName" />
        <a-table-column title="显示名称" data-index="displayName">
          <template #default="{ record }"> <a-input v-model:value="record.displayName" /></template>
        </a-table-column>
        <a-table-column title="实体名称" data-index="entityName">
          <template #default="{ record }"> <a-input v-model:value="record.entityName" /></template>
        </a-table-column>
        <a-table-column title="备注" data-index="remark">
          <template #default="{ record }"> <a-input v-model:value="record.remark" /></template>
        </a-table-column>
        <a-table-column title="更新时间" data-index="lastModificationTime" width="120px" />
        <a-table-column title="创建时间" data-index="creationTime" width="120px" />
        <!-- 操作 -->
        <a-table-column title="操作" data-index="id">
          <template #default="{ record }">
            <a href="javascript:;" @click="() => refInfo?.open(record)">配置</a>
            <a-divider type="vertical" />
            <a-popconfirm title="您确定要删除?" @confirm="deleteList(record.id)" okText="确定" cancelText="取消">
              <a class="text-danger">删除</a>
            </a-popconfirm>
          </template>
        </a-table-column>
      </template>
    </TableCurd>
    <!-- Info -->
    <Info ref="refInfo" :onSuccess="() => findList()" />
    <!-- 表编辑器 -->
    <TableEditor ref="refTableEditor" />
  </PageContainer>
</template>
