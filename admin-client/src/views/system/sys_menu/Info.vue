<script lang="ts" setup>
import { reactive, ref, watch } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import SysMenuService from "@/services/system/SysMenuService";
import AppIconList from "@/core/components/AppIconList.vue";
import AppIcon from "@/core/components/AppIcon.vue";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

const state = reactive({
  vm: {
    id: "",
    form: {} as any,
    allFunctions: [] as any[],
    menuFunctionList: [] as any[],
  },
  visible: false,
  loading: false,
  parentId: null as string | null,
  checkAll: false,
  indeterminate: false,
  //图标页面
  iconFormVisible: false,
});

//表单实例
const refForm = ref<FormInstance>();

/**
 * 向父级导出 函数
 */
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  open: (key: string | null = "", parentId: string = "") => {
    state.visible = true;
    if (state.visible) {
      state.vm.id = key as string;
    }
    refForm.value?.resetFields();
    state.parentId = parentId;
    //初始化表单数据
    state.loading = true;
    SysMenuService.findForm(key as string).then((res) => {
      state.loading = false;
      if (res.code != 200) return;
      state.vm = res.data;
      //如果 vm.menuFunctionList 集合为空则默认将 allFunctions 数据加入进去
      if (state.vm.menuFunctionList.length == 0 && state.vm.allFunctions.length > 0) {
        defaultRows();
      }
    });
  },
});

/**
 *保存数据
 */
function save() {
  refForm.value?.validate().then(async () => {
    //验证功能集合是否为空
    if (state.vm.form.type == 2 && state.vm.menuFunctionList.length == 0) {
      return Tools.message.warning("请设置功能模块!");
    }

    if (state.vm.form.type == 2 && state.vm.menuFunctionList.length > 0) {
      var array = state.vm.menuFunctionList;
      for (let i = 0; i < array.length; i++) {
        const element = array[i];
        if (!element.number) {
          return Tools.message.warning(`功能模块设置第${i + 1}行 请填写序号!`);
        }
        if (!element.functionCode) {
          return Tools.message.warning(`功能模块设置第${i + 1}行 请填写功能编码!`);
        }
        if (!element.functionName) {
          return Tools.message.warning(`功能模块设置第${i + 1}行 请填写功能名称!`);
        }
      }
    }

    try {
      state.loading = true;
      state.vm.form.parentId = state.parentId ?? state.vm.form.parentId;
      const result = await SysMenuService.saveForm(state.vm.id, state.vm);
      state.loading = false;
      if (result.code != 200) return;
      Tools.message.success("操作成功!");
      props.onSuccess();
      state.visible = false;
    } catch (error) {
      state.loading = false;
    }
  });
}

/**
 * 将功能列表转化为 菜单列表对象
 * @param functionRow
 */
function functionToMenuFunction(functionRow: any) {
  return { number: functionRow.number, menuId: state.vm.id ? state.vm.id : 0, functionCode: functionRow.byName, functionName: functionRow.name, remark: functionRow.remark };
}

/**
 * 默认行
 */
function defaultRows() {
  state.vm.menuFunctionList = [];
  state.vm.allFunctions.forEach((item) => {
    addRow(functionToMenuFunction(item));
  });
}

/**
 * 使用默认显示功能
 */
function defaultDisplayRows() {
  state.vm.menuFunctionList = [];
  var displays = state.vm.allFunctions.filter((w) => w.byName == "Display");
  if (displays.length > 0) {
    state.vm.menuFunctionList.push(functionToMenuFunction(displays[0]));
  }
}

/**
 * 移除行
 * @param index
 */
function removeRow(index: number) {
  var array = state.vm.menuFunctionList;
  state.vm.menuFunctionList = [];
  for (let i = 0; i < array.length; i++) {
    const element = array[i];
    if (i == index) continue;
    state.vm.menuFunctionList.push(element);
  }
}

/**
 * 添加行
 * @param row
 */
function addRow(row?: any) {
  if (row) {
    state.vm.menuFunctionList.push(row);
  } else {
    state.vm.menuFunctionList.push({ number: 0, menuId: state.vm.id ? state.vm.id : 0, functionCode: "", functionName: "", remark: "" });
    console.log(state.vm.menuFunctionList);
  }
}

/**
 * 监控选择菜单模式
 */
function onChangeMode() {
  // 如果是微前端
  if (state.vm.form.mode == 2) {
    state.vm.form.url = "core/components/layouts/LayoutIframe.vue";
    state.vm.form.moduleUrl = "http://ip:port/#/页面地址/{menuid}/{token}";
    state.vm.form.moduleUrlPro = "http://ip:port/pages/页面存放目录/index.html#/页面地址/{menuid}";
  }
}

/**
 * 监听菜单组件名称 那么自动回填路由地址
 */
function onChangeComponentName() {
  state.vm.form.router = state.vm.form.componentName ? "/" + state.vm.form.componentName : "";
}
</script>

