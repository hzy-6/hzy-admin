<script lang="ts" setup>
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import GenerateCron from "@/core/components/GenerateCron.vue";
import TimedTaskService from "@/services/development_tool/TimedTaskService";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

const state = reactive({
  vm: {
    id: "",
    form: {} as any,
  },
  visible: false,
  loading: false,
});

//验证规则
const rules = {
  name: [{ required: true, message: "请输入任务名称", trigger: "blur" }],
  groupName: [{ required: true, message: "请输入分组名称", trigger: "blur" }],
  cron: [{ required: true, message: "请输入定时规则", trigger: "blur" }],
  // requsetMode: [{ required: true, message: "请选择请求方式", trigger: "blur" }],
  jobPoint: [{ required: true, message: "请输入作业点", trigger: "blur" }],
} as any;

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
    TimedTaskService.findForm(key).then((res) => {
      state.loading = false;
      if (res.code != 1) return;
      state.vm.form = res.data;
      state.vm.form.cron = state.vm.form.cron ?? "* * * * * ? *";
    });
  },
});

/**
 *保存数据
 */
function save() {
  refForm.value?.validate().then(async () => {
    state.loading = true;
    const result = await TimedTaskService.saveForm(state.vm.id, state.vm.form);
    if (result.code != 1) return;
    Tools.message.success("操作成功!");
    props.onSuccess();
    state.visible = false;
  });
}
</script>

<template>
  <a-modal v-model:visible="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="800">
    <template #footer>
      <a-button type="primary" :loading="state.loading" @click="save()"> 提交</a-button>
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <a-spin :spinning="state.loading">
      <a-form ref="refForm" layout="vertical" :model="state.vm.form" :rules="rules">
        <a-row :gutter="[16, 0]">
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="分组" ref="groupName" name="groupName">
              <a-input v-model:value="state.vm.form.groupName" placeholder="请输入" />
            </a-form-item>
          </a-col>

          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="任务名称" ref="name" name="name">
              <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>

          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item label="任务类型" ref="type" name="type">
              <a-select v-model:value="state.vm.form.type">
                <a-select-option :value="1">WebApi</a-select-option>
                <a-select-option :value="2">Local</a-select-option>
              </a-select>
            </a-form-item>
          </a-col>

          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
            <a-form-item ref="cron" name="cron">
              <template #label> 定时规则 &nbsp; <a target="_blank" href="https://www.bejson.com/othertools/cron/">在线生成规则</a> </template>
              <GenerateCron v-model:value="state.vm.form.cron" />
            </a-form-item>
          </a-col>

          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12" v-show="state.vm.form.type==1">
            <a-form-item label="请求方式" ref="requsetMode" name="requsetMode">
              <a-select v-model:value="state.vm.form.requsetMode">
                <a-select-option :value="0">POST</a-select-option>
                <a-select-option :value="1">GET</a-select-option>
                <a-select-option :value="2">DELETE</a-select-option>
              </a-select>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <a-form-item label="jobPoint" ref="jobPoint" name="jobPoint">
              <a-textarea v-model:value="state.vm.form.jobPoint" placeholder="请输入" :rows="4" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <a-form-item label="描述">
              <a-textarea v-model:value="state.vm.form.remark" placeholder="请输入" :rows="4" />
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
