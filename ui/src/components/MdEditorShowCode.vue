<template>
  <md-editor :editorId="editorId" v-model="text" :theme="theme" previewOnly :preview-theme="previewTheme" />
</template>

<script>
import { defineComponent } from "vue";
import MdEditor from "md-editor-v3";
import "md-editor-v3/lib/style.css";

//插件 文档地址：https://imzbf.github.io/md-editor-v3/index

export default defineComponent({
  props: {
    text: String,
    editorId: String,
  },
  components: { MdEditor },
  data(props) {
    return {
      text: props.text,
      theme: "light", //dark  |  light
      //default、github、vuepress
      previewTheme: "default",
      editorId: props.editorId ? props.editorId : null,
    };
  },
});
</script>
