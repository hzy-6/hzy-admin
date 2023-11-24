<script lang="ts" setup>
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import SysOperationLogService from "@/services/system/SysOperationLogService";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

const state = reactive({
  vm: {
    id: "",
    form: {} as any,
    use: {} as any,
  },
  visible: false,
  loading: false,
});

//表单实例
const refForm = ref<FormInstance>();

//向父级导出 函数
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  open: (key: string = "") => {
    state.visible = true;
    if (state.visible) {
      state.vm.id = key;
    }
    refForm.value?.resetFields();
    //初始化表单数据
    state.loading = true;
    SysOperationLogService.findForm(key).then((res) => {
      state.loading = false;
      if (res.code != 200) return;
      state.vm = res.data;
    });
  },
});
</script>

<template>
  <a-modal v-model:open="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" width="70%">
    <template #footer>
      <!-- <a-button type="primary" :loading="state.loading" @click="save()"> 提交</a-button> -->
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <a-spin :spinning="state.loading">
      <a-descriptions bordered class="text-Center w100">
        <!-- :column="{ xxl: 3, xl: 3, lg: 3, md: 3, sm: 1, xs: 1 }" -->
        <a-descriptions-item label="请求接口" style="width: 150px" :span="3">
          {{ state.vm.form.api }}
        </a-descriptions-item>
        <a-descriptions-item label="请求ip" style="width: 150px">
          {{ state.vm.form.ip }}
        </a-descriptions-item>

        <a-descriptions-item label="浏览器">
          {{ state.vm.form.browser }}
        </a-descriptions-item>
        <a-descriptions-item label="操作系统">
          {{ state.vm.form.os }}
        </a-descriptions-item>
        <a-descriptions-item label="操作人">
          {{ state.vm.use.name }}
        </a-descriptions-item>
        <a-descriptions-item label="操作人账号">
          {{ state.vm.use.loginName }}
        </a-descriptions-item>
        <a-descriptions-item label="请求所耗时间"> {{ state.vm.form.takeUpTime }}(毫秒) </a-descriptions-item>
        <a-descriptions-item label="访问时间" style="width: 150px" :span="3">
          {{ state.vm.form.createTime }}
        </a-descriptions-item>

        <a-descriptions-item label="请求体" :span="3">
          {{ state.vm.form.formBody }}
        </a-descriptions-item>
        <a-descriptions-item label="请求表单" :span="3">
          {{ state.vm.form.form }}
        </a-descriptions-item>
        <a-descriptions-item label="地址栏参数" :span="3">
          {{ state.vm.form.queryString }}
        </a-descriptions-item>
      </a-descriptions>
    </a-spin>
  </a-modal>
</template>
