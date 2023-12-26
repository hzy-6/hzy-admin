import{d as Z,r as q,bZ as G,b as h,e as H,f as l,o as r,l as u,w as e,a,u as k,j as i,B as d,c as S,aa as b,ab as $,g as I,T as E}from"./index-cV5RpzD5.js";import{_ as x}from"./AppIcon.vue_vue_type_script_setup_true_lang-Fnoq4ehk.js";import{S as z,_ as J}from"./Info.vue_vue_type_script_setup_true_lang-KegB71PN.js";import{_ as Q}from"./PageContainer.vue_vue_type_script_setup_true_lang-lZgQDTDD.js";import{_ as W}from"./TableCurd.vue_vue_type_script_setup_true_lang-as1p4H5Y.js";import{_ as X}from"./DataAuthority.vue_vue_type_script_setup_true_lang-Q-um6Ciq.js";import{_ as Y}from"./FunctionAuthority.vue_vue_type_script_setup_true_lang-Fd2NUHrI.js";import"./ColumnSetting.vue_vue_type_script_setup_true_lang-JcEmfVZ2.js";import"./SysOrganizationService-MU-JS69j.js";const ee={key:0},te={key:1},ae=["onClick"],oe=I("a",{class:"text-danger"},"删除",-1),se=["onClick"],ne=["onClick"],ke=Z({name:"system_role",__name:"Index",setup(re){const t=q({search:{state:!1,vm:{name:void 0,loginName:void 0},sort:[]},loading:!1,page:1,size:10,total:100,columns:[{fieldName:"number",title:"编号",show:!0,width:"",sorter:!0,dataIndex:"number"},{fieldName:"name",title:"角色名称",show:!0,width:"",sorter:!0,dataIndex:"name"},{fieldName:"deleteLock",title:"删除锁定",show:!0,width:"",sorter:!0,dataIndex:"deleteLock"},{fieldName:"permissionType",title:"数据权限",show:!0,width:"",sorter:!0,dataIndex:"permissionType"},{fieldName:"remark",title:"备注",show:!0,width:"",sorter:!1,dataIndex:"remark"},{fieldName:"lastModificationTime",title:"更新时间",show:!0,width:"",sorter:!0,dataIndex:"lastModificationTime"},{fieldName:"creationTime",title:"创建时间",show:!0,width:"",sorter:!0,dataIndex:"creationTime"},{fieldName:"id",title:"操作",show:!0,width:"",sorter:!1,dataIndex:"id"}],data:[]}),p=G(),L=h(),w=h(),A=h(),B=h(),F=h();H(()=>{m()});async function m(){try{t.loading=!0;const c=await z.findList(t.page,t.size,t.search.vm,t.search.sort);if(t.loading=!1,c.code!=200)return;t.page=c.data.page,t.size=c.data.size,t.total=c.data.total,t.data=c.data.dataSource}catch{t.loading=!1}}async function j(c){var v;let s=[];if(c?s.push(c):s=((v=L.value)==null?void 0:v.getSelectedRowKeys())??[],s.length==0)return E.message.error("请选择要删除的行!");try{t.loading=!0;const g=await z.deleteList(s);if(t.loading=!1,g.code!=200)return;E.message.success("删除成功!"),m()}catch{t.loading=!1}}function O(){z.exportExcel(t.search.vm,t.search.sort)}return(c,s)=>{const v=l("a-input"),g=l("a-form-item"),C=l("a-col"),y=l("a-button"),U=l("a-space"),V=l("a-row"),M=l("a-form"),D=l("a-popconfirm"),P=l("a-menu-item"),R=l("a-menu"),K=l("a-dropdown"),_=l("a-tag"),T=l("a-table-column"),N=l("a-divider");return r(),u(Q,null,{default:e(()=>[a(W,{ref_key:"refTableCurd",ref:L,config:t,"onUpdate:config":s[8]||(s[8]=o=>t=o),onChange:s[9]||(s[9]=o=>{t.page=o.pagination.current??1,t.size=o.pagination.pageSize??t.size,t.search.sort=o.sorter instanceof Array?[...o.sorter]:[o.sorter],m()}),onShowSizeChange:s[10]||(s[10]=({current:o,size:n})=>{t.page=o==0?1:o,t.size=n,m()})},{search:e(()=>[k(p).search?(r(),u(M,{key:0,ref_key:"refSearchForm",ref:A,model:t.search.vm},{default:e(()=>[a(V,{gutter:[16,0]},{default:e(()=>[a(C,{xs:24,sm:12,md:8,lg:6,xl:6},{default:e(()=>[a(g,{class:"mb-0",name:"name",label:"真实姓名"},{default:e(()=>[a(v,{value:t.search.vm.name,"onUpdate:value":s[0]||(s[0]=o=>t.search.vm.name=o),placeholder:"真实名称"},null,8,["value"])]),_:1})]),_:1}),a(C,{xs:24,sm:12,md:8,lg:6,xl:6},{default:e(()=>[a(g,{class:"mb-0",name:"loginName",label:"账户名称"},{default:e(()=>[a(v,{value:t.search.vm.loginName,"onUpdate:value":s[1]||(s[1]=o=>t.search.vm.loginName=o),placeholder:"账户名称"},null,8,["value"])]),_:1})]),_:1}),a(C,{xs:24,sm:12,md:8,lg:6,xl:6,class:"text-right"},{default:e(()=>[a(U,{size:8},{default:e(()=>[a(y,{onClick:s[2]||(s[2]=o=>{var n;t.page=1,(n=A.value)==null||n.resetFields(),m()})},{default:e(()=>[i(" 重置 ")]),_:1}),a(y,{type:"primary",onClick:s[3]||(s[3]=o=>{t.page=1,m()})},{default:e(()=>[i(" 查询 ")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])):d("",!0)]),"toolbar-left":e(()=>[k(p).search?(r(),u(y,{key:0,onClick:s[4]||(s[4]=o=>t.search.state=!t.search.state)},{default:e(()=>[t.search.state?(r(),S("div",ee,[a(x,{name:"UpOutlined"}),i("  收起 ")])):(r(),S("div",te,[a(x,{name:"DownOutlined"}),i("  展开 ")]))]),_:1})):d("",!0),k(p).insert?(r(),u(y,{key:1,type:"primary",onClick:s[5]||(s[5]=()=>{var o;return(o=w.value)==null?void 0:o.open()})},{icon:e(()=>[a(x,{name:"PlusOutlined"})]),default:e(()=>[i(" 新建 ")]),_:1})):d("",!0),k(p).delete?(r(),u(D,{key:2,title:"您确定要删除?",onConfirm:s[6]||(s[6]=o=>j()),okText:"确定",cancelText:"取消"},{default:e(()=>[a(y,{type:"primary",danger:""},{icon:e(()=>[a(x,{name:"DeleteOutlined"})]),default:e(()=>[i(" 批量删除 ")]),_:1})]),_:1})):d("",!0)]),"toolbar-right":e(()=>[a(K,null,{overlay:e(()=>[a(R,null,{default:e(()=>[a(P,{key:"1",onClick:s[7]||(s[7]=o=>O())},{default:e(()=>[i("导出 Excel")]),_:1})]),_:1})]),default:e(()=>[a(y,null,{default:e(()=>[i(" 更多 "),a(x,{name:"ellipsis-outlined"})]),_:1})]),_:1})]),permissionType:e(o=>[a(T,b($(o)),{default:e(({record:n})=>[n.permissionType==1?(r(),u(_,{key:0,color:"success"},{default:e(()=>[i("自定义权限")]),_:1})):d("",!0),n.permissionType==2?(r(),u(_,{key:1,color:"success"},{default:e(()=>[i("查看所有数据")]),_:1})):d("",!0),n.permissionType==3?(r(),u(_,{key:2,color:"success"},{default:e(()=>[i("仅查看本组织")]),_:1})):d("",!0),n.permissionType==4?(r(),u(_,{key:3,color:"success"},{default:e(()=>[i("仅查看本组织和下属组织")]),_:1})):d("",!0),n.permissionType==5?(r(),u(_,{key:4,color:"success"},{default:e(()=>[i("仅查看本人")]),_:1})):d("",!0)]),_:2},1040)]),deleteLock:e(o=>[a(T,b($(o)),{default:e(({record:n})=>[n.deleteLock?(r(),u(_,{key:0,color:"success"},{default:e(()=>[i("锁定")]),_:1})):(r(),u(_,{key:1,color:"warning"},{default:e(()=>[i("不锁定")]),_:1}))]),_:2},1040)]),id:e(o=>[a(T,b($(o)),{default:e(({record:n})=>[k(p).update?(r(),S("a",{key:0,href:"javascript:;",onClick:()=>{var f;return(f=w.value)==null?void 0:f.open(n.id)}},"编辑",8,ae)):d("",!0),a(N,{type:"vertical"}),k(p).delete?(r(),u(D,{key:1,title:"您确定要删除?",onConfirm:f=>j(n.id),okText:"确定",cancelText:"取消"},{default:e(()=>[oe]),_:2},1032,["onConfirm"])):d("",!0),a(N,{type:"vertical"}),I("a",{href:"javascript:;",onClick:()=>{var f;return(f=F.value)==null?void 0:f.open(n.id)}},"功能权限",8,se),a(N,{type:"vertical"}),I("a",{href:"javascript:;",onClick:()=>{var f;return(f=B.value)==null?void 0:f.open(n.id)}},"数据权限",8,ne)]),_:2},1040)]),_:1},8,["config"]),a(J,{ref_key:"refInfo",ref:w,onSuccess:()=>m()},null,8,["onSuccess"]),a(X,{ref_key:"refDataAuthority",ref:B,onSuccess:()=>m()},null,8,["onSuccess"]),a(Y,{ref_key:"refFunctionAuthority",ref:F,onSuccess:()=>m()},null,8,["onSuccess"])]),_:1})}}});export{ke as default};
