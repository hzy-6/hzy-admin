import{d as P,r as j,b_ as A,b as w,e as D,f as r,o as i,l as f,w as t,a as n,u as d,j as m,B as _,c as h,ab as K,U as R,g as q,T as I}from"./index-C9oHGpmd.js";import{_ as g}from"./AppIcon.vue_vue_type_script_setup_true_lang-o_ph5tPH.js";import{S as C,_ as G}from"./Info.vue_vue_type_script_setup_true_lang-wPukCRxR.js";import{_ as H}from"./PageContainer.vue_vue_type_script_setup_true_lang-w--qcJ6v.js";import{_ as J}from"./TableCurd.vue_vue_type_script_setup_true_lang-nb7-a0jh.js";import"./ColumnSetting.vue_vue_type_script_setup_true_lang-dsx0k3kj.js";const Q={key:0},W={key:1},X=["onClick"],Y=q("a",{class:"text-danger"},"删除",-1),ie=P({name:"system_function",__name:"Index",setup(Z){const e=j({search:{state:!1,vm:{name:void 0},sort:[]},loading:!1,page:1,size:10,total:100,columns:[{fieldName:"number",title:"编号",show:!0,width:"",sorter:!0,dataIndex:"number"},{fieldName:"name",title:"名称",show:!0,width:"",sorter:!0,dataIndex:"name"},{fieldName:"byName",title:"标识名称",show:!0,width:"",sorter:!0,dataIndex:"byName"},{fieldName:"lastModificationTime",title:"最后更新时间",show:!0,width:"",sorter:!0,dataIndex:"lastModificationTime"},{fieldName:"creationTime",title:"创建时间",show:!0,width:"",sorter:!0,dataIndex:"creationTime"},{fieldName:"id",title:"操作",show:!0,width:"",sorter:!1,dataIndex:"id"}],data:[]}),l=A(),b=w(),x=w(),N=w();D(()=>{u()});async function u(){try{e.loading=!0;const s=await C.findList(e.page,e.size,e.search.vm,e.search.sort);if(e.loading=!1,s.code!=200)return;e.page=s.data.page,e.size=s.data.size,e.total=s.data.total,e.data=s.data.dataSource}catch{e.loading=!1}}async function S(s){var y;let a=[];if(s?a.push(s):a=((y=b.value)==null?void 0:y.getSelectedRowKeys())??[],a.length==0)return I.message.error("请选择要删除的行!");try{e.loading=!0;const v=await C.deleteList(a);if(e.loading=!1,v.code!=200)return;I.message.success("删除成功!"),u()}catch{e.loading=!1}}function T(){C.exportExcel(e.search.vm,e.search.sort)}return(s,a)=>{const y=r("a-input"),v=r("a-form-item"),z=r("a-col"),p=r("a-button"),B=r("a-space"),E=r("a-row"),F=r("a-form"),$=r("a-popconfirm"),L=r("a-menu-item"),O=r("a-menu"),U=r("a-dropdown"),V=r("a-divider"),M=r("a-table-column");return i(),f(H,null,{default:t(()=>[n(J,{ref_key:"refTableCurd",ref:b,config:e,"onUpdate:config":a[7]||(a[7]=o=>e=o),onChange:a[8]||(a[8]=o=>{e.page=o.pagination.current??1,e.size=o.pagination.pageSize??e.size,e.search.sort=o.sorter instanceof Array?[...o.sorter]:[o.sorter],u()}),onShowSizeChange:a[9]||(a[9]=({current:o,size:c})=>{e.page=o==0?1:o,e.size=c,u()})},{search:t(()=>[d(l).search?(i(),f(F,{key:0,ref_key:"refSearchForm",ref:N,model:e.search.vm},{default:t(()=>[n(E,{gutter:[16,0]},{default:t(()=>[n(z,{xs:24,sm:12,md:8,lg:6,xl:6},{default:t(()=>[n(v,{class:"mb-0",name:"name",label:"名称"},{default:t(()=>[n(y,{value:e.search.vm.name,"onUpdate:value":a[0]||(a[0]=o=>e.search.vm.name=o),placeholder:"名称"},null,8,["value"])]),_:1})]),_:1}),n(z,{xs:24,sm:12,md:8,lg:6,xl:6,class:"text-right"},{default:t(()=>[n(B,{size:8},{default:t(()=>[n(p,{onClick:a[1]||(a[1]=o=>{var c;e.page=1,(c=N.value)==null||c.resetFields(),u()})},{default:t(()=>[m(" 重置 ")]),_:1}),n(p,{type:"primary",onClick:a[2]||(a[2]=o=>{e.page=1,u()})},{default:t(()=>[m(" 查询 ")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])):_("",!0)]),"toolbar-left":t(()=>[d(l).search?(i(),f(p,{key:0,onClick:a[3]||(a[3]=o=>e.search.state=!e.search.state)},{default:t(()=>[e.search.state?(i(),h("div",Q,[n(g,{name:"UpOutlined"}),m("  收起 ")])):(i(),h("div",W,[n(g,{name:"DownOutlined"}),m("  展开 ")]))]),_:1})):_("",!0),d(l).insert?(i(),f(p,{key:1,type:"primary",onClick:a[4]||(a[4]=()=>{var o;return(o=x.value)==null?void 0:o.open()})},{icon:t(()=>[n(g,{name:"PlusOutlined"})]),default:t(()=>[m(" 新建 ")]),_:1})):_("",!0),d(l).delete?(i(),f($,{key:2,title:"您确定要删除?",onConfirm:a[5]||(a[5]=o=>S()),okText:"确定",cancelText:"取消"},{default:t(()=>[n(p,{type:"primary",danger:""},{icon:t(()=>[n(g,{name:"DeleteOutlined"})]),default:t(()=>[m(" 批量删除 ")]),_:1})]),_:1})):_("",!0)]),"toolbar-right":t(()=>[n(U,null,{overlay:t(()=>[n(O,null,{default:t(()=>[n(L,{key:"1",onClick:a[6]||(a[6]=o=>T())},{default:t(()=>[m("导出 Excel")]),_:1})]),_:1})]),default:t(()=>[n(p,null,{default:t(()=>[m(" 更多 "),n(g,{name:"ellipsis-outlined"})]),_:1})]),_:1})]),id:t(o=>[d(l).update||d(l).delete?(i(),f(M,K(R({key:0},o)),{default:t(({record:c})=>[d(l).update?(i(),h("a",{key:0,href:"javascript:;",onClick:()=>{var k;return(k=x.value)==null?void 0:k.open(c.id)}},"编辑",8,X)):_("",!0),n(V,{type:"vertical"}),d(l).delete?(i(),f($,{key:1,title:"您确定要删除?",onConfirm:k=>S(c.id),okText:"确定",cancelText:"取消"},{default:t(()=>[Y]),_:2},1032,["onConfirm"])):_("",!0)]),_:2},1040)):_("",!0)]),_:1},8,["config"]),n(G,{ref_key:"refInfo",ref:x,onSuccess:()=>u()},null,8,["onSuccess"])]),_:1})}}});export{ie as default};
