<template>
  <a-modal v-model:visible="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" width="1000px" :bodyStyle="{ overflowY: 'auto', height: 'calc(100vh - 150px)' }">
    <template #footer>
      <a-button type="primary" @click="methods.saveForm()" :loading="state.saveLoading">提交</a-button>
      <a-button type="danger" ghost @click="state.visible = false" class="ml-15">关闭</a-button>
    </template>
    <a-spin :spinning="state.saveLoading">
      <a-tabs v-model:activeKey="state.activeKey">
        <a-tab-pane key="1" tab="基础数据设置">
          <a-form layout="vertical" :model="state.vm.form">
            <a-row :gutter="[15, 15]">
              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
                <a-form-item label="选项类型">
                  <a-radio-group v-model:value="state.vm.form.type">
                    <a-radio :value="1">目录</a-radio>
                    <a-radio :value="2">菜单</a-radio>
                  </a-radio-group>
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
                <a-form-item label="菜单Id">
                  <a-input v-model:value="state.vm.form.id" placeholder="请输入" readonly />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
                <a-form-item label="编号">
                  <a-input v-model:value="state.vm.form.number" placeholder="请输入" />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
                <a-form-item label="菜单名称">
                  <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12" v-if="state.vm.form.type == 2">
                <a-form-item label="组件名称">
                  <a-input v-model:value="state.vm.form.componentName" placeholder="请输入" />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12" v-if="state.vm.form.type == 2">
                <a-form-item label="菜单页面物理地址">
                  <a-input v-model:value="state.vm.form.url" placeholder="请输入" />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12" v-if="state.vm.form.type == 2">
                <a-form-item>
                  <template #label>
                    菜单路由 &nbsp;&nbsp;
                    <a-tooltip>
                      <template #title>跳转外部地址使用此表达式：/external/jump/:path(.*) 。并且要在跳转地址填上外部网址</template>
                      <AppIcon name="QuestionCircleOutlined" class="text-danger" />
                    </a-tooltip>
                  </template>
                  <a-input v-model:value="state.vm.form.router" placeholder="请输入" />
                </a-form-item>
              </a-col>

              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12" v-if="state.vm.form.type == 2">
                <a-form-item>
                  <template #label>
                    跳转地址 &nbsp;&nbsp;
                    <a-tooltip>
                      <template #title>跳转地址（不填默认使用 菜单路由地址）支持 http、https</template>
                      <AppIcon name="QuestionCircleOutlined" class="text-danger" />
                    </a-tooltip>
                  </template>
                  <a-input v-model:value="state.vm.form.jumpUrl" placeholder="请输入" />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
                <a-form-item>
                  <template #label>
                    <a href="https://next.antdv.com/components/icon-cn" target="black"> 图标（请使用AntdV 3.0 官方icon） </a>
                  </template>

                  <a-input-search v-model:value="state.vm.form.icon" placeholder="请输入" @search="state.iconFormcVisible = !state.iconFormcVisible">
                    <template #enterButton>
                      <AppIcon :name="state.vm.form.icon" />
                    </template>
                  </a-input-search>

                  <a-modal v-model:visible="state.iconFormcVisible" title="图标库" width="100%" wrap-class-name="full-modal" :footer="false">
                    <AppIconList v-model:name="state.vm.form.icon" @onChangeName="() => (state.iconFormcVisible = !state.iconFormcVisible)" />
                  </a-modal>
                </a-form-item>
              </a-col>

              <a-col :xs="24" v-if="state.vm.form.type == 2">
                <a-row style="width: 100%">
                  <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
                    <a-form-item>
                      <template #label>
                        显示状态&nbsp;<span class="text-danger">隐藏后此菜单就变成了路由</span>&nbsp;
                        <a-tooltip>
                          <template #title> 隐藏后菜单不会显示在左侧显示，但是路由会自动添加到程序中 </template>
                          <AppIcon name="QuestionCircleOutlined" class="text-danger" />
                        </a-tooltip>
                      </template>
                      <a-radio-group v-model:value="state.vm.form.show">
                        <a-radio :value="true">显示</a-radio>
                        <a-radio :value="false">隐藏</a-radio>
                      </a-radio-group>
                    </a-form-item>
                  </a-col>

                  <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
                    <a-form-item>
                      <template #label>
                        菜单状态 &nbsp;&nbsp;
                        <a-tooltip>
                          <template #title>停用后菜单不会显示在左侧显示，并且路由也不会自动添加到程序中</template>
                          <AppIcon name="QuestionCircleOutlined" class="text-danger" />
                        </a-tooltip>
                      </template>
                      <a-radio-group v-model:value="state.vm.form.state">
                        <a-radio :value="true">正常</a-radio>
                        <a-radio :value="false">停用</a-radio>
                      </a-radio-group>
                    </a-form-item>
                  </a-col>

                  <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
                    <a-form-item label="是否缓存组件">
                      <a-radio-group v-model:value="state.vm.form.keepAlive">
                        <a-radio :value="true">是</a-radio>
                        <a-radio :value="false">否</a-radio>
                      </a-radio-group>
                    </a-form-item>
                  </a-col>

                  <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12">
                    <a-form-item label="选项卡能否关闭">
                      <a-radio-group v-model:value="state.vm.form.close">
                        <a-radio :value="true">是</a-radio>
                        <a-radio :value="false">否</a-radio>
                      </a-radio-group>
                    </a-form-item>
                  </a-col>
                </a-row>
              </a-col>
            </a-row>
          </a-form>
        </a-tab-pane>
        <!-- 选项卡二 -->
        <a-tab-pane key="2" tab="功能模块设置" force-render v-if="state.vm.form.type == 2">
          <a-table :data-source="state.vm.menuFunctionList" size="small" :pagination="false">
            <a-table-column key="index" title="索引">
              <template #default="{ index }">
                {{ index + 1 }}
              </template>
            </a-table-column>
            <a-table-column key="number" title="序号" data-index="number">
              <template #default="{ record }">
                <a-input-number v-model:value="record.number" :min="1" :max="500" />
              </template>
            </a-table-column>
            <a-table-column key="functionCode" title="功能编码" data-index="functionCode">
              <template #default="{ record }">
                <a-input v-model:value="record.functionCode" placeholder="功能编码" />
              </template>
            </a-table-column>
            <a-table-column key="functionName" title="功能名称" data-index="functionName">
              <template #default="{ record }">
                <a-input v-model:value="record.functionName" placeholder="功能编码" />
              </template>
            </a-table-column>
            <a-table-column key="remark" title="备注" data-index="remark">
              <template #default="{ record }">
                <a-input v-model:value="record.remark" placeholder="功能编码" />
              </template>
            </a-table-column>
            <a-table-column key="action" title="操作">
              <template #default="{ index }">
                <a-popconfirm title="确定要移除吗？" ok-text="是" cancel-text="否" @confirm="methods.removeRow(index)">
                  <a-button type="link" danger>移除</a-button>
                </a-popconfirm>
              </template>
            </a-table-column>
          </a-table>
          <div class="text-center p-15">
            <a-button type="primary" @click="methods.addRow()">添加一行</a-button>
            <a-button class="ml-15" @click="methods.defaultRows">使用默认功能集</a-button>
            <a-button class="ml-15" @click="methods.defaultDisplayRows">使用显示功能</a-button>
          </div>
        </a-tab-pane>
      </a-tabs>
    </a-spin>
  </a-modal>
