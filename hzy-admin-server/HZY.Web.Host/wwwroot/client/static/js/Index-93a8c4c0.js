import{b as Y,r as $,a as L,i as j,o as B,j as c,k as m,c as k,g as t,w as o,f as l,q as h,A as g,E as _,n as u,e as F,aW as E,F as O,d as w,S as I,t as N}from"./index-c3cea2d3.js";import V from"./List-d1d0409f.js";import{_ as A,s as R}from"./Info-942299db.js";import"./AppIconList-ee374a7b.js";const P=u("\u67E5\u8BE2"),U=u("\u91CD\u7F6E"),z=u("\u5173\u95ED"),K=u(" \u9AD8\u7EA7\u68C0\u7D22 "),q=u(" \u65B0\u5EFA "),H=u(" \u6279\u91CF\u5220\u9664 "),W=["onClick"],G=["onClick"],J=w("a",{class:"text-danger"},"\u5220\u9664",-1),Q={name:"system_menu"},oe=Object.assign(Q,{setup(X){const D=Y(),n=$({search:{state:!1,fieldCount:2,vm:{name:null}},loading:!1,data:[],expandRows:[]}),x=L(null),v=L(null),f=D.getPowerByMenuId(j.currentRoute.value.meta.menuId),s={onChange(r){const{currentPage:e,pageSize:i}=r;n.page=e==0?1:e,n.rows=i,s.findList()},onResetSearch(){n.page=1;let r=n.search.vm;for(let e in r)r[e]=null;s.findList()},findList(){n.loading=!0,R.getAll(n.search.vm).then(r=>{let e=r.data;n.loading=!1,n.data=e,I(()=>s.recoveryOpenRows())})},deleteList(r){let e=[];r?e.push(r):e=v.value.getCheckboxRecords().map(i=>i.id),R.deleteList(e).then(i=>{i.code==1&&(N.message("\u5220\u9664\u6210\u529F!","\u6210\u529F"),s.findList())})},openForm(r,e){x.value.openForm({visible:!0,key:r,parentId:e})},onToggleTreeExpand(){n.expandRows=v.value.getTreeExpandRecords()},recoveryOpenRows(){var r=n.expandRows;r.length>0&&(v.value.setTreeExpand(n.data[1],!0),r.forEach(e=>{v.value.setTreeExpand(n.data.filter(i=>i.id==e.id),!0)}))}};return B(()=>{s.findList()}),(r,e)=>{const i=c("a-input"),y=c("a-col"),p=c("a-button"),M=c("a-row"),C=c("a-popconfirm"),d=c("vxe-column"),T=c("a-divider"),S=c("vxe-table");return m(),k("div",null,[t(V,{ref:"refList",tableData:l(n),onOnChange:s.onChange},{search:o(()=>[t(M,{gutter:[15,15]},{default:o(()=>[t(y,{xs:24,sm:12,md:8,lg:6,xl:4},{default:o(()=>[t(i,{value:l(n).search.vm.name,"onUpdate:value":e[0]||(e[0]=a=>l(n).search.vm.name=a),placeholder:"\u540D\u79F0"},null,8,["value"])]),_:1}),t(y,{xs:24,sm:12,md:8,lg:6,xl:4,style:{float:"right"}},{default:o(()=>[t(p,{type:"primary",class:"mr-15",onClick:s.findList},{default:o(()=>[P]),_:1},8,["onClick"]),t(p,{class:"mr-15",onClick:s.onResetSearch},{default:o(()=>[U]),_:1},8,["onClick"]),t(p,{type:"danger",class:"mr-15",onClick:e[1]||(e[1]=a=>l(n).search.state=!1)},{default:o(()=>[z]),_:1})]),_:1})]),_:1})]),toolbar:o(()=>[t(i,{value:l(n).search.vm.name,"onUpdate:value":e[2]||(e[2]=a=>l(n).search.vm.name=a),placeholder:"\u540D\u79F0",onKeyup:s.findList},null,8,["value","onKeyup"]),l(f).search?(m(),h(p,{key:0,onClick:e[3]||(e[3]=a=>l(n).search.state=!l(n).search.state)},{icon:o(()=>[t(g,{name:l(n).search.state?"UpOutlined":"DownOutlined"},null,8,["name"])]),default:o(()=>[K]),_:1})):_("",!0),l(f).insert?(m(),h(p,{key:1,type:"primary",onClick:e[4]||(e[4]=a=>s.openForm())},{icon:o(()=>[t(g,{name:"PlusOutlined"})]),default:o(()=>[q]),_:1})):_("",!0),l(f).delete?(m(),h(C,{key:2,title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:e[5]||(e[5]=a=>s.deleteList()),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:o(()=>[t(p,{type:"danger"},{icon:o(()=>[t(g,{name:"DeleteOutlined"})]),default:o(()=>[H]),_:1})]),_:1})):_("",!0)]),table:o(()=>[t(S,{class:"mt-15",ref_key:"refTable",ref:v,border:"",stripe:"",data:l(n).data,"row-config":{isCurrent:!0,isHover:!0},"column-config":{isCurrent:!0,resizable:!0},"checkbox-config":{highlight:!0},"tree-config":{transform:!0,rowField:"id",parentField:"parentId"},onToggleTreeExpand:s.onToggleTreeExpand},{default:o(()=>[t(d,{type:"checkbox",width:"40"}),t(d,{field:"name",title:"\u540D\u79F0","show-overflow":"","tree-node":"",width:"200"}),t(d,{field:"icon",title:"\u56FE\u6807",width:"60"},{default:o(({row:a})=>[t(g,{name:a.icon},null,8,["name"])]),_:1}),t(d,{field:"number",title:"\u7F16\u53F7",width:"80"}),t(d,{field:"componentName",title:"\u7EC4\u4EF6\u540D\u79F0","show-overflow":"","min-width":"220"}),t(d,{field:"url",title:"\u7EC4\u4EF6\u5730\u5740","show-overflow":"",width:"250"}),t(d,{field:"router",title:"\u8DEF\u7531\u5730\u5740","show-overflow":"",width:"250"}),t(d,{field:"lastModificationTime",title:"\u66F4\u65B0\u65F6\u95F4",width:"120"},{default:o(({row:a})=>[u(F(l(E)(a.lastModificationTime).format("YYYY-MM-DD")),1)]),_:1}),t(d,{field:"creationTime",title:"\u521B\u5EFA\u65F6\u95F4",width:"120"},{default:o(({row:a})=>[u(F(l(E)(a.creationTime).format("YYYY-MM-DD")),1)]),_:1}),t(d,{field:"id",title:"\u64CD\u4F5C",width:"200"},{default:o(({row:a})=>[l(f).insert?(m(),k(O,{key:0},[w("a",{href:"javascript:void(0)",onClick:b=>s.openForm(null,a.id)},"\u65B0\u5EFA",8,W),t(T,{type:"vertical"})],64)):_("",!0),l(f).update?(m(),k(O,{key:1},[w("a",{href:"javascript:void(0)",onClick:b=>s.openForm(a.id,a.parentId)},"\u7F16\u8F91",8,G),t(T,{type:"vertical"})],64)):_("",!0),l(f).delete?(m(),h(C,{key:2,title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:b=>s.deleteList(a.id),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:o(()=>[J]),_:2},1032,["onConfirm"])):_("",!0)]),_:1})]),_:1},8,["data","onToggleTreeExpand"])]),_:1},8,["tableData","onOnChange"]),t(A,{ref_key:"refForm",ref:x,onOnSuccess:e[6]||(e[6]=()=>s.findList())},null,512)])}}});export{oe as default};