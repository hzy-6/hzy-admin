import{d as Z,r as G,bZ as J,b as C,n as Q,e as W,b_ as S,q as X,T as I,f as r,o as l,l as c,w as a,a as o,u as f,j as d,B as p,c as b,aa as Y,S as ee,g as te}from"./index-5ce8de01.js";import{_ as y}from"./AppIcon.vue_vue_type_script_setup_true_lang-7672b527.js";import{_ as ae}from"./Info.vue_vue_type_script_setup_true_lang-704910bc.js";import{_ as oe}from"./PageContainer.vue_vue_type_script_setup_true_lang-ee111854.js";import{_ as ne}from"./TableCurd.vue_vue_type_script_setup_true_lang-73963374.js";import{S as se}from"./SysOrganizationService-833430ab.js";const re={key:0},le={key:1},ie=["onClick"],de=te("a",{class:"text-danger"},"删除",-1),we=Z({name:"system_user",__name:"Index",props:{isFindBack:{type:Boolean,default:!1},defaultRowIds:{},type:{type:Boolean,default:!0}},emits:["findBackChange"],setup(O,{emit:E}){const U=E,h=O,t=G({search:{state:!1,vm:{name:void 0,loginName:void 0,organizationId:void 0},sort:[]},loading:!1,page:1,size:10,total:100,columns:[{fieldName:"name",title:"用户名称",show:!0,width:"",sorter:!0,dataIndex:"name"},{fieldName:"loginName",title:"登录名称",show:!0,width:"",sorter:!0,dataIndex:"loginName"},{fieldName:"所属角色",title:"所属角色",show:!0,width:"",sorter:!1,dataIndex:"所属角色"},{fieldName:"organizationName",title:"所属组织",show:!0,width:"",sorter:!0,dataIndex:"organizationName"},{fieldName:"phone",title:"联系电话",show:!0,width:"",sorter:!0,dataIndex:"phone"},{fieldName:"_Email",title:"邮件地址",show:!1,width:"",sorter:!0,dataIndex:"_Email"},{fieldName:"lastModificationTime",title:"更新时间",show:!0,width:"",sorter:!0,dataIndex:"lastModificationTime"},{fieldName:"creationTime",title:"创建时间",show:!0,width:"",sorter:!0,dataIndex:"creationTime"},{fieldName:"id",title:"操作",show:!0,width:"",sorter:!0,dataIndex:"id"}],data:[]}),u=J(),k=C(),N=C(),R=C(),$=C(),K=C({defaultRowIds:Q(()=>h.defaultRowIds)});W(()=>{_(),se.sysOrganizationTree().then(n=>{$.value=n.data.rows})});async function _(){try{t.loading=!0;const n=await S.findList(t.page,t.size,t.search.vm,t.search.sort);if(t.loading=!1,n.code!=200)return;t.page=n.data.page,t.size=n.data.size,t.total=n.data.total,t.data=n.data.dataSource,x.setCheckboxRow()}catch{t.loading=!1}}async function T(n){var m;let e=[];if(n?e.push(n):e=((m=k.value)==null?void 0:m.getSelectedRowKeys())??[],e.length==0)return I.message.error("请选择要删除的行!");try{t.loading=!0;const i=await S.deleteList(e);if(t.loading=!1,i.code!=200)return;I.message.success("删除成功!"),_()}catch{t.loading=!1}}function L(){S.exportExcel(t.search.vm,t.search.sort)}const x={initRows(){h.isFindBack&&X(()=>h.defaultRowIds,n=>{x.setCheckboxRow()})},setCheckboxRow(){var n,e;h.isFindBack&&((n=k.value)==null||n.clearSelectedRowKeys(),(e=k.value)==null||e.setSelectedRowKeys(K.value.defaultRowIds))},onChange(){var e;if(h.isFindBack){var n=((e=k.value)==null?void 0:e.getSelectedRowKeys())??[];if(n&&n.length==0)return I.message.warning("请选择一条数据!");if(h.type&&n.length>1)return I.message.warning("只能选择一条数据!");U("findBackChange",x.getRowsByIds(n))}},getRowsByIds(n){var e=[],m=t.data;for(let i=0;i<m.length;i++){const g=m[i];n.filter(z=>z==g.id).length>0&&e.push(g)}return e}};return x.initRows(),(n,e)=>{const m=r("a-input"),i=r("a-form-item"),g=r("a-col"),z=r("a-tree-select"),w=r("a-button"),M=r("a-space"),V=r("a-row"),P=r("a-form"),F=r("a-popconfirm"),j=r("a-menu-item"),A=r("a-menu"),D=r("a-dropdown"),q=r("a-divider"),H=r("a-table-column");return l(),c(oe,{show:!n.$props.isFindBack},{default:a(()=>[o(ne,{ref_key:"refTableCurd",ref:k,config:t,onChange:e[10]||(e[10]=s=>{t.page=s.pagination.current??1,t.size=s.pagination.pageSize??t.size,t.search.sort=s.sorter instanceof Array?[...s.sorter]:[s.sorter],_()}),onShowSizeChange:e[11]||(e[11]=({current:s,size:v})=>{t.page=s==0?1:s,t.size=v,_()})},{search:a(()=>[f(u).search?(l(),c(P,{key:0,ref_key:"refSearchForm",ref:R,model:t.search.vm},{default:a(()=>[o(V,{gutter:[16,0]},{default:a(()=>[o(g,{xs:24,sm:12,md:8,lg:6,xl:6},{default:a(()=>[o(i,{class:"mb-0",name:"name",label:"真实姓名"},{default:a(()=>[o(m,{value:t.search.vm.name,"onUpdate:value":e[0]||(e[0]=s=>t.search.vm.name=s),placeholder:"真实名称"},null,8,["value"])]),_:1})]),_:1}),o(g,{xs:24,sm:12,md:8,lg:6,xl:6},{default:a(()=>[o(i,{class:"mb-0",name:"loginName",label:"账户名称"},{default:a(()=>[o(m,{value:t.search.vm.loginName,"onUpdate:value":e[1]||(e[1]=s=>t.search.vm.loginName=s),placeholder:"账户名称"},null,8,["value"])]),_:1})]),_:1}),o(g,{xs:24,sm:12,md:8,lg:6,xl:6},{default:a(()=>[o(i,{class:"mb-0",name:"organizationId",label:"所属组织"},{default:a(()=>[o(z,{value:t.search.vm.organizationId,"onUpdate:value":e[2]||(e[2]=s=>t.search.vm.organizationId=s),"dropdown-style":{maxHeight:"400px",overflow:"auto"},placeholder:"所属组织","allow-clear":"","tree-default-expand-all":"","tree-data":$.value,"field-names":{children:"children",label:"title",value:"key"},class:"w100"},null,8,["value","tree-data"])]),_:1})]),_:1}),o(g,{xs:24,sm:12,md:8,lg:6,xl:6,class:"text-right"},{default:a(()=>[o(M,{size:8},{default:a(()=>[o(w,{onClick:e[3]||(e[3]=s=>{var v;t.page=1,(v=R.value)==null||v.resetFields(),_()})},{default:a(()=>[d(" 重置 ")]),_:1}),o(w,{type:"primary",onClick:e[4]||(e[4]=s=>{t.page=1,_()})},{default:a(()=>[d(" 查询 ")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])):p("",!0)]),"toolbar-left":a(()=>[f(u).search?(l(),c(w,{key:0,onClick:e[5]||(e[5]=s=>t.search.state=!t.search.state)},{default:a(()=>[t.search.state?(l(),b("div",re,[o(y,{name:"UpOutlined"}),d("  收起 ")])):(l(),b("div",le,[o(y,{name:"DownOutlined"}),d("  展开 ")]))]),_:1})):p("",!0),f(u).insert?(l(),c(w,{key:1,type:"primary",onClick:e[6]||(e[6]=()=>{var s;return(s=N.value)==null?void 0:s.open()})},{icon:a(()=>[o(y,{name:"PlusOutlined"})]),default:a(()=>[d(" 新建 ")]),_:1})):p("",!0),f(u).delete?(l(),c(F,{key:2,title:"您确定要删除?",onConfirm:e[7]||(e[7]=s=>T()),okText:"确定",cancelText:"取消"},{default:a(()=>[o(w,{type:"primary",danger:""},{icon:a(()=>[o(y,{name:"DeleteOutlined"})]),default:a(()=>[d(" 批量删除 ")]),_:1})]),_:1})):p("",!0),n.$props.isFindBack?(l(),c(w,{key:3,type:"primary",onClick:e[8]||(e[8]=s=>x.onChange())},{icon:a(()=>[o(y,{name:"CheckOutlined"})]),default:a(()=>[d(" 带回数据 ")]),_:1})):p("",!0)]),"toolbar-right":a(()=>[o(D,null,{overlay:a(()=>[o(A,null,{default:a(()=>[o(j,{key:"1",onClick:e[9]||(e[9]=s=>L())},{default:a(()=>[d("导出 Excel")]),_:1})]),_:1})]),default:a(()=>[o(w,null,{default:a(()=>[d(" 更多 "),o(y,{name:"ellipsis-outlined"})]),_:1})]),_:1})]),id:a(s=>[f(u).update||f(u).delete?(l(),c(H,Y(ee({key:0},s)),{default:a(({record:v})=>[f(u).update?(l(),b("a",{key:0,href:"javascript:;",onClick:()=>{var B;return(B=N.value)==null?void 0:B.open(v.id)}},"编辑",8,ie)):p("",!0),o(q,{type:"vertical"}),f(u).delete?(l(),c(F,{key:1,title:"您确定要删除?",onConfirm:B=>T(v.id),okText:"确定",cancelText:"取消"},{default:a(()=>[de]),_:2},1032,["onConfirm"])):p("",!0)]),_:2},1040)):p("",!0)]),_:1},8,["config"]),o(ae,{ref_key:"refInfo",ref:N,onSuccess:()=>_()},null,8,["onSuccess"])]),_:1},8,["show"])}}});export{we as _};
