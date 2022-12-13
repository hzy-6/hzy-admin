<script lang="ts" setup>
import { reactive, ref, watch } from "vue";
import { FormInstance } from "ant-design-vue";
import Tools from "@/core/utils/Tools";
import MemberService from "@/services/base/MemberService";
import AppConsts from "@/utils/AppConsts";
import WangEditor from "@/core/components/WangEditor.vue";
import FindBack from "@/core/components/FindBack.vue";
import SystemUser from "@/views/system/sys_user/Index.vue";

//定义组件事件
const props = defineProps<{ onSuccess: () => void }>();

const state = reactive({
  vm: {
    id: "",
    form: {} as any,
    sysUser: {} as any,
  },
  visible: false,
  saveLoading: false,
  findBackUserVisible: false,
});

//文件对象定义
const filePathList = ref<any[]>([]);
const photoList = ref<any[]>([]);
const photoImage = ref<string>("");
//处理头像显示图片
watch(
  () => photoList.value,
  (value) => {
    handlePhoto(value);
  }
);

//表单实例
const refForm = ref<FormInstance>();

//向父级导出 函数
defineExpose({
  /**
   * 打开表单初始化
   * @param key
   */
  open: (key: string = "") => {
    state.visible = true;
    if (state.visible) {
      state.vm.id = key;
    }
    refForm.value?.resetFields();
    //初始化表单数据
    state.saveLoading = true;
    MemberService.findForm(key).then((res) => {
      state.saveLoading = false;
      if (res.code != 1) return;
      state.vm = res.data;
      //文件处理
      filePathList.value = state.vm.form.filePath ? JSON.parse(state.vm.form.filePath) : [];
      photoList.value = state.vm.form.photo ? JSON.parse(state.vm.form.photo) : [];
      handlePhoto(photoList.value);
      handleFile(filePathList.value);
    });
  },
});

/**
 *保存数据
 */
function save() {
  refForm.value?.validate().then(async () => {
    //处理文件
    var fileArray: any[] = [];
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
    const result = await MemberService.saveForm(state.vm.id, state.vm.form);
    if (result.code != 1) return;
    Tools.message.success("操作成功!");
    props.onSuccess();
    state.visible = false;
  });
}

/**
 * 处理头像
 * @param photo
 */
function handlePhoto(photo: any[]) {
  if (photo.length > 0) {
    photoImage.value = AppConsts.domainServerApi + (photo[0].response ? photo[0].response.url : photo[0].url);
  } else {
    photoImage.value = "";
  }
}

/**
 * 处理文件
 * @param files
 */
function handleFile(files: any[]) {
  files.forEach((w) => {
    w.url = AppConsts.domainServerApi + w.url;
  });
}
</script>

<template>
  <a-modal v-model:visible="state.visible" :title="state.vm.id ? '编辑' : '新建'" centered @ok="state.visible = false" :width="1300">
    <template #footer>
      <a-button type="primary" :loading="state.saveLoading" @click="save()"> 提交</a-button>
      <a-button @click="state.visible = false">关闭</a-button>
    </template>
    <a-spin :spinning="state.saveLoading">
      <a-form ref="refForm" layout="vertical" :model="state.vm.form">
        <a-row :gutter="[16, 0]">
          <a-col :xs="24" :sm="24" :md="6" :lg="6" :xl="6">
            <a-row :gutter="[16, 0]">
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="头像">
                  <a-upload v-model:file-list="photoList" list-type="picture-card" :show-upload-list="false" :action="AppConsts.domainServerApi + '/api/upload/uploadFile'">
                    <img v-if="photoImage" :src="photoImage" alt="avatar" width="100" height="100" />
                    <div v-else class="ant-upload-text">上传</div>
                  </a-upload>
                </a-form-item>
              </a-col>
              <a-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
                <a-form-item label="文件">
                  <a-upload v-model:file-list="filePathList" :action="AppConsts.domainServerApi + '/api/upload/uploadFile'">
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
                      @findBackChange="
                        (rows) => {
                          state.vm.form.userId = rows[0].id;
                          state.vm.sysUser.name = rows[0].name;
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
              <WangEditor v-model:html="state.vm.form.introduce" :domainName="AppConsts.domainServerApi" :previewDomainName="AppConsts.domainServerApi" :height="600" />
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
</template>
