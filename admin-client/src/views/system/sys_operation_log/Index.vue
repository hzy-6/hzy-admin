<script lang="ts" setup>
import { reactive, ref, onMounted } from "vue";
import { FormInstance } from "ant-design-vue";
import { useAuthority } from "@/utils/Authority";
import AppIcon from "@/core/components/AppIcon.vue";
import Info from "./Info.vue";
import Tools from "@/core/utils/Tools";
import PageContainer from "@/core/components/PageContainer.vue";
import TableCurd from "@/core/components/curd/TableCurd.vue";
import SysOperationLogService from "@/services/system/SysOperationLogService";

defineOptions({ name: "system_function" });

const state = reactive({
  search: {
    state: false,
    vm: {
      api: undefined,
      browser: undefined,
      ip: undefined,
      os: undefined,
      rangeTime: [] as any,
      startTime: undefined,
      endTime: undefined,
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

//权限
const power = useAuthority();
//表格
const refTableCurd = ref<InstanceType<typeof TableCurd>>();
//表单操作对象
const refInfo = ref<InstanceType<typeof Info>>();
//检索表单
const refSearchForm = ref<FormInstance>();

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
    const result = await SysOperationLogService.findList(state.page, state.size, state.search.vm, state.search.sort);
    state.loading = false;
    if (result.code != 200) return;
    state.page = result.data.page;
    state.size = result.data.size;
    state.total = result.data.total;
    state.columns = result.data.columns;
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
    const result = await SysOperationLogService.deleteList(ids);
    state.loading = false;
    if (result.code != 200) return;
    Tools.message.success("删除成功!");
    findList();
  } catch (error) {
    state.loading = false;
  }
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
      :column-setting="false"
    >
      <!-- search -->
      <template #search>
        <a-form ref="refSearchForm" :model="state.search.vm" v-if="power.search">
          <a-row :gutter="[16, 0]">
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item name="api" label="接口地址">
                <a-input v-model:value="state.search.vm.api" placeholder="接口地址" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item name="browser" label="浏览器">
                <a-input v-model:value="state.search.vm.browser" placeholder="浏览器" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item name="ip" label="ip地址">
                <a-input v-model:value="state.search.vm.ip" placeholder="ip地址" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item name="os" label="操作系统">
                <a-input v-model:value="state.search.vm.os" placeholder="操作系统" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item name="rangeTime" label="日期区间">
                <a-range-picker v-model:value="state.search.vm.rangeTime" class="w100" />
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
      </template>
      <!-- table-col -->
      <template #table-col>
        <a-table-column title="接口地址" data-index="api" :width="250" :ellipsis="true" fixed="left" />
        <a-table-column title="操作系统" data-index="os" :width="100" />
        <a-table-column title="浏览器" data-index="browser" :width="100" />
        <a-table-column title="ip地址" data-index="ip" :width="120" />
        <a-table-column title="接口描述" :width="200">
          <template #default="{ record }">
            {{ record.controllerDisplayName }}
            <template v-if="record.controllerDisplayName && record.actionDisplayName"> -</template>
            {{ record.actionDisplayName }}
          </template>
        </a-table-column>
        <a-table-column title="接口耗时" data-index="takeUpTime" :width="100">
          <template #default="{ record }">
            <div class="cell" v-if="record.takeUpTime >= 1000" style="background: orange">{{ record.takeUpTime }}(毫秒)</div>
            <div class="cell" v-else-if="record.takeUpTime >= 2000" style="background: red">{{ record.takeUpTime }}(毫秒)</div>
            <div class="cell" v-else style="background: #87d068">{{ record.takeUpTime }}(毫秒)</div>
          </template>
        </a-table-column>
        <a-table-column title="操作人姓名" data-index="userName" :width="100" />
        <a-table-column title="操作人账号" data-index="loginName" :width="100" />
        <a-table-column title="创建时间" data-index="creationTime" :width="150" />
        <!-- 操作 -->
        <a-table-column title="操作" data-index="id" :width="100">
          <template #default="{ record }">
            <a href="javascript:;" @click="() => refInfo?.open(record.id)">详情</a>
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

<style lang="less" scoped>
.cell {
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  right: 0;
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