<template>
  <a-drawer v-model:open="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="1300">
    <template #footer>
      <a-space :size="8">
        <a-button type="primary" :loading="state.loading" @click="save()"> 提交</a-button>
        <a-button @click="state.visible = false">关闭</a-button>
      </a-space>
    </template>
    <a-spin :spinning="state.loading">
      <a-form ref="refForm" layout="vertical" :model="state.vm.form">
        <a-row :gutter="[16, 0]">
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
            <a-form-item label="菜单Id">
              {{ state.vm.form.id }}
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
            <a-form-item label="选项类型">
              <a-radio-group v-model:value="state.vm.form.type">
                <a-radio :value="1">目录</a-radio>
                <a-radio :value="2">菜单</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
            <a-form-item label="模式">
              <a-radio-group v-model:value="state.vm.form.mode" @change="onChangeMode">
                <a-radio :value="1">普通</a-radio>
                <a-radio :value="2">微前端</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
            <a-form-item label="编号">
              <a-input v-model:value="state.vm.form.number" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
            <a-form-item label="菜单名称">
              <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>

          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
            <a-form-item>
              <template #label> 图标&nbsp;&nbsp;<a href="https://next.antdv.com/components/icon-cn" target="black"> AntdV 3.0 官方icon </a> </template>
              <a-input-search v-model:value="state.vm.form.icon" placeholder="请输入" @search="state.iconFormVisible = !state.iconFormVisible">
                <template #enterButton>
                  <AppIcon :name="state.vm.form.icon" v-if="state.vm.form.icon" />
                  <AppIcon name="search-outlined" v-else />
                </template>
              </a-input-search>
              <a-modal v-model:open="state.iconFormVisible" title="图标库" width="100%" wrap-class-name="full-modal" :footer="false">
                <AppIconList v-model:name="state.vm.form.icon" @onChangeName="() => (state.iconFormVisible = !state.iconFormVisible)" />
              </a-modal>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6" v-if="state.vm.form.type == 2">
            <a-form-item label="组件名称">
              <a-input v-model:value="state.vm.form.componentName" placeholder="请输入" @change="onChangeComponentName" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6" v-if="state.vm.form.type == 2">
            <a-form-item label="菜单页面物理地址">
              <a-input v-model:value="state.vm.form.url" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6" v-if="state.vm.form.type == 2">
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
          <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6" v-if="state.vm.form.type == 2">
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

          <!-- <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="所属菜单">
                  <a-tree-select
                    v-model:value="state.vm.form.parentId"
                    :dropdown-style="{ maxHeight: '400px', overflow: 'auto' }"
                    placeholder="所属菜单"
                    allow-clear
                    tree-default-expand-all
                    :tree-data="state.organizationTree"
                    :field-names="{
                      children: 'children',
                      label: 'title',
                      key: 'key',
                      value: 'key',
                    }"
                  ></a-tree-select>
                </a-form-item>
              </a-col> -->

          <a-col :xs="24" v-if="state.vm.form.type == 2">
            <a-row style="width: 100%">
              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
                <a-form-item>
                  <template #label>
                    显示状态&nbsp;&nbsp;
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

              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
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

              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
                <a-form-item label="是否缓存组件">
                  <a-radio-group v-model:value="state.vm.form.keepAlive">
                    <a-radio :value="true">是</a-radio>
                    <a-radio :value="false">否</a-radio>
                  </a-radio-group>
                </a-form-item>
              </a-col>

              <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="6">
                <a-form-item label="选项卡能否关闭">
                  <a-radio-group v-model:value="state.vm.form.close">
                    <a-radio :value="true">是</a-radio>
                    <a-radio :value="false">否</a-radio>
                  </a-radio-group>
                </a-form-item>
              </a-col>
            </a-row>
          </a-col>

          <!-- 模块地址 -->
          <a-row :gutter="[16, 0]" style="width: 100%" v-if="state.vm.form.type == 2">
            <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12" v-if="state.vm.form.type == 2 && state.vm.form.mode == 2">
              <a-form-item>
                <template #label>
                  模块地址（Dev 开发模式） &nbsp;&nbsp;
                  <a-tooltip>
                    <template #title>
                      参考模板:
                      <p>http://ip:port/#/页面地址/{menuid}/{token}</p>
                      <p>1、加入菜单id采用代码 {menuid}</p>
                      <p>2、加入token 采用代码 {token}</p>
                    </template>
                    <AppIcon name="QuestionCircleOutlined" class="text-danger" />
                  </a-tooltip>
                </template>
                <a-input v-model:value="state.vm.form.moduleUrl" placeholder="请输入" />
              </a-form-item>
            </a-col>

            <a-col :xs="24" :sm="12" :md="12" :lg="12" :xl="12" v-if="state.vm.form.type == 2 && state.vm.form.mode == 2">
              <a-form-item>
                <template #label>
                  模块地址（Pro 生产模式） &nbsp;&nbsp;
                  <a-tooltip>
                    <template #title>
                      参考模板:
                      <p>参考模板：http://ip:port/pages/页面存放目录/index.html#/页面地址/{menuid}</p>
                      <p>1、加入菜单id采用代码 {menuid}</p>
                      <p>2、加入token 采用代码 {token}</p>
                    </template>
                    <AppIcon name="QuestionCircleOutlined" class="text-danger" />
                  </a-tooltip>
                </template>
                <a-input v-model:value="state.vm.form.moduleUrlPro" placeholder="请输入" />
              </a-form-item>
            </a-col>
          </a-row>

          <a-col :xs="24">
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
                  <a-popconfirm title="确定要移除吗？" ok-text="是" cancel-text="否" @confirm="removeRow(index)">
                    <a-button type="link" danger>移除</a-button>
                  </a-popconfirm>
                </template>
              </a-table-column>
            </a-table>
            <div class="text-center p-15">
              <a-button type="primary" @click="addRow()">添加一行</a-button>
              <a-button class="ml-15" @click="defaultRows()">使用默认功能集</a-button>
              <a-button class="ml-15" @click="defaultDisplayRows()">使用显示功能</a-button>
            </div>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-drawer>
</template>
