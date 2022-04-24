<template>
  <a-modal v-model:visible="state.visible" title="编辑" centered @ok="state.visible = false" :width="800">
    <template #footer>
      <a-button type="primary" @click="methods.saveForm()" :loading="state.saveLoading">提交</a-button>
      <a-button type="danger" ghost @click="state.visible = false" class="ml-15">关闭</a-button>
    </template>
    <a-spin :spinning="state.saveLoading">
      <a-form ref="formRef" layout="vertical" :model="state.vm" :rules="rules">
        <a-row :gutter="[15, 15]">
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="任务名称" ref="name" name="name">
              <a-input v-model:value="state.vm.name" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="分组" ref="groupName" name="groupName">
              <a-input v-model:value="state.vm.groupName" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item ref="cron" name="cron">
              <template #label> 定时规则 &nbsp; <a target="_blank" href="https://www.bejson.com/othertools/cron/">在线生成规则</a> </template>
              <GenerateCron v-model:value="state.vm.cron" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="请求方式" ref="requsetMode" name="requsetMode">
              <a-select v-model:value="state.vm.requsetMode">
                <a-select-option :value="0">POST</a-select-option>
                <a-select-option :value="1">GET</a-select-option>
                <a-select-option :value="2">DELETE</a-select-option>
              </a-select>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="HeaderToken" ref="headerToken" name="headerToken">
              <a-input v-model:value="state.vm.headerToken" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <a-form-item label="ApiUrl" ref="apiUrl" name="apiUrl">
              <a-textarea ref v-model:value="state.vm.apiUrl" placeholder="请输入" :rows="4" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <a-form-item label="描述">
              <a-textarea v-model:value="state.vm.remark" placeholder="请输入" :rows="4" />
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>

<script setup>
import { reactive, ref, nextTick } from "vue";
import tools from "@/scripts/tools";
import service from "@/service/development_tool/timedTaskService.js";
import GenerateCron from "@/components/GenerateCron.vue";

//定义组件事件
const emits = defineEmits(["onSuccess"]);

const state = reactive({
  vm: {
    id: "",
  },
  visible: false,
  saveLoading: false,
});
const formRef = ref();

//验证规则
const rules = {
  name: [{ required: true, message: "请输入任务名称", trigger: "blur" }],
  groupName: [{ required: true, message: "请输入分组名称", trigger: "blur" }],
  cron: [{ required: true, message: "请输入定时规则", trigger: "blur" }],
  requsetMode: [{ required: true, message: "请选择请求方式", trigger: "blur" }],
  apiUrl: [{ required: true, message: "请输入请求地址", trigger: "blur" }],
};

const methods = {
  findForm() {
    state.saveLoading = true;
    service.findForm(state.vm.id).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      state.vm = res.data;
    });
  },
  saveForm() {
    if (!state.vm.cron) {
      return tools.message("请输入定时规则", "错误");
    }
    formRef.value.validate().then(() => {
      state.saveLoading = true;
      service
        .saveForm(state.vm)
        .then((res) => {
          if (res.code != 1) return;
          tools.message("操作成功!", "成功");
          emits("onSuccess", res.data);
          state.visible = false;
        })
        .finally(() => {
          state.saveLoading = false;
        });
    });
    // .catch((error) => {
    //   console.log("error", error);
    // });
  },
  //打开表单初始化
  openForm({ visible, key }) {
    state.visible = visible;
    if (visible) {
      state.vm.id = key;
      nextTick(() => {
        formRef.value.resetFields();
      });
      methods.findForm();
    }
  },
};
// 暴露函数或者属性到外部
defineExpose({ ...methods });
</script>
<style lang="less" scoped>
.ant-form-item {
  margin-bottom: 0;
}
</style>
