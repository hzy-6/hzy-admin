<script lang="ts" setup>
import { ref, onMounted, onBeforeUnmount } from "vue";
import PageContainer from "@/core/components/PageContainer.vue";
import TimedTaskService from "@/services/development_tool/TimedTaskService";
import Tools from "@/core/utils/Tools";
import Info from "./Info.vue";
import LogInfo from "./LogInfo.vue";

defineOptions({ name: "system_user" });

const searchValue = ref("");
const loading = ref(false);
const taskList = ref<any[]>([]);
let timer: any;
//表单操作对象
const refInfo = ref<InstanceType<typeof Info>>();
//日志示例
const refLogInfo = ref<InstanceType<typeof LogInfo>>();

//组件加载完成
onMounted(() => {
  findList();
  timer = setInterval(() => {
    //刷新数据列表
    findList();
  }, 30 * 1000);
});

//组件销毁时
onBeforeUnmount(() => {
  clearInterval(timer);
});

/**
 * 获取列表数据
 */
async function findList() {
  loading.value = true;
  const result = await TimedTaskService.findList(searchValue.value);
  loading.value = false;
  if (result.code != 1) return;
  taskList.value = result.data;
}

/**
 * 删除数据
 * @param id
 */
async function deleteList(id: string) {
  loading.value = true;
  const result = await TimedTaskService.deleteList([id]);
  loading.value = false;
  if (result.code != 1) return;
  Tools.message.success("删除成功!");
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
    if (result.code != 1) {
      //回退状态
      taskList.value.find((w) => w.id == id).state = 0;
      return;
    }
  } else {
    loading.value = true;
    const result = await TimedTaskService.close([id]);
    loading.value = false;
    if (result.code != 1) {
      //回退状态
      taskList.value.find((w) => w.id == id).state = 0;
      return;
    }
  }
}
</script>

<template>
  <PageContainer>
    <a-card :bordered="false">
      <template #title>
        <a-input-search v-model:value="searchValue" placeholder="请输入" style="width: 200px" @search="() => findList()" />
      </template>
      <template #extra>
        <a-button type="primary" @click="() => refInfo?.open()">新建任务</a-button>
      </template>
      <a-spin :spinning="loading">
        <div class="task" v-for="item in taskList">
          <div class="task-item">
            <div class="title" style="color: initial">
              {{ item.name }} <span>{{ item.groupName }}</span>
            </div>
            <div class="value">{{ item.apiUrl }}</div>
          </div>
          <div class="task-item">
            <div class="title">请求方式</div>
            <div class="value">
              <a-tag color="#87d068" v-if="item.requsetMode == 0">POST</a-tag>
              <a-tag color="#87d068" v-if="item.requsetMode == 1">GET</a-tag>
              <a-tag color="#87d068" v-if="item.requsetMode == 2">DELETE</a-tag>
            </div>
          </div>
          <div class="task-item">
            <div class="title">间隔表达式</div>
            <div class="value">{{ item.cron }}</div>
          </div>
          <div class="task-item">
            <div class="title">执行时间</div>
            <div class="value">{{ item.executeTime }}</div>
          </div>
          <div class="task-item">
            <div class="title">运行状态</div>
            <div class="value">
              <a-switch
                v-model:checked="item.state"
                checked-children="运行"
                un-checked-children="停止"
                :checkedValue="1"
                :unCheckedValue="0"
                @change="(checked:any) => onChecked(checked as number,item.id as string)"
              />
            </div>
          </div>
          <div class="task-item">
            <div class="title">备注</div>
            <div class="value">{{ item.remark }}</div>
          </div>
          <div class="task-item">
            <div class="title"></div>
            <div class="value">
              <a href="javascript:;" @click="() => refInfo?.open(item.id)">编辑</a>
              <a-divider type="vertical" />
              <a href="javascript:;" @click="() => refLogInfo?.open(item.id)">日志</a>
              <a-divider type="vertical" />
              <a-popconfirm title="您确定要删除?" @confirm="deleteList(item.id)" okText="确定" cancelText="取消">
                <a href="javascript:;" class="text-danger">删除</a>
              </a-popconfirm>
            </div>
          </div>
        </div>
      </a-spin>
    </a-card>
    <!-- Info -->
    <Info ref="refInfo" :onSuccess="() => findList()" />
    <LogInfo ref="refLogInfo" />
  </PageContainer>
</template>

<style scoped lang="less">
.task {
  padding: 16px;
  display: flex;
  .task-item {
    flex: 1;
    text-align: center;
    .title {
      height: 25px;
      color: rgba(0, 0, 0, 0.45);
    }
  }
}
.task:hover {
  // background-color: rgba(0, 0, 0, 0.02);
  background-color: #f0f2f5;
  transition: background-color 0.3s;
  cursor: pointer;
}
</style>
