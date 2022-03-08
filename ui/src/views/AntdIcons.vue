<template>
  <div class="p-24">
    <div class="p-24 text-center">
      <div class="app-big-icon">
        <AppIcons :name="iconName" />
      </div>
      <h2>
        {{ iconName }}
      </h2>
    </div>
    <a-card title="Antd Icons 图标集合" :bordered="false" :headStyle="{ 'border-bottom': 0 }" hoverable>
      <template #extra>
        <a href="https://next.antdv.com/components/icon-cn" target="_black"> 官方图标</a>
      </template>
      <AppIconList v-model:name="iconName" />
    </a-card>
  </div>
</template>
<script>
import { defineComponent, reactive, toRefs } from "vue";
import AppIconList from "@/components/AppIconList.vue";
import AppIcons from "@/components/AppIcons.vue";
import { getAllAntdIconNames } from "@/scripts/antd-icons";

export default defineComponent({
  name: "AntdIconsCom",
  components: { AppIconList, AppIcons },
  setup() {
    var names = getAllAntdIconNames();

    const state = reactive({
      iconName: names[0],
    });

    return {
      ...toRefs(state),
    };
  },
});
</script>

<style lang="less" scoped>
.app-big-icon {
  font-size: 50px;
  width: 100px;
  height: 100px;
  border-radius: 50%;
  display: inline-block;
  background-color: #52c41a;
  line-height: 100px;
  text-align: center;
}
</style>
