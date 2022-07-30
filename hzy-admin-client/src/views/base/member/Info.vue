<template>
  <a-modal v-model:visible="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="1300">
    <template #footer>
      <a-button type="primary" @click="methods.saveForm()" :loading="state.saveLoading">提交</a-button>
      <a-button type="danger" ghost @click="state.visible = false" class="ml-15">关闭</a-button>
    </template>
    <a-spin :spinning="state.saveLoading">
      <!-- 上传 -->
      <a-form layout="vertical" :model="state.vm.form">
        <a-row :gutter="[15, 15]">
          <a-col :xs="24" :sm="24" :md="6" :lg="6" :xl="6">
            <a-row :gutter="[15, 15]">
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="头像">
                  <a-upload v-model:file-list="photoList" list-type="picture-card" :show-upload-list="false" :action="appConsts.domainName + '/api/upload/uploadFile'">
                    <img v-if="photoImage" :src="photoImage" alt="avatar" width="120" height="120" />
                    <div v-else class="ant-upload-text">上传</div>
                  </a-upload>
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="文件">
                  <a-upload v-model:file-list="filePathList" :action="appConsts.domainName + '/api/upload/uploadFile'">
                    <a-button>
                      <upload-outlined></upload-outlined>
                      上传文件
                    </a-button>
                  </a-upload>
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="性别">
                  <a-radio-group name="radioGroup" default-value="男" v-model:value="state.vm.form.sex">
                    <a-radio value="男">男</a-radio>
                    <a-radio value="女">女</a-radio>
                  </a-radio-group>
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="编号">
                  <a-input v-model:value="state.vm.form.number" placeholder="请输入" />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="名称">
                  <a-input v-model:value="state.vm.form.name" placeholder="请输入" />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="联系电话">
                  <a-input v-model:value="state.vm.form.phone" placeholder="请输入" />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="生日">
                  <a-date-picker v-model:value="state.vm.form.birthday" valueFormat="YYYY-MM-DD" style="width: 100%" />
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
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
            </a-row>
          </a-col>

          <a-col :xs="24" :sm="24" :md="18" :lg="18" :xl="18">
            <a-form-item label="简介">
              <WangEditor v-model:html="state.vm.form.introduce" :domainName="state.domainName" :previewDomainName="state.domainName" :height="600" />
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
<script setup>
import { reactive, ref, watch } from "vue";
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
  domainName: appConsts.domainName,
  findBackUserVisible: false,
});

//文件对象定义
const filePathList = ref([]);
const photoList = ref([]);
const photoImage = ref("");
//处理头像显示图片
watch(
  () => photoList.value,
  (value) => {
    methods.handlePhoto(value);
  }
);

const methods = {
  findForm() {
    state.saveLoading = true;
    service.findForm(state.vm.id).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      state.vm = res.data;
      //文件处理
      filePathList.value = state.vm.form.filePath ? JSON.parse(state.vm.form.filePath) : [];
      photoList.value = state.vm.form.photo ? JSON.parse(state.vm.form.photo) : [];
      methods.handlePhoto(photoList.value);
      methods.handleFile(filePathList.value);
    });
  },
  saveForm() {
    //处理文件
    var fileArray = [];
    filePathList.value.forEach((w) => {
      if (w.response) {
        fileArray.push(w.response);
      } else {
        fileArray.push(w);
      }
    });
    state.vm.form.filePath = fileArray.length > 0 ? JSON.stringify(fileArray) : state.vm.form.filePath;
    //处理头像
    fileArray = [];
    photoList.value.forEach((w) => {
      if (w.response) fileArray.push(w.response);
    });
    state.vm.form.photo = fileArray.length > 0 ? JSON.stringify(fileArray) : state.vm.form.photo;
    //保存
    state.saveLoading = true;
    service.saveForm(state.vm, state.vm.id).then((res) => {
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
  handlePhoto(photo) {
    if (photo.length > 0) {
      photoImage.value = appConsts.domainName + (photo[0].response ? photo[0].response.url : photo[0].url);
    } else {
      photoImage.value = "";
    }
  },
  //处理文件
  handleFile(files) {
    files.forEach((w) => {
      w.url = appConsts.domainName + w.url;
    });
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
