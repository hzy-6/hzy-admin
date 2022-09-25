<script lang="ts" setup>
import { getCurrentInstance, onMounted, reactive } from "vue";
import { getAllNameByElementPlus, getAllNameByAntd } from "@/infrastructure/scripts/icons";
import AppIcon from "./AppIcon.vue";
//定义属性
const props = defineProps<{
  name: string;
  height: number;
}>();
//定义事件
const emits = defineEmits<{
  (e: "update:name", name: string): void;
  (e: "onChangeName", name: string): void;
}>();

const state = reactive({
  active: 1,
  names: [],
  antdCount: 0,
  elementPlusCount: 0,
});

const currentInstance = getCurrentInstance();

const onClickIcon = (currentName: string) => {
  emits("update:name", currentName);
  emits("onChangeName", currentName);
};

const onClickTab = (active: number) => {
  state.active = active;
  if (active === 1) {
    state.names = getAllNameByElementPlus(currentInstance);
    state.elementPlusCount = state.names.length;
  }
  if (active === 2) {
    state.names = getAllNameByAntd(currentInstance);
    state.antdCount = state.names.length;
  }
};

onMounted(() => {
  onClickTab(state.active);
});
</script>

<template>
  <div class="app-icon-list">
    <div style="display: flex; align-items: center; justify-content: center">
      <div class="app-icon-show">
        <AppIcon :name="props.name" :size="40" color="#fff" />
      </div>
      <h4 class="ml-10">
        {{ props.name }}
      </h4>
    </div>

    <h4>更多图表请自行扩展：<a href="https://www.xicons.org/#/" target="_blank">https://www.xicons.org/#/</a></h4>

    <ul>
      <li :class="{ active: state.active === 1 }" @click="onClickTab(1)">
        ElementPlus
        <template v-if="state.elementPlusCount > 0"> （数量:{{ state.elementPlusCount }}个） </template>
      </li>
      <li :class="{ active: state.active === 2 }" @click="onClickTab(2)">
        Antd
        <template v-if="state.antdCount > 0"> （数量:{{ state.antdCount }}个） </template>
      </li>
    </ul>
    <!-- list -->
    <template v-if="props.height && props.height > 0">
      <div class="icon-list pt-15" :style="{ height: props.height + 'px' }">
        <div class="icon-list-item" v-for="item in state.names" :class="{ active: name == item }" @click="onClickIcon(item)">
          <AppIcon :name="item" :size="20" />
          <div class="ml-10">{{ item }}</div>
        </div>
      </div>
    </template>
    <template v-else>
      <div class="icon-list pt-15">
        <div class="icon-list-item" v-for="item in state.names" :class="{ active: name == item }" @click="onClickIcon(item)">
          <AppIcon :name="item" :size="20" />
          <div class="ml-10">{{ item }}</div>
        </div>
      </div>
    </template>
  </div>
</template>

<style scoped lang="less">
.app-icon-list {
  text-align: center;

  .app-icon-show {
    width: 50px;
    height: 50px;
    line-height: 50px;
    border-radius: 50%;
    background-color: #52c41a;
    display: inline-flex;
    align-items: center;
    justify-content: center;
  }
  .icon-list {
    width: auto;
    overflow: hidden;
    overflow-y: auto;

    .icon-list-item {
      overflow: hidden;
      width: 250px;
      height: 50px;
      margin-top: 0px;
      margin-left: 5px;
      margin-right: 5px;
      margin-bottom: 15px;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      border: 1px solid #ccc;
    }
    .icon-list-item:hover {
      background-color: #52c41a;
      color: #ffffff;
    }
    .active {
      background-color: #52c41a;
      color: #ffffff;
    }
  }

  ul {
    margin: 0;
    padding: 0;
    list-style: none;
    display: flex;
    li {
      height: 40px;
      line-height: 40px;
      text-align: center;
      flex: 1;
    }
    li.active {
      // background-color: #409eff;
      border-bottom: 2px solid #52c41a;
    }
    li:hover {
      cursor: pointer;
      background-color: #52c41a;
      color: #ffffff;
    }
  }
}
</style>
