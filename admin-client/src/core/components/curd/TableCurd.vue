<!-- 脚本 -->
<script lang="ts" setup>
import {Table, TablePaginationConfig} from "ant-design-vue";
import {FilterValue, SorterResult, TableCurrentDataSource, TableRowSelection} from "ant-design-vue/es/table/interface";
import {SizeType} from "ant-design-vue/lib/config-provider";
import {ref, computed, unref, watch} from "vue";
import AppIcon from "@/core/components/AppIcon.vue";
import ColumnSetting from "@/core/components/curd/components/ColumnSetting.vue";

interface ITableConfig {
  search: any;
  loading: boolean;
  page: number;
  size: number;
  total: number;
  /**
   * 列头
   */
  columns: any[];

  /**
   * 数据
   */
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
      /**
       * 数据行的唯一 key
       */
      rowKey?: string;
      /**
       * 是否默认表格
       * true: 默认表格 - 采用 dom 元素配置列头
       * false: 自定义表格 - 采用属性 columns 配置列头
       */
      isDefaultTable?: boolean;
      /**
       * 是否显示列设置
       */
      columnSetting?: boolean;
    }>(),
    {
      isPagination: true,
      rowKey: "id",
      isDefaultTable: true,
      columnSetting: true,
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
  (e: "paginationChange", {page, pageSize}: { page: number; pageSize: number }): void;
  (e: "showSizeChange", {current, size}: { current: number; size: number }): void;
  (e: "update:expandedRowKeys", value: string[]): void;
  (e: "update:config", value: ITableConfig): void;
}>();

//表格配置信息
const tableConfig = computed({
  get: () => props.config,
  set: (value: ITableConfig) => emits("update:config", value),
});
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
//
const selectedKeys = ref<string[]>([tableSizeType.value as any]);

/**
 * 监听配置变化
 */
watch(props.config, (value) => {
  // 修改列头 添加一个 show 属性
  value.columns.forEach((item) => {
    item.show = item.show == undefined ? true : item.show;
  });
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
  emits("change", {pagination, filters, sorter, extra});
};

/**
 * 页码或 pageSize 改变的回调，参数是改变后的页码及每页条数
 * @param param0
 */
const onPaginationChange = ({page, pageSize}: { page: number; pageSize: number }) => {
  emits("paginationChange", {page, pageSize});
};

/**
 * pageSize 变化的回调
 * @param param0
 */
const onShowSizeChange = ({current, size}: { current: number; size: number }) => {
  emits("showSizeChange", {current, size});
};

//多选配置
const rowSelection = computed(() => {
  return {
    selectedRowKeys: unref(selectedRowKeys),
    onChange: (changeTableRowKeys: string[]) => {
      selectedRowKeys.value = changeTableRowKeys;
    },
    hideDefaultSelections: true,
    selections: [
      Table.SELECTION_ALL,
      Table.SELECTION_INVERT,
      Table.SELECTION_NONE,
      {
        key: "odd",
        text: "选择奇数行",
        onSelect: (changeTableRowKeys: any) => {
          let newSelectedRowKeys = [];
          newSelectedRowKeys = changeTableRowKeys.filter((_key: any, index: number) => {
            return index % 2 === 0;
          });
          selectedRowKeys.value = newSelectedRowKeys;
        },
      },
      {
        key: "even",
        text: "选择偶数行",
        onSelect: (changeTableRowKeys: any) => {
          let newSelectedRowKeys = [];
          newSelectedRowKeys = changeTableRowKeys.filter((_key: any, index: number) => {
            return index % 2 !== 0;
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
    <a-card class="mb-16" :bordered="false" :bodyStyle="{ padding: 0 }" v-show="tableConfig.search.state">
      <div class="p-16">
        <!-- 检索插槽 -->
        <slot name="search"></slot>
      </div>
    </a-card>

    <a-card class="mb-16" :bordered="false" :bodyStyle="{ padding: 0 }">
      <!-- 工具栏 -->
      <a-row class="p-16">
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
            <!-- 列设置 -->
            <ColumnSetting
                v-model:columns="tableConfig.columns"
                v-if="props.columnSetting && tableConfig.columns && tableConfig.columns.length>0"/>
            <!-- 表格大小控制 -->
            <a-dropdown>
              <a-button type="text">
                <template #icon>
                  <AppIcon name="column-height-outlined"/>
                </template>
              </a-button>
              <template #overlay>
                <a-menu v-model:selectedKeys="selectedKeys">
                  <a-menu-item key="large" @click="() => {
                    tableSizeType = 'large'
                    selectedKeys=[tableSizeType]
                  }">
                    默认
                  </a-menu-item>
                  <a-menu-item key="middle" @click="() => {
                    tableSizeType = 'middle'
                    selectedKeys=[tableSizeType]
                  }">
                    中等
                  </a-menu-item>
                  <a-menu-item key="small" @click="() => {
                    tableSizeType = 'small';
                    selectedKeys=[tableSizeType]
                  }">
                    紧凑
                  </a-menu-item>
                </a-menu>
              </template>
            </a-dropdown>
          </a-space>
        </a-col>
      </a-row>
    </a-card>

    <!-- 表格 -->
    <div>
      <slot name="table">
        <a-table
            :columns="props.isDefaultTable ? undefined : tableConfig.columns"
            :size="tableSizeType"
            :row-selection="rowSelection"
            :data-source="tableConfig.data"
            :pagination="
            props.isPagination
              ? {
                  size: 'default',
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
            :row-key="props.rowKey"
            v-model:expandedRowKeys="expandedRowKeys"
            @change="(pagination, filters, sorter, extra) => onChange(pagination, filters, sorter, extra)"
        >

          <!--         菜单用 dom 自定义列-->
          <slot name="table-col" v-if="props.isDefaultTable">
            <template v-for="(item,index) in tableConfig.columns.filter((w:any) =>  w.show)" :key="item.dataIndex">
              <slot :name="item.dataIndex" v-bind="item">
                <a-table-column v-bind="item" :index="index"/>
              </slot>
            </template>
          </slot>

          <!--         菜单用 columns 自动设置列-->
          <template #bodyCell="bodyCell" v-if="!props.isDefaultTable">
            <slot name="bodyCell" v-bind="bodyCell"></slot>
          </template>
        </a-table>
      </slot>
    </div>
  </div>
</template>
