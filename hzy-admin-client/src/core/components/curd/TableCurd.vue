<!-- 脚本 -->
<script lang="ts" setup>
import { Table, TablePaginationConfig } from "ant-design-vue";
import { FilterValue, SorterResult, TableCurrentDataSource, TableRowSelection } from "ant-design-vue/es/table/interface";
import { SizeType } from "ant-design-vue/lib/config-provider";
import { ref, computed, unref } from "vue";
import AppIcon from "@/core/components/AppIcon.vue";

interface ITableConfig {
  search: any;
  loading: boolean;
  page: number;
  size: number;
  total: number;
  data: any[];
}

//定义 props
const props = withDefaults(
  defineProps<{
    config: ITableConfig;
    /**
     * 是否展示分页
     */
    isPagination?: boolean;
    /**
     * 展开行keys
     */
    expandedRowKeys?: string[];
  }>(),
  {
    isPagination: true,
  }
);

//定义事件
const emits = defineEmits<{
  (
    e: "change",
    {
      pagination,
      filters,
      sorter,
      extra,
    }: {
      pagination: TablePaginationConfig;
      filters: Record<string, FilterValue | null>;
      sorter: SorterResult<any> | SorterResult<any>[];
      extra: TableCurrentDataSource<any>;
    }
  ): void;
  (e: "paginationChange", { page, pageSize }: { page: number; pageSize: number }): void;
  (e: "showSizeChange", { current, size }: { current: number; size: number }): void;
  (e: "update:expandedRowKeys", value: string[]): void;
}>();

//表格配置信息
const tableConfig = computed(() => props.config);
//分页大小选项
const pageSizeOptions = ref(["10", "15", "20", "100", "1000"]);
//表格大小类型
const tableSizeType = ref<SizeType>("middle");
//选中得行
const selectedRowKeys = ref<string[]>([]);
// 展开得行 keys
const expandedRowKeys = computed({
  get: () => props.expandedRowKeys,
  set: (value: string[] | undefined) => emits("update:expandedRowKeys", value as string[]),
});

//暴露属性
defineExpose({
  /**
   * 获取选中得行 key
   */
  getSelectedRowKeys(): string[] {
    return selectedRowKeys.value;
  },
  /**
   * 设置选中的行
   * @param ids
   */
  setSelectedRowKeys(ids: string[]) {
    selectedRowKeys.value = [];
    selectedRowKeys.value.push(...ids);
  },
  /**
   * 设置选中的行
   * @param id
   */
  setSelectedRowKey(id: string) {
    const index = selectedRowKeys.value.findIndex((w) => w == id);
    if (index > -1) return;
    selectedRowKeys.value.push(id);
  },
  /**
   * 清楚选中行的keys
   */
  clearSelectedRowKeys() {
    selectedRowKeys.value = [];
  },
});

/**
 * 改变事件
 * @param pagination
 * @param filters
 * @param sorter
 * @param extra
 */
const onChange = (pagination: TablePaginationConfig, filters: Record<string, FilterValue | null>, sorter: SorterResult<any> | SorterResult<any>[], extra: TableCurrentDataSource<any>) => {
  emits("change", { pagination, filters, sorter, extra });
};

/**
 * 页码或 pageSize 改变的回调，参数是改变后的页码及每页条数
 * @param param0
 */
const onPaginationChange = ({ page, pageSize }: { page: number; pageSize: number }) => {
  emits("paginationChange", { page, pageSize });
};

/**
 * pageSize 变化的回调
 * @param param0
 */
const onShowSizeChange = ({ current, size }: { current: number; size: number }) => {
  emits("showSizeChange", { current, size });
};

//多选配置
const rowSelection = computed(() => {
  return {
    selectedRowKeys: unref(selectedRowKeys),
    onChange: (changableRowKeys: string[]) => {
      selectedRowKeys.value = changableRowKeys;
    },
    hideDefaultSelections: true,
    selections: [
      Table.SELECTION_ALL,
      Table.SELECTION_INVERT,
      Table.SELECTION_NONE,
      {
        key: "odd",
        text: "选择奇数行",
        onSelect: (changableRowKeys: any) => {
          let newSelectedRowKeys = [];
          newSelectedRowKeys = changableRowKeys.filter((_key: any, index: number) => {
            if (index % 2 !== 0) {
              return false;
            }
            return true;
          });
          selectedRowKeys.value = newSelectedRowKeys;
        },
      },
      {
        key: "even",
        text: "选择偶数行",
        onSelect: (changableRowKeys: any) => {
          let newSelectedRowKeys = [];
          newSelectedRowKeys = changableRowKeys.filter((_key: any, index: number) => {
            if (index % 2 !== 0) {
              return true;
            }
            return false;
          });
          selectedRowKeys.value = newSelectedRowKeys;
        },
      },
    ],
  } as TableRowSelection;
});
</script>

<template>
  <div>
    <a-card class="mb-16" v-show="tableConfig.search.state" :bordered="false">
      <!-- 检索插槽 -->
      <slot name="search"></slot>
    </a-card>

    <a-card :bodyStyle="{ paddingTop: 0 }" :bordered="false">
      <a-row class="pt-16 pb-16">
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
          <a-space :size="8">
            <!-- 工具栏左侧插槽 -->
            <slot name="toolbar-left"></slot>
          </a-space>
        </a-col>
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12" class="text-right">
          <a-space :size="8">
            <!-- 工具栏右侧插槽 -->
            <slot name="toolbar-right"></slot>
            <!-- 表格大小控制 -->
            <a-dropdown>
              <a-button type="text">
                <template #icon><AppIcon name="column-height-outlined" /> </template>
              </a-button>
              <template #overlay>
                <a-menu>
                  <a-menu-item @click="() => (tableSizeType = undefined)"> 默认 </a-menu-item>
                  <a-menu-item @click="() => (tableSizeType = 'middle')"> 中等 </a-menu-item>
                  <a-menu-item @click="() => (tableSizeType = 'small')"> 紧凑 </a-menu-item>
                </a-menu>
              </template>
            </a-dropdown>
          </a-space>
        </a-col>
      </a-row>

      <!-- 表格 -->
      <slot name="table">
        <a-table
          :size="tableSizeType"
          :row-selection="rowSelection"
          :data-source="tableConfig.data"
          :pagination="
            props.isPagination
              ? {
                  pageSize: tableConfig.size,
                  total: tableConfig.total,
                  current: tableConfig.page,
                  pageSizeOptions,
                  showSizeChanger: true,
                  onChange: (page, pageSize) => onPaginationChange({ page, pageSize }),
                  onShowSizeChange: (current, size) => onShowSizeChange({ current, size }),
                  showTotal: (total) => `共${total}条`,
                  showQuickJumper: true,
                }
              : false
          "
          :loading="tableConfig.loading"
          :scroll="{ x: 'calc(100wh - 300px)' }"
          row-key="id"
          v-model:expandedRowKeys="expandedRowKeys"
          @change="(pagination, filters, sorter, extra) => onChange(pagination, filters, sorter, extra)"
        >
          <slot name="table-col"></slot>
        </a-table>
      </slot>
    </a-card>
  </div>
</template>
