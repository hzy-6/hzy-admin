<script setup lang="ts">
import { onBeforeUnmount, onMounted, reactive, ref } from "vue";
import TimedTaskService from "@/services/development_tool/TimedTaskService";
import Tools from "@/core/utils/Tools";
import Info from "@/views/development_tool/timed_task/Info.vue";
import Log from "@/views/development_tool/timed_task/Log.vue";
import PageContainer from "@/core/components/PageContainer.vue";

const columns = [
  {
    title: "分组",
    dataIndex: "groupName",
    align: "center",
    width: 200,
    ellipsis: true,
    fixed: "left",
  },
  {
    title: "作业名称",
    dataIndex: "name",
    align: "center",
    width: 300,
    ellipsis: true,
    fixed: "left",
  },
  {
    title: "任务类型",
    dataIndex: "type",
    align: "center",
    width: 100,
  },
  {
    title: "间隔表达式",
    dataIndex: "cron",
    align: "center",
    width: 120,
  },
  {
    title: "最后执行时间",
    dataIndex: "executeTime",
    align: "center",
    width: 150,
  },
  {
    title: "描述",
    dataIndex: "remark",
    align: "center",
    ellipsis: true,
    // minWidth: 150,
  },
  {
    title: "状态",
    dataIndex: "state",
    align: "center",
    width: 80,
    fixed: "right",
  },
  {
    title: "操作",
    dataIndex: "id",
    align: "center",
    width: 200,
    fixed: "right",
  },
];

const searchValue = ref("");
const loading = ref(false);
const taskList = ref<any[]>([]);
let timer: any;
//表单操作对象
const refInfo = ref<InstanceType<typeof Info>>();
const refLog = ref<InstanceType<typeof Log>>();
const state = reactive<{
  selectedRowKeys: string[];
  refresh: boolean;
}>({
  selectedRowKeys: [], // Check here to configure the default column
  refresh: false,
});

//组件加载完成
onMounted(() => {
  findList();
  timer = setInterval(() => {
    if (!state.refresh) return;
    //刷新数据列表
    findList();
  }, 30 * 1000);
});

//组件销毁时
onBeforeUnmount(() => {
  clearInterval(timer);
});

const onSelectChange = (selectedRowKeys: string[]) => {
  console.log("selectedRowKeys changed: ", selectedRowKeys);
  state.selectedRowKeys = selectedRowKeys;
};

/**
 * 获取列表数据
 */
async function findList() {
  loading.value = true;
  const result = await TimedTaskService.findList(searchValue.value);
  loading.value = false;
  if (result.code != 200) return;
  taskList.value = result.data;
}

/**
 * 删除数据
 * @param id
 */
async function deleteList(id: string | undefined) {
  let ids: string[] = [];
  if (id == undefined) {
    if (state.selectedRowKeys.length == 0) return Tools.message.warning("请选择要删除的数据!");
    ids.push(...state.selectedRowKeys);
  } else {
    ids.push(id);
  }

  loading.value = true;
  const result = await TimedTaskService.deleteList(ids);
  loading.value = false;
  if (result.code != 200) return;
  Tools.message.success("删除成功!");
  await findList();
}

/**
 * 运行状态改变事件
 * @param checked
 * @param id
 */
async function onChecked(checked: number, id: string) {
  if (checked == 1) {
    loading.value = true;
    const result = await TimedTaskService.run([id]);
    loading.value = false;
    if (result.code != 200) {
      //回退状态
      taskList.value.find((w) => w.id == id).state = 0;
      return;
    }
  } else {
    loading.value = true;
    const result = await TimedTaskService.close([id]);
    loading.value = false;
    if (result.code != 200) {
      //回退状态
      taskList.value.find((w) => w.id == id).state = 0;
      return;
    }
  }

  Tools.message.success("执行成功!");
  await findList();
}

/**
 * 扫描任务
 */
async function scanJob() {
  loading.value = true;
  const result = await TimedTaskService.scanTask();
  loading.value = false;
  console.log(result);
  if (result.code == 200) {
    await findList();
    return Tools.message.success("扫描成功!");
  }
}
</script>

