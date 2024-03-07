<script setup lang="ts">
import { reactive, ref } from "vue";
import { FormInstance } from "ant-design-vue";
import { useForm } from "ant-design-vue/es/form";
import TimedTaskService from "@/services/development_tool/TimedTaskService";
import Tools from "@/core/utils/Tools";
import GenerateCron from "@/core/components/GenerateCron.vue";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

let state = reactive({
  open: false,
  loading: false,
  vm: {
    id: "",
    form: {
      // name: "",
      // groupName: "",
      // cron: "",
      // type: 1,
      // requestMode: 1,
      // jobPoint: "",
      // remark: "",
    } as any,
  },
});

//向父级导出 函数
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  openWindow: (key: string = "") => {
    state.open = true;
    state.vm.id = key;
    // 加载表单数据
    state.loading = true;
    TimedTaskService.findForm(key).then((res) => {
      state.loading = false;
      if (res.code != 200) return;
      state.vm.form = res.data;
      state.vm.form.cron = state.vm.form.cron ?? "* * * * * ? *";
    });
  },
});

//表单实例
const refForm = ref<FormInstance>();

//验证规则
const rules = {
  name: [{ required: true, message: "请输入任务名称", trigger: "blur" }],
  groupName: [{ required: true, message: "请输入分组名称", trigger: "blur" }],
  cron: [{ required: true, message: "请输入定时规则", trigger: "blur" }],
  // requsetMode: [{ required: true, message: "请选择请求方式", trigger: "blur" }],
  jobPoint: [{ required: true, message: "请输入作业点", trigger: "blur" }],
} as any;

const { validate, validateInfos } = useForm(state.vm.form, rules);

/**
 *保存数据
 */
function save() {
  validate()
    .then(async (res) => {
      state.loading = true;
      const result = await TimedTaskService.saveForm(state.vm.id, state.vm.form);
      state.loading = false;
      if (result.code != 200) return;
      Tools.message.success("操作成功!");
      props.onSuccess();
      state.open = false;
    })
    .then((res) => {
      console.log("Failed:", res);
      state.loading = false;
    });
}
</script>
<template>
  <a-drawer v-model:open="state.open" :title="state.vm.id ? '编辑' : '新建'" :footer="false" :width="800">
    <a-spin :spinning="state.loading">
      <a-form ref="refForm" layout="vertical" name="custom-validation" :model="state.vm.form" :rules="rules" class="mt-24">
        <a-form-item required label="作业名称" name="name" v-bind="validateInfos.name">
          <a-input v-model:value="state.vm.form.name" placeholder="作业名称与触发器名称默认相同" />
        </a-form-item>
        <a-form-item label="分组" required name="groupName" v-bind="validateInfos.groupName">
          <a-input v-model:value="state.vm.form.groupName" placeholder="分组名称与分组名称默认相同" />
        </a-form-item>
        <a-form-item required name="cron" v-bind="validateInfos.cron">
          <template #label> 间隔 &nbsp;&nbsp; <a href="https://qqe2.com/cron" target="_blank">Cron表达式规则生成地址</a> </template>
          <!-- <a-input v-model:value="state.vm.form.cron" placeholder=" 如10分钟执行一次：0/0 0/10 * * * ?" /> -->
          <GenerateCron v-model:value="state.vm.form.cron" />
        </a-form-item>
        <a-form-item label="任务类型" required name="type">
          <a-select ref="select" v-model:value="state.vm.form.type" placeholder="请选择请求方式">
            <a-select-option value=""> == 请选择任务类型 ==</a-select-option>
            <a-select-option :value="1">Memory 内存任务</a-select-option>
            <a-select-option :value="2">Memory 内存异步任务</a-select-option>
            <a-select-option :value="3"> Local 数据库任务 , 任务信息存储在数据库中 ， 根据 c# 命名空间 + 类名 + 方法名 作为任务名称 </a-select-option>
            <a-select-option :value="4"> LocalAsync 数据库异步任务 , 任务信息存储在数据库中 ， 根据 c# 命名空间 + 类名 + 方法名 作为任务名称 </a-select-option>
            <a-select-option :value="5">Http同步任务 - 网络http请求</a-select-option>
            <a-select-option :value="6">Http异步任务 - 网络http请求</a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item label="请求方式" required name="requestMode" v-show="state.vm.form.type === 5 || state.vm.form.type === 6">
          <a-select ref="select" v-model:value="state.vm.form.requestMode" placeholder="请选择请求方式">
            <a-select-option value="">== 请选择请求方式 ==</a-select-option>
            <a-select-option :value="0">Post</a-select-option>
            <a-select-option :value="1">Get</a-select-option>
            <a-select-option :value="2">Delete</a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item required name="jobPoint" v-bind="validateInfos.jobPoint">
          <template #label>
            执行端点 &nbsp;&nbsp;
            <span class="text-danger" v-if="state.vm.form.type === 5 || state.vm.form.type === 6">如果是Http任务请注意端点格式： http://www.baidu.com/api/v1/send-message</span>
            <span class="text-danger" v-else>如果是Local任务请注意端点格式： 命名空间地址.类名称>函数名称 [例如：App.TestClass>Run]</span>
          </template>
          <a-textarea v-model:value="state.vm.form.jobPoint" placeholder="执行端点" />
        </a-form-item>
        <a-form-item label="描述" name="remark">
          <a-textarea v-model:value="state.vm.form.remark" placeholder=" 请添加任务描述" />
        </a-form-item>
        <a-form-item class="text-center">
          <a-button type="primary" html-type="submit" @click="save">提交</a-button>
          <a-button class="ml-10" @click="() => (state.open = !state.open)">关闭</a-button>
        </a-form-item>
      </a-form>
    </a-spin>
  </a-drawer>
</template>
