<template>
  <div>
    <a-card class="mb-15" v-show="state.search.state">
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="state.search.vm.name" placeholder="名称" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-radio-group v-model:value="state.search.vm.state">
            <a-radio :value="1"> 正常 </a-radio>
            <a-radio :value="2"> 停用 </a-radio>
          </a-radio-group>
        </a-col>
        <!--button-->
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" style="float: right">
          <a-button type="primary" class="mr-15" @click="methods.findList">查询</a-button>
          <a-button class="mr-15" @click="methods.onResetSearch">重置</a-button>
        </a-col>
      </a-row>
    </a-card>
    <a-card>
      <a-row :gutter="[15, 15]">
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
          <a-space :size="15">
            <!-- 检索 -->
            <template v-if="power.search">
              <a-button @click="state.search.state = !state.search.state">
                <template #icon>
                  <AppIcon :name="state.search.state ? 'UpOutlined' : 'DownOutlined'" />
                </template>
                检索
              </a-button>
            </template>
            <!-- 新建 -->
            <template v-if="power.insert">
              <a-button type="primary" @click="methods.openForm()">
                <template #icon>
                  <AppIcon name="PlusOutlined" />
                </template>
                新建
              </a-button>
            </template>
          </a-space>
        </a-col>
      </a-row>

      <vxe-table
        class="mt-15"
        ref="refTable"
        border
        stripe
        :data="state.data"
        :row-config="{ isCurrent: true, isHover: true }"
        :column-config="{ isCurrent: true, resizable: true }"
        :checkbox-config="{ highlight: true }"
        :tree-config="{ transform: true, rowField: 'id', parentField: 'parentId' }"
      >
        <vxe-column field="name" title="部门名称" tree-node></vxe-column>
        <vxe-column field="orderNumber" title="排序号"></vxe-column>
        <vxe-column field="levelCode" title="级别码"></vxe-column>
        <vxe-column field="state" title="状态">
          <template #default="{ row }">
            <a-tag color="success" v-if="row.state == 1">正常</a-tag>
            <a-tag color="warning" v-else>停用</a-tag>
          </template>
        </vxe-column>
        <vxe-column field="lastModificationTime" title="更新时间">
          <template #default="{ row }">
            {{ methods.formatDate(row.lastModificationTime) }}
          </template>
        </vxe-column>
        <vxe-column field="creationTime" title="创建时间">
          <template #default="{ row }">
            {{ methods.formatDate(row.creationTime) }}
          </template>
        </vxe-column>
        <vxe-column field="id" title="操作">
          <template #default="{ row }">
            <template v-if="power.insert">
              <a href="javascript:void(0)" @click="methods.openForm(null, row.id)">新建</a>
            </template>
            <a-divider type="vertical" />
            <template v-if="power.update">
              <a href="javascript:void(0)" @click="methods.openForm(row.id)">编辑</a>
            </template>
            <a-divider type="vertical" />
            <template v-if="power.delete">
              <a-popconfirm title="您确定要删除吗?" @confirm="methods.deleteList(row.id)" okText="确定" cancelText="取消">
                <a class="text-danger">删除</a>
              </a-popconfirm>
            </template>
          </template>
        </vxe-column>
      </vxe-table>
    </a-card>

    <!--表单弹层-->
    <Info ref="formRef" @onSuccess="() => methods.findList()" />
  </div>
</template>

<script>
export default { name: "system_organization" };
</script>
<script setup>
import { onMounted, reactive, ref, nextTick } from "vue";
import { useAppStore } from "@/store";
import AppIcon from "@/components/AppIcon.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";
import service from "@/service/system/organizationService";
import dayjs from "dayjs";
import router from "@/router/index";

const appStore = useAppStore();
const state = reactive({
  //检索
  search: {
    state: false,
    vm: {
      name: null,
      state: 1,
    },
  },
  loading: false,
  data: [],
});
//表单 ref 对象
const formRef = ref(null);
const refTable = ref(null);

//权限
const power = appStore.getPowerByMenuId(router.currentRoute.value.meta.menuId);

const methods = {
  //重置检索条件
  onResetSearch() {
    let searchVm = state.search.vm;
    for (let key in searchVm) {
      searchVm[key] = null;
    }
    searchVm.state = 1;
    methods.findList();
  },
  //获取列表数据
  findList() {
    state.loading = true;
    service.findList(state.search.vm).then((res) => {
      let data = res.data;
      state.loading = false;
      state.data = data;

      nextTick(() => {
        methods.setAllTreeExpand();
      });
    });
  },
  //删除数据
  deleteList(id) {
    let ids = [];
    if (id) {
      ids.push(id);
    }
    service.deleteList(ids).then((res) => {
      if (res.code != 1) return;
      tools.message("删除成功!", "成功");
      methods.findList();
    });
  },
  //打开表单页面
  openForm(id, parentId) {
    formRef.value.openForm({
      visible: true,
      key: id,
      parentId,
    });
  },
  formatDate(time) {
    return dayjs(time).format("YYYY-MM-DD");
  },
  //展开所有树状
  setAllTreeExpand() {
    refTable.value.setAllTreeExpand(true);
    //关闭所有展开
    //  refTable.value.clearTreeExpand();
  },
};

onMounted(() => {
  methods.findList();
});
</script>
