<script lang="ts" setup>
import { reactive, ref, onMounted } from "vue";
import { FormInstance } from "ant-design-vue";
import { useAuthority } from "@/utils/Authority";
import AppIcon from "@/core/components/AppIcon.vue";
import Info from "./Info.vue";
import Tools from "@/core/utils/Tools";
import PageContainer from "@/core/components/PageContainer.vue";
import TableCurd from "@/core/components/curd/TableCurd.vue";
import MemberService from "@/services/base/MemberService";
import AppConsts from "@/utils/AppConsts";
import router from "@/core/router";

defineOptions({ name: "base_member" });

const state = reactive({
  search: {
    state: false,
    vm: {
      name: undefined,
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
    const result = await MemberService.findList(state.page, state.size, state.search.vm, state.search.sort);
    state.loading = false;
    if (result.code != 1) return;
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
    const result = await MemberService.deleteList(ids);
    state.loading = false;
    if (result.code != 1) return;
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
  MemberService.exportExcel(state.search.vm, state.search.sort);
}

/**
 * 处理头像
 * @param photo
 */
function handlePhoto(photo: string) {
  if (photo) {
    var photoArray = JSON.parse(photo);
    return AppConsts.domainServerApi + (photoArray.length > 0 ? photoArray[0].url : "");
  }

  return undefined;
}

/**
 * 跳转详情
 * @param row
 */
function jumpDetails(row: any) {
  router.push(`/base/member/details/${row.id}/${row.name}`);
}
</script>

<template>
  <PageContainer>
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
        <a-form ref="refSearchForm" :model="state.search.vm" v-if="power.search">
          <a-row :gutter="[16, 0]">
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="name" label="名称">
                <a-input v-model:value="state.search.vm.name" placeholder="名称" />
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
        <a-dropdown>
          <template #overlay>
            <a-menu>
              <a-menu-item key="1" @click="exportExcel()">导出 Excel</a-menu-item>
            </a-menu>
          </template>
          <a-button> 更多 <AppIcon name="ellipsis-outlined" /> </a-button>
        </a-dropdown>
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
        <template v-for="item,index in state.columns.filter((w:any) => w.fieldName !== 'id' && w.show)" :key="item.fieldName">
          <a-table-column :title="item.title" :data-index="item.fieldName" :sorter="item.sort ? { multiple: index + 1 } : false">
            <!-- 头像自定义列 -->
            <template #default="{ record }" v-if="item.fieldName == 'photo'">
              <img :src="handlePhoto(record.photo)" width="35" height="35" />
            </template>
          </a-table-column>
        </template>
        <!-- 操作 -->
        <a-table-column title="操作" data-index="id" v-if="power.update || power.delete">
          <template #default="{ record }">
            <template v-if="power.update">
              <a href="javascript:void(0)" @click="jumpDetails(record)">详情</a>
            </template>
            <a-divider type="vertical" />
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
