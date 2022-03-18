<template>
  <a-modal v-model:visible="visible" title="编辑" centered @ok="visible = false" :width="800">
    <template #footer>
      <a-button type="primary" :loading="saveLoading" @click="save"> 提交</a-button>
      <a-button type="primary" danger ghost @click="visible = false">关闭</a-button>
    </template>
    <a-row :gutter="[15, 15]">
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>年龄:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>年龄:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>用户名:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <h4>地址:</h4>
        <a-input v-model:value="vm.form.value" placeholder="请输入" />
      </a-col>
    </a-row>
  </a-modal>
</template>
<script>
import { defineComponent, reactive, toRefs } from "vue";
import tools from "@/scripts/tools";

export default defineComponent({
  name: "ListInfoCom",
  props: {
    onSuccess: Function,
  },
  setup(props, context) {
    const state = reactive({
      vm: {
        id: "",
        form: {
          value: "",
        },
      },
      visible: false,
      saveLoading: false,
    });

    const methods = {
      //打开表单初始化
      openForm({ visible, key }) {
        state.visible = visible;
        if (visible) {
          state.vm.id = key;
          // methods.findForm();
        }
      },
      save() {
        state.saveLoading = true;
        setTimeout(() => {
          state.saveLoading = false;
          // props.onSuccess();
          context.emit("onSuccess", 1);
          tools.message("提交成功!", "成功");
          state.visible = false;
        }, 2000);
      },
    };

    //向父级导出 函数
    context.expose({ ...methods });

    return {
      ...toRefs(state),
      ...methods,
    };
  },
});
</script>
