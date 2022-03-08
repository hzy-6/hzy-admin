<template>
  <div :id="el"></div>
</template>

<script>
import { defineComponent, onMounted, onUnmounted, ref, watch } from "vue";
import E from "wangeditor";

export default defineComponent({
  name: "WangEditorCom",
  props: {
    //dom 元素的 id 值
    el: {
      type: String,
      required: true,
    },
    //编辑器内容
    html: String,
    //编辑器高度
    height: Number,
    //文件上传域名
    domainName: String,
    //预览域名
    previewDomainName: String,
    //
    // initConfig: Function,
  },
  setup(props, context) {
    const editor = ref(null);
    const htmlData = ref(props.html);

    //
    watch(
      () => props.html,
      (value) => {
        htmlData.value = value;
        methods.setHtml();
      }
    );

    const methods = {
      init() {
        editor.value = new E(document.getElementById(props.el));
        // 设置编辑区域高度为 500px
        editor.value.config.height = props.height ? props.height : 350;

        // 配置 onchange 回调函数
        editor.value.config.onchange = function(newHtml) {
          context.emit("update:html", newHtml);
        };
        // 配置触发 onchange 的时间频率，默认为 200ms
        editor.value.config.onchangeTimeout = 300; // 修改为 500ms

        editor.value.config.zIndex = 0;
        methods.uploadImageConfig();

        // context.emit("init-config", editor);
        // props.initConfig(editor);
        // (editor: any): void => {}

        editor.value.create();

        methods.setHtml();
      },
      /**
       * 上传图片配置
       */
      uploadImageConfig() {
        // 配置 server 接口地址
        editor.value.config.uploadImgServer = props.domainName ? props.domainName + "/Upload/Images" : "";
        editor.value.config.uploadFileName = "editorFileImages";
        editor.value.config.uploadImgTimeout = 60 * 1000;
        editor.value.config.uploadImgHooks = {
          // 图片上传并返回了结果，想要自己把图片插入到编辑器中
          // 例如服务器端返回的不是 { errno: 0, data: [...] } 这种格式，可使用 customInsert
          customInsert: function(insertImgFn, result) {
            // result 即服务端返回的接口
            // console.log('customInsert', result)

            // insertImgFn 可把图片插入到编辑器，传入图片 src ，执行函数即可
            let data = result.data;
            for (let i = 0; i < data.length; i++) {
              let item = data[i];
              if (props.previewDomainName) {
                insertImgFn(props.previewDomainName + item);
              } else {
                insertImgFn(item);
              }
            }
          },
        };
      },
      /**
       * 设置值
       */
      setHtml() {
        if (editor.value) {
          editor.value.txt.html(htmlData.value ? htmlData.value : "");
        }
      },
      /**
       * 销毁编辑器
       */
      destroy() {
        // 销毁编辑器
        editor.value.destroy();
        editor.value = null;
        htmlData.value = null;
      },
    };

    //组件销毁后 钩子函数
    onUnmounted(() => {
      // 销毁编辑器
      methods.destroy();
    });
    //组件加载 钩子函数
    onMounted(() => {
      methods.init();
    });

    return {
      editor,
      htmlData,
    };
  },
});
</script>

<style scoped></style>
