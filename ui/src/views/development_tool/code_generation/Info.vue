<template>
  <a-modal v-model:visible="visible" title="查看代码" centered @ok="visible = false" width="70%" wrap-class-name="full-modal">
    <template #footer>
      <a-button type="primary" @click="download()" class="ml-15" :loading="saveLoading">
        <template #icon>
          <AppIcon name="DownloadOutlined" />
        </template>
        下载当前
      </a-button>
      <a-button type="primary" @click="downloadAll()" class="ml-15" :loading="saveLoading">
        <template #icon>
          <AppIcon name="DownloadOutlined" />
        </template>
        下载所有
      </a-button>
      <a-button type="danger" ghost @click="visible = false" class="ml-15">关闭</a-button>
    </template>
    <a-spin :spinning="saveLoading">
      <div class="mb-15">
        <a-radio-group v-model:value="activeCode">
          <a-radio-button value="HZY.Models">HZY.Models</a-radio-button>
          <a-radio-button value="HZY.Repository">HZY.Repository</a-radio-button>
          <a-radio-button value="HZY.Services.Admin">HZY.Services.Admin</a-radio-button>
          <a-radio-button value="HZY.Controllers.Admin">HZY.Controllers.Admin</a-radio-button>
          <a-radio-button value="Index.vue">Index.vue</a-radio-button>
          <a-radio-button value="Info.vue">Info.vue</a-radio-button>
          <a-radio-button value="Service.js">Service.js</a-radio-button>
        </a-radio-group>
      </div>

      <MdEditorShowCode v-model:text="code" />
    </a-spin>
  </a-modal>
</template>
<script>
import { defineComponent, reactive, toRefs, watch } from "vue";
import service from "@/service/development_tool/code_generation_service";
import MdEditorShowCode from "@/components/MdEditorShowCode.vue";
import AppIcon from "@/components/AppIcon.vue";

export default defineComponent({
  name: "code_generation_info",
  props: {
    onSuccess: Function,
  },
  components: { MdEditorShowCode, AppIcon },
  setup(props, context) {
    const state = reactive({
      vm: {
        id: "",
        form: {},
      },
      visible: false,
      saveLoading: false,
      activeCode: "HZY.Models",
      code: "",
    });

    const methods = {
      //打开表单初始化
      openForm({ visible, key }) {
        state.visible = visible;
        if (visible) {
          state.vm.id = key;
          state.activeCode = "HZY.Models";
          methods.getCode((res) => {
            state.code = "```c# \r\n" + res + " \r\n```";
          });
        }
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
            state.code = " ```c# \r\n" + res + " \r\n``` ";
          });
        }
        if (value == "HZY.Repository") {
          methods.getCode((res) => {
            state.code = " ```c# \r\n" + res + " \r\n``` ";
          });
        }
        if (value == "HZY.Services.Admin") {
          methods.getCode((res) => {
            state.code = " ```c# \r\n" + res + " \r\n```";
          });
        }
        if (value == "HZY.Controllers.Admin") {
          methods.getCode((res) => {
            state.code = " ```c# \r\n" + res + " \r\n``` ";
          });
        }
        if (value == "Index.vue") {
          methods.getCode((res) => {
            state.code = " ```vue \r\n" + res + " \r\n``` ";
          });
        }
        if (value == "Info.vue") {
          methods.getCode((res) => {
            state.code = " ```vue \r\n" + res + " \r\n``` ";
          });
        }
        if (value == "Service.js") {
          methods.getCode((res) => {
            state.code = " ```js \r\n" + res + " \r\n``` ";
          });
        }
      }
    );

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
