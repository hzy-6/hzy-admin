import{d as B,r as U,R as K,b as $,e as P,T as h,f as s,o as l,l as p,w as a,a as e,u as i,i as d,z as f,c as g,t as N,an as j,g as q}from"./index-1d3290fc.js";import{_ as v}from"./AppIcon.vue_vue_type_script_setup_true_lang-5c9d9d70.js";import{S as w,_ as G}from"./Info.vue_vue_type_script_setup_true_lang-66e91ab0.js";import{_ as H}from"./PageContainer.vue_vue_type_script_setup_true_lang-4a22be12.js";import{_ as J}from"./TableCurd.vue_vue_type_script_setup_true_lang-a4411ecd.js";import"./AppIconList-b96c1f2a.js";import"./_plugin-vue_export-helper-c27b6911.js";const Q={key:0},W={key:1},X=["onClick"],Z=["onClick"],ee=["onClick"],te=q("a",{class:"text-danger"},"删除",-1),ae=B({name:"system_menu"}),ue=B({...ae,setup(ne){const n=U({search:{state:!1,vm:{name:void 0},sort:[]},loading:!1,page:1,size:10,total:100,columns:[],data:[]}),r=K(),M=$(),k=$(),T=$();P(()=>{_()});async function _(){try{n.loading=!0;const c=await w.getAll(n.search.vm);if(n.loading=!1,c.code!=1)return;n.data=h.genTreeData(c.data,null)}catch{n.loading=!1}}async function b(c){var x;let o=[];if(c?o.push(c):o=((x=M.value)==null?void 0:x.getSelectedRowKeys())??[],o.length==0)return h.message.error("请选择要删除的行!");try{n.loading=!0;const C=await w.deleteList(o);if(n.loading=!1,C.code!=1)return;h.message.success("删除成功!"),_()}catch{n.loading=!1}}function E(){w.exportExcel(n.search.vm,n.search.sort)}async function O(c){n.loading=!0;const o=await w.copyMenu(c);n.loading=!1,o.code==1&&(h.message.success("复制成功!"),_())}return(c,o)=>{const x=s("a-input"),C=s("a-form-item"),z=s("a-col"),y=s("a-button"),V=s("a-space"),A=s("a-row"),F=s("a-form"),D=s("a-popconfirm"),I=s("a-menu-item"),L=s("a-menu"),R=s("a-dropdown"),u=s("a-table-column"),S=s("a-divider");return l(),p(H,null,{default:a(()=>[e(J,{ref_key:"refTableCurd",ref:M,config:n,onChange:o[7]||(o[7]=t=>{n.page=t.pagination.current??1,n.size=t.pagination.pageSize??n.size,n.search.sort=t.sorter instanceof Array?[...t.sorter]:[t.sorter],_()}),onShowSizeChange:o[8]||(o[8]=({current:t,size:m})=>{n.page=t==0?1:t,n.size=m,_()}),"is-pagination":!1},{search:a(()=>[i(r).search?(l(),p(F,{key:0,ref_key:"refSearchForm",ref:T,model:n.search.vm},{default:a(()=>[e(A,{gutter:[16,0]},{default:a(()=>[e(z,{xs:24,sm:12,md:8,lg:6,xl:6},{default:a(()=>[e(C,{class:"mb-0",name:"name",label:"菜单名称"},{default:a(()=>[e(x,{value:n.search.vm.name,"onUpdate:value":o[0]||(o[0]=t=>n.search.vm.name=t),placeholder:"菜单名称"},null,8,["value"])]),_:1})]),_:1}),e(z,{xs:24,sm:12,md:8,lg:6,xl:6,class:"text-right"},{default:a(()=>[e(V,{size:8},{default:a(()=>[e(y,{onClick:o[1]||(o[1]=t=>{var m;n.page=1,(m=T.value)==null||m.resetFields(),_()})},{default:a(()=>[d(" 重置 ")]),_:1}),e(y,{type:"primary",onClick:o[2]||(o[2]=t=>{n.page=1,_()})},{default:a(()=>[d(" 查询 ")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])):f("",!0)]),"toolbar-left":a(()=>[i(r).search?(l(),p(y,{key:0,onClick:o[3]||(o[3]=t=>n.search.state=!n.search.state)},{default:a(()=>[n.search.state?(l(),g("div",Q,[e(v,{name:"UpOutlined"}),d("  收起")])):(l(),g("div",W,[e(v,{name:"DownOutlined"}),d("  展开")]))]),_:1})):f("",!0),i(r).insert?(l(),p(y,{key:1,type:"primary",onClick:o[4]||(o[4]=()=>{var t;return(t=k.value)==null?void 0:t.open()})},{icon:a(()=>[e(v,{name:"PlusOutlined"})]),default:a(()=>[d(" 新建 ")]),_:1})):f("",!0),i(r).delete?(l(),p(D,{key:2,title:"您确定要删除?",onConfirm:o[5]||(o[5]=t=>b()),okText:"确定",cancelText:"取消"},{default:a(()=>[e(y,{type:"primary",danger:""},{icon:a(()=>[e(v,{name:"DeleteOutlined"})]),default:a(()=>[d(" 批量删除 ")]),_:1})]),_:1})):f("",!0)]),"toolbar-right":a(()=>[e(R,null,{overlay:a(()=>[e(L,null,{default:a(()=>[e(I,{key:"1",onClick:o[6]||(o[6]=t=>E())},{default:a(()=>[d("导出 Excel")]),_:1})]),_:1})]),default:a(()=>[e(y,null,{default:a(()=>[d(" 更多 "),e(v,{name:"ellipsis-outlined"})]),_:1})]),_:1})]),"table-col":a(()=>[e(u,{title:"名称","data-index":"name"}),e(u,{title:"图标","data-index":"icon"},{default:a(({record:t})=>[e(v,{name:t.icon},null,8,["name"])]),_:1}),e(u,{title:"编号","data-index":"number"}),e(u,{title:"组件名称","data-index":"componentName"}),e(u,{title:"组件地址","data-index":"url"}),e(u,{title:"路由地址","data-index":"router"}),e(u,{title:"更新时间","data-index":"lastModificationTime"},{default:a(({record:t})=>[d(N(i(j)(t.lastModificationTime).format("YYYY-MM-DD")),1)]),_:1}),e(u,{title:"创建时间","data-index":"creationTime"},{default:a(({record:t})=>[d(N(i(j)(t.creationTime).format("YYYY-MM-DD")),1)]),_:1}),i(r).update||i(r).delete||i(r).insert?(l(),p(u,{key:0,title:"操作","data-index":"id"},{default:a(({record:t})=>[i(r).insert?(l(),g("a",{key:0,href:"javascript:void(0)",onClick:m=>{var Y;return(Y=k.value)==null?void 0:Y.open(null,t.id)}},"新建",8,X)):f("",!0),e(S,{type:"vertical"}),i(r).update?(l(),g("a",{key:1,href:"javascript:;",onClick:()=>{var m;return(m=k.value)==null?void 0:m.open(t.id,t.parentId)}},"编辑",8,Z)):f("",!0),e(S,{type:"vertical"}),i(r).update?(l(),g("a",{key:2,href:"javascript:;",onClick:()=>O(t.id)},"复制",8,ee)):f("",!0),e(S,{type:"vertical"}),i(r).delete?(l(),p(D,{key:3,title:"您确定要删除?",onConfirm:m=>b(t.id),okText:"确定",cancelText:"取消"},{default:a(()=>[te]),_:2},1032,["onConfirm"])):f("",!0)]),_:1})):f("",!0)]),_:1},8,["config"]),e(G,{ref_key:"refInfo",ref:k,onSuccess:()=>_()},null,8,["onSuccess"])]),_:1})}}});export{ue as default};