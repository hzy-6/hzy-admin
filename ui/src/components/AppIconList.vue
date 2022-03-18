<template>
  <div class="app-icon-list">
    <div style="display: flex; align-items: center; justify-content: center">
      <div class="app-icon-show">
        <AppIcon :name="$props.name" :size="40" color="#fff" />
      </div>
      <h4 class="ml-10">
        {{ $props.name }}
      </h4>
    </div>

    <ul>
      <li :class="{ active: active === 1 }" @click="onClickTab(1)">
        Antd
        <template v-if="antdCount > 0"> （数量:{{ antdCount }}个） </template>
      </li>
      <li :class="{ active: active === 2 }" @click="onClickTab(2)">
        Ionicons5
        <template v-if="ionicons5Count > 0"> （数量:{{ ionicons5Count }}个） </template>
      </li>
    </ul>
    <!-- list -->
    <template v-if="$props.height > 0">
      <div class="icon-list pt-15" :style="{ height: $props.height + 'px' }">
        <div class="icon-list-item" v-for="item in names" :class="{ active: name == item }" @click="onClickIcon(item)">
          <AppIcon :name="item" :size="20" />
          <div class="ml-10">{{ item }}</div>
        </div>
      </div>
    </template>
    <template v-else>
      <div class="icon-list pt-15">
        <div class="icon-list-item" v-for="item in names" :class="{ active: name == item }" @click="onClickIcon(item)">
          <AppIcon :name="item" :size="20" />
          <div class="ml-10">{{ item }}</div>
        </div>
      </div>
    </template>
  </div>
</template>

<script lang="ts">
import { defineComponent, getCurrentInstance, onMounted, reactive, toRefs } from "vue";
import { getAllNameByAntd, getAllNameByIonicons5 } from "@/scripts/icons";
import AppIcon from "./AppIcon.vue";

export default defineComponent({
  name: "AppIconListCom",
  props: {
    name: String,
    height: Number,
    onChangeName: Function,
  },
  components: { AppIcon },
  setup(props, context) {
    const state = reactive({
      active: 1,
      names: [],
      antdCount: 0,
      ionicons5Count: 0,
    });

    const currentInstance = getCurrentInstance();

    const onClickIcon = (currentName) => {
      context.emit("update:name", currentName);
      context.emit("onChangeName", currentName);
    };

    const onClickTab = (active) => {
      state.active = active;
      if (active === 1) {
        state.names = getAllNameByAntd(currentInstance);
        state.antdCount = state.names.length;
      }
      if (active === 2) {
        state.names = getAllNameByIonicons5(currentInstance);
        state.ionicons5Count = state.names.length;
      }
    };

    onMounted(() => {
      onClickTab(state.active);
    });

    return {
      ...toRefs(state),
      onClickIcon,
      onClickTab,
    };
  },
});
</script>
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