</template>
<script setup>
import { reactive, watch, ref } from "vue";
import tools from "@/scripts/tools";
import service from "@/service/system/menuService";
import AppIcon from "@/components/AppIcon.vue";
import AppIconList from "@/components/AppIconList.vue";

//定义组件事件
const emits = defineEmits(["onSuccess"]);

const state = reactive({
  vm: {
    id: "",
    form: {},
    allFunctions: [],
    menuFunctionList: [],
  },
  visible: false,
  saveLoading: false,
  parentId: null,
  checkAll: false,
  indeterminate: false,
  //选项卡
  activeKey: ref("1"),
  //图标页面
  iconFormcVisible: false,
});

const methods = {
  findForm() {
    state.saveLoading = true;
    service.findForm(state.vm.id).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      state.vm = res.data;

      //如果 vm.menuFunctionList 集合为空则默认将 allFunctions 数据加入进去
      // if (state.vm.menuFunctionList.length == 0 && state.vm.allFunctions.length > 0) {
      //   methods.defaultRows();
      // }
    });
  },
  saveForm() {
    //验证功能集合是否为空
    if (state.vm.form.type == 2 && state.vm.menuFunctionList.length == 0) {
      return tools.message("请设置功能模块!", "警告");
    }

    if (state.vm.form.type == 2 && state.vm.menuFunctionList.length > 0) {
      var array = state.vm.menuFunctionList;
      for (let i = 0; i < array.length; i++) {
        const element = array[i];
        if (!element.number) {
          return tools.message(`功能模块设置第${i + 1}行 请填写序号!`, "警告");
        }
        if (!element.functionCode) {
          return tools.message(`功能模块设置第${i + 1}行 请填写功能编码!`, "警告");
        }
        if (!element.functionName) {
          return tools.message(`功能模块设置第${i + 1}行 请填写功能名称!`, "警告");
        }
      }
    }

    state.saveLoading = true;
    state.vm.form.parentId = state.parentId ? state.parentId : null;
    service.saveForm(state.vm).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      tools.message("操作成功!", "成功");
      emits("onSuccess", res.data);
      state.visible = false;
    });
  },
  //打开表单初始化
  openForm({ visible, key, parentId }) {
    state.visible = visible;
    if (visible) {
      state.vm.id = key;
      state.parentId = parentId;
      methods.findForm();
    }
  },
  //全选/全不选
  onCheckAllChange(e) {
    if (e.target.checked) {
      state.vm.functionIds = state.vm.allFunctions.map((w) => w.id);
    } else {
      state.vm.functionIds = [];
    }
  },
  //将功能列表转化为 菜单列表对象
  functionToMenuFunction(functionRow) {
    return { number: functionRow.number, menuId: state.vm.id ? state.vm.id : 0, functionCode: functionRow.byName, functionName: functionRow.name, remark: functionRow.remark };
  },
  //默认行
  defaultRows() {
    state.vm.menuFunctionList = [];
    state.vm.allFunctions.forEach((item) => {
      methods.addRow(methods.functionToMenuFunction(item));
    });
  },
  //使用默认显示功能
  defaultDisplayRows() {
    state.vm.menuFunctionList = [];
    var displays = state.vm.allFunctions.filter((w) => w.byName == "Display");
    if (displays.length > 0) {
      state.vm.menuFunctionList.push(methods.functionToMenuFunction(displays[0]));
    }
  },
  //移除行
  removeRow(index) {
    var array = state.vm.menuFunctionList;
    state.vm.menuFunctionList = [];
    for (let i = 0; i < array.length; i++) {
      const element = array[i];
      if (i == index) continue;
      state.vm.menuFunctionList.push(element);
    }
  },
  //添加行
  addRow(row) {
    if (row) {
      state.vm.menuFunctionList.push(row);
    } else {
      state.vm.menuFunctionList.push({ number: 0, menuId: state.vm.id ? state.vm.id : 0, functionCode: "", functionName: "", remark: "" });
      console.log(state.vm.menuFunctionList);
    }
  },
};

//全选/全不选
watch(
  () => state.vm.functionIds,
  (val) => {
    state.indeterminate = !!val.length && val.length < state.vm.allFunctions.length;
    state.checkAll = val.length === state.vm.allFunctions.length;
  }
);
// 暴露函数或者属性到外部
defineExpose({ ...methods });
</script>
<style lang="less">
.ant-form-item {
  margin-bottom: 0;
}

.full-modal {
  .ant-modal {
    max-width: 100%;
    top: 0 !important;
    padding-bottom: 0;
    margin: 0;
  }
  .ant-modal-content {
    display: flex;
    flex-direction: column;
    // height: calc(100vh);
  }
  .ant-modal-body {
    flex: 1;
  }
}
</style>
