<template>
  <div class="context">
    <ul>
      <li class="panel-color-1 text-center">
        <h2 style="color: #fff">数据连接打开数</h2>
        <h2 style="color: #fff">{{ context.openDbConnectionCount }}</h2>
      </li>
      <li class="panel-color-2 text-center">
        <h2 style="color: #fff">数据连接断开数</h2>
        <h2 style="color: #fff">{{ context.closeDbConnectionCount }}</h2>
      </li>
      <li class="panel-color-3 text-center">
        <h2 style="color: #fff">连接失败数量</h2>
        <h2 style="color: #fff">{{ context.connectionFailedCount }}</h2>
      </li>
      <li class="panel-color-4 text-center">
        <h2 style="color: #fff">创建命令数</h2>
        <h2 style="color: #fff">{{ context.createCommandCount }}</h2>
      </li>
      <li class="panel-color-5 text-center">
        <h2 style="color: #fff">执行命令数</h2>
        <h2 style="color: #fff">{{ context.executeCommandCount }}</h2>
      </li>
    </ul>
    <!-- 第二波 -->
    <ul>
      <li class="panel-color-6 text-center">
        <h2 style="color: #fff">命令执行失败数量</h2>
        <h2 style="color: #fff">{{ context.commandFailedCount }}</h2>
      </li>
      <li class="panel-color-7 text-center">
        <h2 style="color: #fff">创建事务数</h2>
        <h2 style="color: #fff">{{ context.createTransactionCount }}</h2>
      </li>
      <li class="panel-color-8 text-center">
        <h2 style="color: #fff">提交事务数</h2>
        <h2 style="color: #fff">{{ context.submitTransactionCount }}</h2>
      </li>
      <li class="panel-color-9 text-center">
        <h2 style="color: #fff">回滚事务数</h2>
        <h2 style="color: #fff">{{ context.rollBackCount }}</h2>
      </li>
      <li class="panel-color-10 text-center">
        <h2 style="color: #fff">事务失败数</h2>
        <h2 style="color: #fff">{{ context.transactionFailedCount }}</h2>
      </li>
    </ul>
  </div>
</template>
<script setup>
import { ref, onBeforeUnmount } from "vue";
import service from "@/service/development_tool/monitor_ef_core_service.js";

const context = ref({});
const methods = {
  getEFCoreMonitorContext() {
    service.getEFCoreMonitorContext().then((res) => {
      context.value = res.data;
    });
  },
};

methods.getEFCoreMonitorContext();

//定时加载
let timer = ref(null);
timer.value = setInterval(() => {
  methods.getEFCoreMonitorContext();
}, 10 * 1000);

onBeforeUnmount(() => {
  clearInterval(timer.value);
});
</script>

<style lang="less" scoped>
.context {
  ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    li {
      padding: 10px;
      flex: 1;
      margin-right: 10px;
      margin-bottom: 10px;
    }
  }
}

.panel-color-1 {
  background: #5b8ff9;
}
.panel-color-2 {
  background: #61ddaa;
}
.panel-color-3 {
  background: #65789b;
}

.panel-color-4 {
  background: #f6bd16;
}
.panel-color-5 {
  background: #7262fd;
}
.panel-color-6 {
  background: #78d3f8;
}
.panel-color-7 {
  background: #9661bc;
}
.panel-color-8 {
  background: #f6903d;
}
.panel-color-9 {
  background: #008685;
}
.panel-color-10 {
  background: #f08bb4;
}
</style>
