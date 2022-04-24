<template>
  <div>
    <a-alert message="富文本编辑器 WangEditor" type="success">
      <template #description>
        <a target="_blank" href="https://doc.wangeditor.com/">查看示例</a>
      </template>
    </a-alert>

    <a-row :gutter="[15, 15]" class="mt-15">
      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <WangEditor el="editor" v-model:html="text" domainName="https://localhost:5601" previewDomainName="https://localhost:5601" :height="560" @initConfig="(editor) => (editor.config.zIndex = 0)" />
      </a-col>

      <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
        <a-card hoverable :bordered="false">
          <div v-html="text"></div>
        </a-card>
      </a-col>
    </a-row>
  </div>
</template>

<script>
export default { name: "EditorCom" };
</script>
<script setup>
import { ref } from "vue";
import WangEditor from "@/components/WangEditor.vue";

const text = ref("");
text.value = "测试6666！！！";
</script>

<style scoped></style>
