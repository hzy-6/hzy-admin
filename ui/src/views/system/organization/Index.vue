<template>
  <div class="p-24">
    <a-card class="mb-24" v-show="table.search.state">
      <a-row :gutter="[24, 24]">
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4">
          <a-input v-model:value="table.search.vm.name" placeholder="名称" />
        </a-col>
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" class="pt-10">
          <a-radio-group v-model:value="table.search.vm.state">
            <a-radio :value="1"> 正常 </a-radio>
            <a-radio :value="2"> 停用 </a-radio>
          </a-radio-group>
        </a-col>
        <!--button-->
        <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="4" style="float: right">
          <a-button type="primary" class="mr-24" @click="findList">查询</a-button>
          <a-button class="mr-24" @click="onResetSearch">重置</a-button>
        </a-col>
      </a-row>
    </a-card>
    <a-card>
      <a-row :gutter="[24, 24]">
        <a-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
          <template v-if="power.search">
            <a-button class="mr-24" @click="table.search.state = !table.search.state">
              <div v-if="table.search.state"><AppIcons name="UpOutlined" />&nbsp;&nbsp;收起</div>
              <div v-else><AppIcons name="DownOutlined" />&nbsp;&nbsp;展开</div>
            </a-button>
          </template>
          <template v-if="power.insert">
            <a-button type="primary" class="mr-24" @click="openForm()">
              <template #icon>
                <AppIcons name="PlusOutlined" />
              </template>
              新建
            </a-button>
          </template>
        </a-col>
      </a-row>

      <vxe-table
        class="mt-24"
        ref="refTable"
        size="medium"
        border
        stripe
        resizable
        :data="table.data"
        :row-config="{ isHover: true }"
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
            {{ formatDate(row.lastModificationTime) }}
          </template>
        </vxe-column>
        <vxe-column field="creationTime" title="创建时间">
          <template #default="{ row }">
            {{ formatDate(row.creationTime) }}
          </template>
        </vxe-column>
        <vxe-column field="id" title="操作">
          <template #default="{ row }">
            <template v-if="power.insert">
              <a href="javascript:void(0)" @click="openForm(null, row.id)">新建</a>
            </template>
            <a-divider type="vertical" />
            <template v-if="power.update">
              <a href="javascript:void(0)" @click="openForm(row.id)">编辑</a>
            </template>
            <a-divider type="vertical" />
            <template v-if="power.delete">
              <a-popconfirm title="您确定要删除吗?" @confirm="deleteList(row.id)" okText="确定" cancelText="取消">
                <a class="text-danger">删除</a>
              </a-popconfirm>
            </template>
          </template>
        </vxe-column>
      </vxe-table>
    </a-card>

    <!--表单弹层-->
    <Info ref="formRef" @onSuccess="() => findList()" />
  </div>
</template>
<script>
import { defineComponent, onMounted, reactive, toRefs, ref, nextTick } from "vue";
import useAppStore from "@/store/index";
import AppIcons from "@/components/AppIcons.vue";
import Info from "./Info.vue";
import tools from "@/scripts/tools";
import service from "@/service/system/organizationService";
import dayjs from "dayjs";
import router from "@/router/index";

export default defineComponent({
  name: "system_organization",
  components: { AppIcons, Info },
  setup() {
    const appStore = useAppStore();
    const state = reactive({
      table: {
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
      },
    });
    //表单 ref 对象
    const formRef = ref(null);
    const refTable = ref(null);

    //权限
    const power = appStore.getPowerByMenuId(router.currentRoute.value.meta.menuId);

    const methods = {
      //重置检索条件
      onResetSearch() {
        let searchVm = state.table.search.vm;
        for (let key in searchVm) {
          searchVm[key] = null;
        }
        searchVm.state = 1;
        methods.findList();
      },
      //获取列表数据
      findList() {
        state.table.loading = true;
        service.findList(state.table.search.vm).then((res) => {
          let data = res.data;
          state.table.loading = false;
          state.table.data = data;

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

    return {
      ...toRefs(state),
      ...methods,
      power,
      formRef,
      refTable,
    };
  },
});
</script>