<template>
  <PageContainer>
    <a-spin :spinning="loading">
      <a-card>
        <a-row>
          <a-col :xs="24" :sm="24" :md="12" :lg="6" :xl="6">
            <a-space>
              <a-button type="primary" @click="() => refInfo?.openWindow()">新建</a-button>
              <a-button type="primary" @click="scanJob">
                <template #icon>
                  <ScanOutlined />
                </template>
                恢复本地任务
              </a-button>
              <a-popconfirm title="确定要删除?" @confirm="deleteList(undefined)">
                <a-button type="primary" danger v-if="state.selectedRowKeys.length > 0">批量删除</a-button>
              </a-popconfirm>
            </a-space>
          </a-col>
          <a-col :xs="24" :sm="24" :md="12" :lg="6" :xl="6"></a-col>
          <a-col :xs="24" :sm="24" :md="12" :lg="6" :xl="6">
            <a-checkbox v-model:checked="state.refresh">30s刷新</a-checkbox>
          </a-col>
          <a-col :xs="24" :sm="24" :md="12" :lg="6" :xl="6" class="text-right">
            <a-input-search v-model:value="searchValue" placeholder="请输入" @search="() => findList()" />
          </a-col>
        </a-row>
      </a-card>
      <div class="mt-24">
        <!--      :scroll="{ x: 2000 }"-->
        <a-table
          :data-source="taskList"
          :columns="columns"
          size="small"
          :expand-column-width="50"
          row-key="id"
          :pagination="false"
          :scroll="{ x: 'calc(100vw - 100px)' }"
          :row-selection="{ selectedRowKeys: state.selectedRowKeys, onChange: onSelectChange }"
        >
          <template #bodyCell="{ column, text, record }">
            <template v-if="column.dataIndex === 'type'">
              <!--            <a-tag v-if="text == 1" color="#f50">本地内存</a-tag>-->
              <!--            <a-tag v-if="text == 2" color="#f50">本地异步任务</a-tag>-->
              <a-tag v-if="text == 3" color="#1677ff">本地同步任务</a-tag>
              <a-tag v-if="text == 4" color="#a0d911">本地异步任务</a-tag>
              <a-tag v-else-if="text == 5" color="#722ed1">Http同步任务</a-tag>
              <a-tag v-else-if="text == 6" color="#eb2f96">Http异步任务</a-tag>
            </template>
            <template v-else-if="column.dataIndex === 'state'">
              <a-switch v-model:checked="record.state" @change="onChecked($event, record.id)" />
            </template>
            <template v-else-if="column.dataIndex === 'id'">
              <a-space>
                <template #split>
                  <a-divider type="vertical" />
                </template>
                <a-typography-link @click="() => refInfo?.openWindow(record.id)">编辑</a-typography-link>
                <a-typography-link @click="() => refLog?.openWindow(record.id)">日志</a-typography-link>
                <a-popconfirm title="确定要删除?" @confirm="deleteList(record.id)">
                  <a-typography-link class="text-danger">删除</a-typography-link>
                </a-popconfirm>
              </a-space>
            </template>
          </template>

          <!--        折叠-->
          <template #expandedRowRender="{ record }">
            <a-descriptions :title="record.name" bordered>
              <a-descriptions-item label="分组">
                {{ record.groupName }}
              </a-descriptions-item>
              <a-descriptions-item label="Http请求类型" :span="2">
                <a-tag v-if="record.requestMode == 0" :bordered="false" color="processing">Post</a-tag>
                <a-tag v-else-if="record.requestMode == 1" :bordered="false" color="green">Get</a-tag>
                <a-tag v-else-if="record.requestMode == 2" :bordered="false" color="purple">Delete</a-tag>
              </a-descriptions-item>
              <a-descriptions-item label="执行端点" :span="3">
                {{ record.jobPoint }}
              </a-descriptions-item>
              <a-descriptions-item label="描述" :span="3">
                {{ record.remark }}
              </a-descriptions-item>
              <!--            <a-descriptions-item label="Automatic Renewal">YES</a-descriptions-item>-->
              <!--            <a-descriptions-item label="Order time">2018-04-24 18:00:00</a-descriptions-item>-->
              <!--            <a-descriptions-item label="Usage Time" :span="2">2019-04-24 18:00:00</a-descriptions-item>-->
              <!--            <a-descriptions-item label="Status" :span="3">-->
              <!--              <a-badge status="processing" text="Running"/>-->
              <!--            </a-descriptions-item>-->
              <!--            <a-descriptions-item label="Negotiated Amount">$80.00</a-descriptions-item>-->
              <!--            <a-descriptions-item label="Discount">$20.00</a-descriptions-item>-->
              <!--            <a-descriptions-item label="Official Receipts">$60.00</a-descriptions-item>-->
              <!--            <a-descriptions-item label="Config Info">-->
              <!--              Data disk type: MongoDB-->
              <!--              <br/>-->
              <!--              Database version: 3.4-->
              <!--              <br/>-->
              <!--              Package: dds.mongo.mid-->
              <!--              <br/>-->
              <!--              Storage space: 10 GB-->
              <!--              <br/>-->
              <!--              Replication factor: 3-->
              <!--              <br/>-->
              <!--              Region: East China 1-->
              <!--              <br/>-->
              <!--            </a-descriptions-item>-->
            </a-descriptions>
          </template>
          <template #expandColumnTitle>
            <span style="color: red">更多</span>
          </template>
        </a-table>
      </div>
      <!-- Info -->
      <Info ref="refInfo" :onSuccess="() => findList()" />
      <!--    Log-->
      <Log ref="refLog" :onSuccess="() => findList()" />
    </a-spin>
  </PageContainer>
</template>
