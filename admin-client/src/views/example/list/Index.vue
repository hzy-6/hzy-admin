<script lang="ts" setup>
import { reactive, ref, onMounted } from "vue";
import AppIcon from "@/core/components/AppIcon.vue";
import Info from "./Info.vue";
import Tools from "@/core/utils/Tools";
import PageContainer from "@/core/components/PageContainer.vue";
import TableCurd from "@/core/components/curd/TableCurd.vue";
import { FormInstance } from "ant-design-vue";
defineOptions({ name: "ListIndexCom" });

const columns = [
  {
    title: "序号",
    dataIndex: "key",
    width: 80,
    fixed: "left",
  },
  {
    title: "姓名",
    dataIndex: "name",
    ellipsis: true,
    width: 130,
  },
  {
    title: "年龄",
    dataIndex: "age",
    ellipsis: true,
    width: 180,
  },
  {
    title: "地址",
    dataIndex: "address",
    ellipsis: true,
    width: 180,
  },
  {
    title: "列1",
    dataIndex: "column1",
    ellipsis: true,
    width: 180,
  },
  {
    title: "列2",
    dataIndex: "column2",
    ellipsis: true,
    width: 180,
  },
  {
    title: "列3",
    dataIndex: "column3",
    ellipsis: true,
    width: 180,
  },
  {
    title: "列4",
    dataIndex: "column4",
    ellipsis: true,
    width: 180,
  },
  {
    title: "操作",
    dataIndex: "id",
    width: 120,
    fixed: "right",
  },
];

const state = reactive({
  search: {
    state: false,
    vm: {
      value: "",
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

/**
 * 初始化
 */
onMounted(() => {
  findList();
});

function findList() {
  state.loading = true;
  state.columns = columns;
  setTimeout(() => {
    const data = [];
    for (let i = 0; i < 100; i++) {
      data.push({
        key: i + 1,
        name: `Hzy ${i + 1}`,
        age: 18 + i,
        address: `addr. ${i + 1}`,
        column1: `London Park no. ${i}`,
        column2: `London Park no. ${i}`,
        column3: `London Park no. ${i}`,
        column4: `London Park no. ${i}`,
        id: i,
      });
    }
    state.data = data;
    state.loading = false;
  }, 300);
}

function exportExcel() {
  Tools.notice.success("导出Excel成功!");
}

function deleteList(id?: string) {
  let ids: string[] | undefined = [];
  if (id) {
    ids.push(id);
  } else {
    ids = refTableCurd.value?.getSelectedRowKeys();
  }
  // service.deleteList(ids).then((res) => {
  //   if (res.code != 1) return;
  //   tools.message("删除成功!", appConsts.success);
  //   methods.findList();
  // });
  console.log(ids);
  Tools.message.success("删除成功!");
}

//打开表单页面
function openForm(id: string) {
  refInfo.value!.open({ key: id });
}
</script>

<template>
  <PageContainer>
    <template #describe>
      <span>段落示意：蚂蚁金服务设计平台 ant.design，用最小的工作量，无缝接入蚂蚁金服生态， 提供跨越设计与开发的体验解决方案。</span>
      <!-- <img alt="这是一个标题" src="https://gw.alipayobjects.com/zos/rmsportal/RzwpdLnhmvDJToTdfDPe.png" width="80" /> -->
    </template>

    <TableCurd :config="state" ref="refTableCurd">
      <!-- search -->
      <template #search>
        <a-form ref="refSearchForm" :model="state.search.vm">
          <a-row :gutter="[16, 0]">
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="value" label="真实姓名">
                <a-input v-model:value="state.search.vm.value" placeholder="真实名称" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="value" label="真实姓名">
                <a-input v-model:value="state.search.vm.value" placeholder="真实名称" />
              </a-form-item>
            </a-col>
            <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
              <a-form-item class="mb-0" name="value" label="真实姓名">
                <a-input v-model:value="state.search.vm.value" placeholder="真实名称" />
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
        <a-button type="primary" @click="openForm('')">
          <template #icon>
            <AppIcon name="PlusOutlined" />
          </template>
          新建
        </a-button>
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
        <a-dropdown>
          <template #overlay>
            <a-menu>
              <a-menu-item key="1" @click="exportExcel()">导出 Excel</a-menu-item>
              <a-menu-item key="2" @click="exportExcel()">下载 导入模板</a-menu-item>
              <a-menu-item key="3" @click="exportExcel()">导入 Excel</a-menu-item>
            </a-menu>
          </template>
          <a-button> 更多 <AppIcon name="ellipsis-outlined" /> </a-button>
        </a-dropdown>
        <a-tooltip title="列设置">
          <a-button type="text">
            <template #icon><AppIcon name="setting-outlined" /> </template>
          </a-button>
        </a-tooltip>
      </template>
      <!-- table-col -->
      <template #table-col>
        <template v-for="item in state.columns.filter((w:any) => w.dataIndex !== 'id')" :key="item.dataIndex">
          <a-table-column :title="item.title" :data-index="item.dataIndex" />
        </template>
        <!-- 操作 -->
        <a-table-column title="操作" data-index="id">
          <template #default="{ record }">
            <a @click="openForm(record.id)">编辑</a>
            <a-divider type="vertical" />
            <a-popconfirm title="您确定要删除?" @confirm="deleteList(record.id)" okText="确定" cancelText="取消">
              <a class="text-danger">删除</a>
            </a-popconfirm>
          </template>
        </a-table-column>
      </template>
    </TableCurd>
    <!-- info -->
    <Info ref="refInfo" :onSuccess="() => findList()" />
  </PageContainer>
</template>
