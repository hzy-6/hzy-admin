<template>
  <a-modal v-model:visible="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="1200">
    <template #footer>
      <a-button type="primary" @click="methods.saveForm()" :loading="state.saveLoading">提交</a-button>
      <a-button type="danger" ghost @click="state.visible = false" class="ml-15">关闭</a-button>
    </template>
    <a-spin :spinning="state.saveLoading">
      <a-form layout="vertical" :model="state.vm.form">
        <a-row :gutter="[15, 15]">
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
            <a-form-item label="编号">
              <a-input v-model:value="state.vm.form.number" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
            <a-form-item label="名称">
              <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
            <a-form-item label="联系电话">
              <a-input v-model:value="state.vm.form.phone" placeholder="请输入" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
            <a-form-item label="生日">
              <a-date-picker v-model:value="state.vm.form.birthday" valueFormat="YYYY-MM-DD" style="width: 100%" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
            <a-form-item label="所属用户">
              <!-- 查找带回 -->
              <FindBack
                title="查找所属用户"
                v-model:label="state.vm.sysUser.name"
                v-model:visible="state.findBackUserVisible"
                @onClear="
                  () => {
                    state.vm.form.userId = null;
                    state.vm.sysUser.name = null;
                  }
                "
              >
                <SystemUser
                  isFindBack
                  :defaultRowIds="[state.vm.form.userId]"
                  @onChange="
                    (rows) => {
                      var row = rows[0];
                      state.vm.form.userId = row.id;
                      state.vm.sysUser.name = row.name;
                      state.findBackUserVisible = false;
                    }
                  "
                />
              </FindBack>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
            <a-form-item label="性别">
              <a-radio-group name="radioGroup" default-value="男" v-model:value="state.vm.form.sex">
                <a-radio value="男">男</a-radio>
                <a-radio value="女">女</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="8" :xl="8">
            <a-form-item label="头像">
              <div>
                <input type="file" @change="methods.handlePhoto" />
              </div>
              <a-avatar shape="square" v-if="state.vm.form.photo" :size="100" :src="state.vm.form.photo" />
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="12" :md="12" :lg="8" :xl="8">
            <a-form-item label="文件">
              <input type="file" @change="methods.handleFiles" multiple="multiple" />
              <ul v-if="state.vm.form.filePath">
                <li v-for="(item, index) in state.vm.form.filePath.split(',')" :key="index">
                  <a v-if="state.vm.id" :href="state.domainName + item" target="_blank">{{ item }}</a>
                  <a v-else href="javascript:void(0);">{{ item }}</a>
                </li>
              </ul>
            </a-form-item>
          </a-col>
          <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <a-form-item label="简介">
              <WangEditor v-model:html="state.vm.form.introduce" :domainName="state.domainName" :previewDomainName="state.domainName" :height="400" />
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
<script setup>
import { reactive } from "vue";
import tools from "@/scripts/tools";
import service from "@/service/base/memberService";
import WangEditor from "@/components/WangEditor.vue";
import appConsts from "@/scripts/app-consts";
// import dayjs from 'dayjs';
//
// const dateFormat = 'YYYY-MM-DD';
import FindBack from "@/components/FindBack.vue";
import SystemUser from "@/views/system/user/Index.vue";

//定义组件事件
const emits = defineEmits(["onSuccess"]);

const state = reactive({
  vm: {
    id: "",
    form: {},
    sysUser: {},
  },
  visible: false,
  saveLoading: false,
  photoObject: null,
  filesObject: [],
  domainName: appConsts.domainName,
  findBackUserVisible: false,
});

const methods = {
  findForm() {
    state.saveLoading = true;
    service.findForm(state.vm.id).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      state.vm = res.data;
      state.vm.form.photo = state.domainName + state.vm.form.photo;
    });
  },
  saveForm() {
    //组装数据
    let formData = new FormData();
    for (let key in state.vm.form) {
      let value = state.vm.form[key];
      if (!value) continue;
      formData.append(key, value);
    }

    if (state.photoObject) formData.append("Photo", state.photoObject);

    for (let i = 0; i < state.filesObject.length; i++) {
      let item = state.filesObject[i];
      formData.append("Files[" + i + "]", item);
    }

    state.saveLoading = true;
    service.saveForm(formData).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      tools.message("操作成功!", "成功");
      emits("onSuccess", res.data);
      state.visible = false;
    });
  },
  //打开表单初始化
  openForm({ visible, key }) {
    state.visible = visible;
    if (visible) {
      state.vm.id = key;
      methods.findForm();
    }
  },
  //处理头像
  handlePhoto(e) {
    let target = e.target;
    if (target.files.length == 0) return;
    state.photoObject = target.files[0];
    state.vm.form.photo = tools.getObjectUrl(state.photoObject);
  },
  //处理多文件
  handleFiles(e) {
    let target = e.target;
    if (target.files.length == 0) return;
    let arrString = [];
    for (let i = 0; i < target.files.length; i++) {
      let item = target.files[i];
      arrString.push(item.name);
    }
    state.vm.form.filePath = arrString.join(",");
    state.filesObject = target.files;
  },
};
// 暴露函数或者属性到外部
defineExpose({ ...methods });
</script>
<style lang="less" scoped>
.ant-form-item {
  margin-bottom: 0;
}
</style>
