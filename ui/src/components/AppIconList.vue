<template>
  <div class="icon-list">
    <div class="icon-list-item" v-for="item in names" :class="{ active: name == item }" @click="onClickIcon(item)">
      <AppIcons :name="item" />
    </div>
  </div>
</template>

<script>
import { defineComponent } from "vue";
import { getAllAntdIconNames } from "@/scripts/antd-icons";
import AppIcons from "./AppIcons.vue";

export default defineComponent({
  name: "AppIconListCom",
  props: {
    name: String,
  },
  components: { AppIcons },
  setup(props, context) {
    var names = getAllAntdIconNames();

    const onClickIcon = (currentName) => {
      context.emit("update:name", currentName);
    };

    return {
      names,
      onClickIcon,
    };
  },
});
</script>
<style scoped lang="less">
.icon-list {
  width: auto;

  .icon-list-item {
    width: 50px;
    height: 50px;
    float: left;
    text-align: center;
    padding: 10px 0px;
    cursor: pointer;
    .anticon {
      font-size: 30px;
    }
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
</style>
