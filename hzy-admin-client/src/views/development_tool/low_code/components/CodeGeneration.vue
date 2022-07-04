<template>
  <div>
    <a-spin :spinning="state.saveLoading">
      <div class="mb-15">
        <a-radio-group v-model:value="state.activeCode">
          <a-radio-button value="HZY.Models">实体</a-radio-button>
          <a-radio-button value="HZY.Services.Admin">服务</a-radio-button>
          <a-radio-button value="HZY.Controllers.Admin">控制器</a-radio-button>
          <a-radio-button value="Index.vue">列表页</a-radio-button>
          <a-radio-button value="Info.vue">表单页</a-radio-button>
          <a-radio-button value="Service.js">前端服务</a-radio-button>
          <a-button type="primary" @click="methods.download()" class="ml-15" :loading="state.saveLoading">
            <template #icon>
              <AppIcon name="DownloadOutlined" />
            </template>
            下载当前
          </a-button>
          <a-button type="primary" @click="methods.downloadAll()" class="ml-15" :loading="state.saveLoading">
            <template #icon>
              <AppIcon name="DownloadOutlined" />
            </template>
            下载所有
          </a-button>
        </a-radio-group>
      </div>
      <!-- 代码区域 -->
      <MdEditorShowCode v-model:text="state.code" />
    </a-spin>
  </div>
</template>
<script setup>
import { reactive, watch, computed } from "vue";
import service from "@/service/development_tool/code_generation_service";
import MdEditorShowCode from "@/components/MdEditorShowCode.vue";
import AppIcon from "@/components/AppIcon.vue";

//定义组件事件
// const emits = defineEmits(["onSuccess"]);
const props = defineProps({
  tableName: String,
});

const state = reactive({
  vm: {
    id: computed(() => props.tableName),
    form: {},
  },
  saveLoading: false,
  activeCode: "HZY.Models",
  code: "",
});

watch(
  () => state.vm.id,
  (value) => {
    methods.openForm();
  }
);

const methods = {
  //打开表单初始化
  openForm() {
    // state.vm.id = key;
    state.activeCode = "HZY.Models";
    methods.getCode((res) => {
      // state.code = "```c# \r\n" + res + " \r\n```";
      state.code = res;
    });
  },
  getCode(call) {
    state.saveLoading = true;
    service
      .getCode({
        tableName: state.vm.id,
        type: state.activeCode,
        codeText: "",
      })
      .then((res) => {
        state.saveLoading = false;
        if (call) call(res.data.code);
      });
  },

  /**
   * 下载当前
   */
  download() {
    service.download({
      tableName: state.vm.id,
      type: state.activeCode,
      codeText: "",
    });
  },

  /**
   *下载所有
   */
  downloadAll() {
    service.downloadAll({
      tableName: state.vm.id,
      type: state.activeCode,
      codeText: "",
    });
  },
};

watch(
  () => state.activeCode,
  (value) => {
    if (value == "HZY.Models") {
      methods.getCode((res) => {
        // state.code = " ```c# \r\n" + res + " \r\n``` ";
        state.code = res;
      });
    }
    if (value == "HZY.Services.Admin") {
      methods.getCode((res) => {
        // state.code = " ```c# \r\n" + res + " \r\n```";
        state.code = res;
      });
    }
    if (value == "HZY.Controllers.Admin") {
      methods.getCode((res) => {
        // state.code = " ```c# \r\n" + res + " \r\n``` ";
        state.code = res;
      });
    }
    if (value == "Index.vue") {
      methods.getCode((res) => {
        // state.code = " ```vue \r\n" + res + " \r\n``` ";
        state.code = res;
      });
    }
    if (value == "Info.vue") {
      methods.getCode((res) => {
        // state.code = " ```vue \r\n" + res + " \r\n``` ";
        state.code = res;
      });
    }
    if (value == "Service.js") {
      methods.getCode((res) => {
        // state.code = " ```js \r\n" + res + " \r\n``` ";
        state.code = res;
      });
    }
  }
);
// 暴露函数或者属性到外部
defineExpose({ ...methods });
</script>
<style lang="less" scoped>
.ant-form-item {
  margin-bottom: 0;
}
</style>

<style lang="less">
.full-modal {
  .ant-modal {
    max-width: 100%;
    top: 0;
    padding-bottom: 0;
    margin: 0;
  }
  .ant-modal-content {
    display: flex;
    flex-direction: column;
    height: calc(100vh);
  }
  .ant-modal-body {
    flex: 1;
    overflow: auto;
  }
}
</style>
