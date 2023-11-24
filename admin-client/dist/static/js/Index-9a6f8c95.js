import{d as U,r as J,bZ as K,b as k,e as Z,f as s,o as l,l as p,w as t,a as o,u as m,j as u,B as c,c as x,aa as P,ab as q,g as M,S as G,T as B,P as H,m as Q}from"./index-5ce8de01.js";import{_ as h}from"./AppIcon.vue_vue_type_script_setup_true_lang-7672b527.js";import{M as C,_ as W}from"./Info.vue_vue_type_script_setup_true_lang-54679696.js";import{_ as X}from"./PageContainer.vue_vue_type_script_setup_true_lang-ee111854.js";import{_ as Y}from"./TableCurd.vue_vue_type_script_setup_true_lang-73963374.js";import"./WangEditor.vue_vue_type_script_setup_true_lang-6541e71a.js";import"./FindBack-242d433e.js";import"./_plugin-vue_export-helper-c27b6911.js";import"./Index.vue_vue_type_script_setup_true_lang-17f42073.js";import"./Info.vue_vue_type_script_setup_true_lang-704910bc.js";import"./SysOrganizationService-833430ab.js";import"./ColumnSetting.vue_vue_type_script_setup_true_lang-7211a558.js";import"./vue.runtime.esm-bundler-cadf8ebb.js";const ee={key:0},te={key:1},ae=["src","alt"],oe=["onClick"],re=["onClick"],ne=M("a",{class:"text-danger"},"删除",-1),ye=U({name:"base_member",__name:"Index",setup(se){const e=J({search:{state:!1,vm:{name:void 0},sort:[]},loading:!1,page:1,size:10,total:100,columns:[{fieldName:"number",title:"编号",show:!0,width:"",sorter:!0,dataIndex:"number"},{fieldName:"photo",title:"头像",show:!0,width:"",sorter:!1,dataIndex:"photo"},{fieldName:"name",title:"会员名称",show:!0,width:"",sorter:!0,dataIndex:"name"},{fieldName:"phone",title:"联系电话",show:!0,width:"",sorter:!0,dataIndex:"phone"},{fieldName:"sex",title:"性别",show:!0,width:"",sorter:!0,dataIndex:"sex"},{fieldName:"birthday",title:"生日",show:!0,width:"",sorter:!0,dataIndex:"birthday"},{fieldName:"operatorName",title:"用户名称",show:!0,width:"",sorter:!0,dataIndex:"operatorName"},{fieldName:"lastModificationTime",title:"更新时间",show:!1,width:"",sorter:!0,dataIndex:"lastModificationTime"},{fieldName:"creationTime",title:"创建时间",show:!0,width:"",sorter:!0,dataIndex:"creationTime"},{fieldName:"id",title:"操作",show:!0,width:"",sorter:!1,dataIndex:"id"}],data:[]}),d=K(),b=k(),y=k(),N=k();Z(()=>{f()});async function f(){try{e.loading=!0;const n=await C.findList(e.page,e.size,e.search.vm,e.search.sort);if(e.loading=!1,n.code!=200)return;e.page=n.data.page,e.size=n.data.size,e.total=n.data.total,e.data=n.data.dataSource}catch{e.loading=!1}}async function I(n){var v;let a=[];if(n?a.push(n):a=((v=b.value)==null?void 0:v.getSelectedRowKeys())??[],a.length==0)return B.message.error("请选择要删除的行!");try{e.loading=!0;const g=await C.deleteList(a);if(e.loading=!1,g.code!=200)return;B.message.success("删除成功!"),f()}catch{e.loading=!1}}function O(){C.exportExcel(e.search.vm,e.search.sort)}function j(n){if(n){var a=JSON.parse(n);return H.domainServerApi+(a.length>0?a[0].url:"")}}function E(n){Q.push(`/base/member/details/${n.id}/${n.name}`)}return(n,a)=>{const v=s("a-input"),g=s("a-form-item"),S=s("a-col"),_=s("a-button"),L=s("a-space"),V=s("a-row"),A=s("a-form"),$=s("a-popconfirm"),D=s("a-menu-item"),F=s("a-menu"),R=s("a-dropdown"),z=s("a-table-column"),T=s("a-divider");return l(),p(X,null,{default:t(()=>[o(Y,{ref_key:"refTableCurd",ref:b,config:e,onChange:a[7]||(a[7]=r=>{e.page=r.pagination.current??1,e.size=r.pagination.pageSize??e.size,e.search.sort=r.sorter instanceof Array?[...r.sorter]:[r.sorter],f()}),onShowSizeChange:a[8]||(a[8]=({current:r,size:i})=>{e.page=r==0?1:r,e.size=i,f()})},{search:t(()=>[m(d).search?(l(),p(A,{key:0,ref_key:"refSearchForm",ref:N,model:e.search.vm},{default:t(()=>[o(V,{gutter:[16,0]},{default:t(()=>[o(S,{xs:24,sm:12,md:8,lg:6,xl:6},{default:t(()=>[o(g,{class:"mb-0",name:"name",label:"名称"},{default:t(()=>[o(v,{value:e.search.vm.name,"onUpdate:value":a[0]||(a[0]=r=>e.search.vm.name=r),placeholder:"名称"},null,8,["value"])]),_:1})]),_:1}),o(S,{xs:24,sm:12,md:8,lg:6,xl:6,class:"text-right"},{default:t(()=>[o(L,{size:8},{default:t(()=>[o(_,{onClick:a[1]||(a[1]=r=>{var i;e.page=1,(i=N.value)==null||i.resetFields(),f()})},{default:t(()=>[u(" 重置 ")]),_:1}),o(_,{type:"primary",onClick:a[2]||(a[2]=r=>{e.page=1,f()})},{default:t(()=>[u(" 查询 ")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])):c("",!0)]),"toolbar-left":t(()=>[m(d).search?(l(),p(_,{key:0,onClick:a[3]||(a[3]=r=>e.search.state=!e.search.state)},{default:t(()=>[e.search.state?(l(),x("div",ee,[o(h,{name:"UpOutlined"}),u("  收起 ")])):(l(),x("div",te,[o(h,{name:"DownOutlined"}),u("  展开 ")]))]),_:1})):c("",!0),m(d).insert?(l(),p(_,{key:1,type:"primary",onClick:a[4]||(a[4]=()=>{var r;return(r=y.value)==null?void 0:r.open()})},{icon:t(()=>[o(h,{name:"PlusOutlined"})]),default:t(()=>[u(" 新建 ")]),_:1})):c("",!0),m(d).delete?(l(),p($,{key:2,title:"您确定要删除?",onConfirm:a[5]||(a[5]=r=>I()),okText:"确定",cancelText:"取消"},{default:t(()=>[o(_,{type:"primary",danger:""},{icon:t(()=>[o(h,{name:"DeleteOutlined"})]),default:t(()=>[u(" 批量删除 ")]),_:1})]),_:1})):c("",!0)]),"toolbar-right":t(()=>[o(R,null,{overlay:t(()=>[o(F,null,{default:t(()=>[o(D,{key:"1",onClick:a[6]||(a[6]=r=>O())},{default:t(()=>[u("导出 Excel")]),_:1})]),_:1})]),default:t(()=>[o(_,null,{default:t(()=>[u(" 更多 "),o(h,{name:"ellipsis-outlined"})]),_:1})]),_:1})]),photo:t(r=>[o(z,P(q(r)),{default:t(({record:i})=>[M("img",{src:j(i.photo),width:"35",height:"35",alt:i.name},null,8,ae)]),_:2},1040)]),id:t(r=>[m(d).update||m(d).delete?(l(),p(z,P(G({key:0},r)),{default:t(({record:i})=>[m(d).update?(l(),x("a",{key:0,href:"javascript:void(0)",onClick:w=>E(i)},"详情",8,oe)):c("",!0),o(T,{type:"vertical"}),m(d).update?(l(),x("a",{key:1,href:"javascript:;",onClick:()=>{var w;return(w=y.value)==null?void 0:w.open(i.id)}},"编辑",8,re)):c("",!0),o(T,{type:"vertical"}),m(d).delete?(l(),p($,{key:2,title:"您确定要删除?",onConfirm:w=>I(i.id),okText:"确定",cancelText:"取消"},{default:t(()=>[ne]),_:2},1032,["onConfirm"])):c("",!0)]),_:2},1040)):c("",!0)]),_:1},8,["config"]),o(W,{ref_key:"refInfo",ref:y,onSuccess:()=>f()},null,8,["onSuccess"])]),_:1})}}});export{ye as default};
