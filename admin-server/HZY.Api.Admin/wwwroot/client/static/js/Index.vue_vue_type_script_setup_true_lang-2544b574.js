import{d as L,r as W,R as X,b,m as Y,e as Z,ac as R,n as ee,T as z,f as l,o as r,l as c,w as o,a as n,u as _,i as u,z as g,c as w,D as T,t as te,G as U,g as ae}from"./index-1d3290fc.js";import{_ as y}from"./AppIcon.vue_vue_type_script_setup_true_lang-5c9d9d70.js";import{_ as oe}from"./Info.vue_vue_type_script_setup_true_lang-cb8d7e8d.js";import{_ as ne}from"./PageContainer.vue_vue_type_script_setup_true_lang-4a22be12.js";import{_ as se}from"./TableCurd.vue_vue_type_script_setup_true_lang-a4411ecd.js";import{S as le}from"./SysOrganizationService-c4d109f1.js";const re={key:0},ie={key:1},de=["onClick"],ue=ae("a",{class:"text-danger"},"删除",-1),ce=L({name:"system_user"}),ke=L({...ce,props:{isFindBack:{type:Boolean,default:!1},defaultRowIds:null,type:{type:Boolean,default:!0}},emits:["findBackChange"],setup(D,{emit:E}){const h=D,t=W({search:{state:!1,vm:{name:void 0,loginName:void 0,organizationId:void 0},sort:[]},loading:!1,page:1,size:10,total:100,columns:[],data:[]}),m=X(),x=b(),B=b(),I=b(),$=b(),K=b({defaultRowIds:Y(()=>h.defaultRowIds)});Z(()=>{v(),le.sysOrganizationTree().then(s=>{$.value=s.data.rows})});async function v(){try{t.loading=!0;const s=await R.findList(t.page,t.size,t.search.vm,t.search.sort);if(t.loading=!1,s.code!=1)return;t.page=s.data.page,t.size=s.data.size,t.total=s.data.total,t.columns=s.data.columns,t.data=s.data.dataSource,C.setCheckboxRow()}catch{t.loading=!1}}async function N(s){var f;let a=[];if(s?a.push(s):a=((f=x.value)==null?void 0:f.getSelectedRowKeys())??[],a.length==0)return z.message.error("请选择要删除的行!");try{t.loading=!0;const d=await R.deleteList(a);if(t.loading=!1,d.code!=1)return;z.message.success("删除成功!"),v()}catch{t.loading=!1}}function V(){R.exportExcel(t.search.vm,t.search.sort)}const C={initRows(){h.isFindBack&&ee(()=>h.defaultRowIds,s=>{C.setCheckboxRow()})},setCheckboxRow(){var s,a;h.isFindBack&&((s=x.value)==null||s.clearSelectedRowKeys(),(a=x.value)==null||a.setSelectedRowKeys(K.value.defaultRowIds))},onChange(){var a;if(h.isFindBack){var s=((a=x.value)==null?void 0:a.getSelectedRowKeys())??[];if(s&&s.length==0)return z.message.warning("请选择一条数据!");if(h.type&&s.length>1)return z.message.warning("只能选择一条数据!");E("findBackChange",C.getRowsByIds(s))}},getRowsByIds(s){var a=[],f=t.data;for(let d=0;d<f.length;d++){const k=f[d];s.filter(S=>S==k.id).length>0&&a.push(k)}return a}};return C.initRows(),(s,a)=>{const f=l("a-input"),d=l("a-form-item"),k=l("a-col"),S=l("a-tree-select"),p=l("a-button"),A=l("a-space"),M=l("a-row"),j=l("a-form"),F=l("a-popconfirm"),G=l("a-menu-item"),H=l("a-menu"),P=l("a-dropdown"),q=l("a-checkbox"),J=l("a-popover"),O=l("a-table-column"),Q=l("a-divider");return r(),c(ne,{show:!s.$props.isFindBack},{default:o(()=>[n(se,{ref_key:"refTableCurd",ref:x,config:t,onChange:a[10]||(a[10]=e=>{t.page=e.pagination.current??1,t.size=e.pagination.pageSize??t.size,t.search.sort=e.sorter instanceof Array?[...e.sorter]:[e.sorter],v()}),onShowSizeChange:a[11]||(a[11]=({current:e,size:i})=>{t.page=e==0?1:e,t.size=i,v()})},{search:o(()=>[_(m).search?(r(),c(j,{key:0,ref_key:"refSearchForm",ref:I,model:t.search.vm},{default:o(()=>[n(M,{gutter:[16,0]},{default:o(()=>[n(k,{xs:24,sm:12,md:8,lg:6,xl:6},{default:o(()=>[n(d,{class:"mb-0",name:"name",label:"真实姓名"},{default:o(()=>[n(f,{value:t.search.vm.name,"onUpdate:value":a[0]||(a[0]=e=>t.search.vm.name=e),placeholder:"真实名称"},null,8,["value"])]),_:1})]),_:1}),n(k,{xs:24,sm:12,md:8,lg:6,xl:6},{default:o(()=>[n(d,{class:"mb-0",name:"loginName",label:"账户名称"},{default:o(()=>[n(f,{value:t.search.vm.loginName,"onUpdate:value":a[1]||(a[1]=e=>t.search.vm.loginName=e),placeholder:"账户名称"},null,8,["value"])]),_:1})]),_:1}),n(k,{xs:24,sm:12,md:8,lg:6,xl:6},{default:o(()=>[n(d,{class:"mb-0",name:"organizationId",label:"所属组织"},{default:o(()=>[n(S,{value:t.search.vm.organizationId,"onUpdate:value":a[2]||(a[2]=e=>t.search.vm.organizationId=e),"dropdown-style":{maxHeight:"400px",overflow:"auto"},placeholder:"所属组织","allow-clear":"","tree-default-expand-all":"","tree-data":$.value,"field-names":{children:"children",label:"title",value:"key"},class:"w100"},null,8,["value","tree-data"])]),_:1})]),_:1}),n(k,{xs:24,sm:12,md:8,lg:6,xl:6,class:"text-right"},{default:o(()=>[n(A,{size:8},{default:o(()=>[n(p,{onClick:a[3]||(a[3]=e=>{var i;t.page=1,(i=I.value)==null||i.resetFields(),v()})},{default:o(()=>[u(" 重置 ")]),_:1}),n(p,{type:"primary",onClick:a[4]||(a[4]=e=>{t.page=1,v()})},{default:o(()=>[u(" 查询 ")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])):g("",!0)]),"toolbar-left":o(()=>[_(m).search?(r(),c(p,{key:0,onClick:a[5]||(a[5]=e=>t.search.state=!t.search.state)},{default:o(()=>[t.search.state?(r(),w("div",re,[n(y,{name:"UpOutlined"}),u("  收起")])):(r(),w("div",ie,[n(y,{name:"DownOutlined"}),u("  展开")]))]),_:1})):g("",!0),_(m).insert?(r(),c(p,{key:1,type:"primary",onClick:a[6]||(a[6]=()=>{var e;return(e=B.value)==null?void 0:e.open()})},{icon:o(()=>[n(y,{name:"PlusOutlined"})]),default:o(()=>[u(" 新建 ")]),_:1})):g("",!0),_(m).delete?(r(),c(F,{key:2,title:"您确定要删除?",onConfirm:a[7]||(a[7]=e=>N()),okText:"确定",cancelText:"取消"},{default:o(()=>[n(p,{type:"primary",danger:""},{icon:o(()=>[n(y,{name:"DeleteOutlined"})]),default:o(()=>[u(" 批量删除 ")]),_:1})]),_:1})):g("",!0),s.$props.isFindBack?(r(),c(p,{key:3,type:"primary",onClick:a[8]||(a[8]=e=>C.onChange())},{icon:o(()=>[n(y,{name:"CheckOutlined"})]),default:o(()=>[u(" 带回数据 ")]),_:1})):g("",!0)]),"toolbar-right":o(()=>[n(P,null,{overlay:o(()=>[n(H,null,{default:o(()=>[n(G,{key:"1",onClick:a[9]||(a[9]=e=>V())},{default:o(()=>[u("导出 Excel")]),_:1})]),_:1})]),default:o(()=>[n(p,null,{default:o(()=>[u(" 更多 "),n(y,{name:"ellipsis-outlined"})]),_:1})]),_:1}),n(J,null,{content:o(()=>[(r(!0),w(U,null,T(t.columns.filter(e=>e.fieldName.substr(0,1)!="_"),e=>(r(),w("div",null,[n(q,{checked:e.show,"onUpdate:checked":i=>e.show=i},{default:o(()=>[u(te(e.title),1)]),_:2},1032,["checked","onUpdate:checked"])]))),256))]),default:o(()=>[n(p,{type:"text"},{icon:o(()=>[n(y,{name:"setting-outlined"})]),_:1})]),_:1})]),"table-col":o(()=>[(r(!0),w(U,null,T(t.columns.filter(e=>e.fieldName!=="id"&&e.show),(e,i)=>(r(),c(O,{key:e.fieldName,title:e.title,"data-index":e.fieldName,sorter:e.sort?{multiple:i+1}:!1},null,8,["title","data-index","sorter"]))),128)),_(m).update||_(m).delete?(r(),c(O,{key:0,title:"操作","data-index":"id"},{default:o(({record:e})=>[_(m).update?(r(),w("a",{key:0,href:"javascript:;",onClick:()=>{var i;return(i=B.value)==null?void 0:i.open(e.id)}},"编辑",8,de)):g("",!0),n(Q,{type:"vertical"}),_(m).delete?(r(),c(F,{key:1,title:"您确定要删除?",onConfirm:i=>N(e.id),okText:"确定",cancelText:"取消"},{default:o(()=>[ue]),_:2},1032,["onConfirm"])):g("",!0)]),_:1})):g("",!0)]),_:1},8,["config"]),n(oe,{ref_key:"refInfo",ref:B,onSuccess:()=>v()},null,8,["onSuccess"])]),_:1},8,["show"])}}});export{ke as _};