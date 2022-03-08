<template>
  <a-modal v-model:visible="visible" title="详情" centered @ok="visible = false" width="70%">
    <template #footer>
      <a-button type="danger" ghost @click="visible = false" class="ml-24">关闭</a-button>
    </template>
    <a-spin :spinning="saveLoading">
      <a-row :gutter="[24, 24]">
        <a-descriptions bordered class="text-Center w100">
          <!-- :column="{ xxl: 3, xl: 3, lg: 3, md: 3, sm: 1, xs: 1 }" -->
          <a-descriptions-item label="请求接口" style="width: 150px" span="3">
            {{ vm.form.api }}
          </a-descriptions-item>
          <a-descriptions-item label="请求ip" style="width: 150px">
            {{ vm.form.ip }}
          </a-descriptions-item>

          <a-descriptions-item label="浏览器">
            {{ vm.form.browser }}
          </a-descriptions-item>
          <a-descriptions-item label="操作系统">
            {{ vm.form.os }}
          </a-descriptions-item>
          <a-descriptions-item label="操作人">
            {{ vm.use.name }}
          </a-descriptions-item>
          <a-descriptions-item label="操作人账号">
            {{ vm.use.loginName }}
          </a-descriptions-item>
          <a-descriptions-item label="请求所耗时间"> {{ vm.form.takeUpTime }}(毫秒) </a-descriptions-item>
          <a-descriptions-item label="访问时间" style="width: 150px" span="3">
            {{ vm.form.createTime }}
          </a-descriptions-item>

          <a-descriptions-item label="请求体" :span="3">
            {{ vm.form.formBody }}
          </a-descriptions-item>
          <a-descriptions-item label="请求表单" :span="3">
            {{ vm.form.form }}
          </a-descriptions-item>
          <a-descriptions-item label="地址栏参数" :span="3">
            {{ vm.form.queryString }}
          </a-descriptions-item>
        </a-descriptions>
      </a-row>
    </a-spin>
  </a-modal>
</template>
<script>
import { defineComponent, reactive, toRefs } from "vue";
import service from "@/service/system/sys_operation_log_serivce";

export default defineComponent({
  name: "sys_operation_log_info",
  props: {
    onSuccess: Function,
  },
  setup(props, context) {
    const state = reactive({
      vm: {
        id: "",
        form: {},
        use: {},
      },
      visible: false,
      saveLoading: false,
    });

    const methods = {
      findForm() {
        state.saveLoading = true;
        service.findForm(state.vm.id).then((res) => {
          state.saveLoading = false;
          if (res.code != 1) return;
          state.vm = res.data;
        });
      },
      //打开表单初始化
      openForm({ visible, key }) {
        state.visible = visible;
        if (visible) {
          state.vm.id = key;
          methods.findForm();
        }
      },
    };

    context.expose({ ...methods });

    return {
      ...toRefs(state),
      ...methods,
    };
  },
});
</script>

<style lang="less" scoped>
.ant-form-item {
  margin-bottom: 0;
}
</style>
