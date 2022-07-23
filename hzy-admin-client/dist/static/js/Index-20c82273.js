import{b as R,r as U,V as z,a as O,l as S,o as A,c as d,m as r,d as _,h as a,w as t,g as l,q as f,A as k,C as h,F as x,x as $,n as c,e as D,t as P,aS as K,f as M}from"./index-12b7a0f1.js";import q from"./List-5a4e8021.js";import{I as G,s as y}from"./Info-a7b7913d.js";import"./WangEditor-e01e1ba8.js";import"./FindBack-2ad2ee03.js";import"./Index-ff53a8ae.js";import"./Info-b65119be.js";import"./organizationService-6c5bef3d.js";const H=c("\u67E5\u8BE2"),J=c("\u91CD\u7F6E"),Q=c(" \u65B0\u5EFA "),W=c(" \u6279\u91CF\u5220\u9664 "),X=c("\u5BFC\u51FA Excel"),Y=c(" \u66F4\u591A\u64CD\u4F5C "),Z=c("\u91CD\u7F6E"),ee=c(" \u68C0\u7D22 "),te=["src"],oe=["onClick"],ne=["onClick"],ae=D("a",{class:"text-danger"},"\u5220\u9664",-1),le={name:"base_member"},fe=Object.assign(le,{setup(se){const F=R(),n=U({search:{state:!1,fieldCount:2,vm:{name:""}},loading:!1,pageSizeOptions:[10,20,50,100,500,1e3],rows:10,page:1,total:0,columns:[],data:[],domainName:z.domainName}),b=O(null),g=O(null),u=F.getPowerByMenuId(S.currentRoute.value.meta.menuId),s={onChange(i){const{currentPage:e,pageSize:m}=i;n.page=e==0?1:e,n.rows=m,s.findList()},onResetSearch(){n.page=1;let i=n.search.vm;for(let e in i)i[e]="";s.findList()},findList(){n.loading=!0,y.findList(n.rows,n.page,n.search.vm).then(i=>{debugger;let e=i.data;n.loading=!1,n.page=e.page,n.rows=e.size,n.total=e.total,n.columns=e.columns,n.data=e.dataSource})},deleteList(i){let e=[];i?e.push(i):e=g.value.table.getCheckboxRecords().map(m=>m.id),y.deleteList(e).then(m=>{m.code==1&&(P.message("\u5220\u9664\u6210\u529F!","\u6210\u529F"),s.findList())})},openForm(i){b.value.openForm({visible:!0,key:i})},exportExcel(){y.exportExcel(n.search.vm)},jumpDetails(i){S.push(`/base/member/details/${i.id}/${i.name}`)}};return A(()=>{s.findList()}),(i,e)=>{const m=d("a-input"),w=d("a-col"),p=d("a-button"),B=d("a-row"),L=d("a-popconfirm"),T=d("a-menu-item"),V=d("a-menu"),j=d("a-dropdown"),E=d("a-checkbox"),I=d("a-popover"),C=d("vxe-column"),N=d("a-divider");return r(),_("div",null,[a(q,{ref_key:"refList",ref:g,tableData:l(n),onOnChange:s.onChange},{search:t(()=>[a(B,{gutter:[15,15]},{default:t(()=>[a(w,{xs:24,sm:12,md:8,lg:6,xl:4},{default:t(()=>[a(m,{value:l(n).search.vm.name,"onUpdate:value":e[0]||(e[0]=o=>l(n).search.vm.name=o),placeholder:"\u540D\u79F0"},null,8,["value"])]),_:1}),a(w,{xs:24,sm:12,md:8,lg:6,xl:4,style:{float:"right"}},{default:t(()=>[a(p,{type:"primary",class:"mr-15",onClick:s.findList},{default:t(()=>[H]),_:1},8,["onClick"]),a(p,{class:"mr-15",onClick:s.onResetSearch},{default:t(()=>[J]),_:1},8,["onClick"])]),_:1})]),_:1})]),"toolbar-left":t(()=>[l(u).insert?(r(),f(p,{key:0,type:"primary",onClick:e[1]||(e[1]=o=>s.openForm())},{icon:t(()=>[a(k,{name:"PlusOutlined"})]),default:t(()=>[Q]),_:1})):h("",!0),l(u).delete?(r(),f(L,{key:1,title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:e[2]||(e[2]=o=>s.deleteList()),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:t(()=>[a(p,{type:"danger"},{icon:t(()=>[a(k,{name:"DeleteOutlined"})]),default:t(()=>[W]),_:1})]),_:1})):h("",!0),a(j,null,{overlay:t(()=>[a(V,null,{default:t(()=>[a(T,{key:"1",onClick:s.exportExcel},{default:t(()=>[X]),_:1},8,["onClick"])]),_:1})]),default:t(()=>[a(p,null,{default:t(()=>[Y,a(k,{name:"DownOutlined"})]),_:1})]),_:1})]),"toolbar-right":t(()=>[a(m,{value:l(n).search.vm.name,"onUpdate:value":e[3]||(e[3]=o=>l(n).search.vm.name=o),placeholder:"\u540D\u79F0",onKeyup:s.findList},null,8,["value","onKeyup"]),a(p,{onClick:s.onResetSearch},{default:t(()=>[Z]),_:1},8,["onClick"]),l(u).search?(r(),f(p,{key:0,onClick:e[4]||(e[4]=o=>l(n).search.state=!l(n).search.state)},{icon:t(()=>[a(k,{name:l(n).search.state?"UpOutlined":"DownOutlined"},null,8,["name"])]),default:t(()=>[ee]),_:1})):h("",!0),a(I,null,{content:t(()=>[(r(!0),_(x,null,$(l(n).columns.filter(o=>o.fieldName.substr(0,1)!="_"),o=>(r(),_("div",null,[a(E,{checked:o.show,"onUpdate:checked":v=>o.show=v,onChange:e[5]||(e[5]=()=>K(()=>g.value.table.refreshColumn()))},{default:t(()=>[c(M(o.title),1)]),_:2},1032,["checked","onUpdate:checked"])]))),256))]),default:t(()=>[a(p,null,{default:t(()=>[a(k,{name:"BarsOutlined"})]),_:1})]),_:1})]),"table-col-default":t(()=>[(r(!0),_(x,null,$(l(n).columns.filter(o=>o.fieldName!="id"),o=>(r(),_(x,null,[o.fieldName=="photo"?(r(),f(C,{field:o.fieldName,title:o.title,visible:o.show,key:o.id},{default:t(({row:v})=>[D("img",{src:l(n).domainName+v.photo,width:"35",height:"35"},null,8,te)]),_:2},1032,["field","title","visible"])):(r(),f(C,{field:o.fieldName,title:o.title,visible:o.show,key:o.id},null,8,["field","title","visible"]))],64))),256)),l(u).update||l(u).delete?(r(),f(C,{key:0,field:"id",title:"\u64CD\u4F5C"},{default:t(({row:o})=>[l(u).update?(r(),_("a",{key:0,href:"javascript:void(0)",onClick:v=>s.jumpDetails(o)},"\u8BE6\u60C5",8,oe)):h("",!0),a(N,{type:"vertical"}),l(u).update?(r(),_("a",{key:1,href:"javascript:void(0)",onClick:v=>s.openForm(o.id)},"\u7F16\u8F91",8,ne)):h("",!0),a(N,{type:"vertical"}),l(u).delete?(r(),f(L,{key:2,title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:v=>s.deleteList(o.id),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:t(()=>[ae]),_:2},1032,["onConfirm"])):h("",!0)]),_:1})):h("",!0)]),_:1},8,["tableData","onOnChange"]),a(G,{ref_key:"refForm",ref:b,onOnSuccess:e[6]||(e[6]=()=>s.findList())},null,512)])}}});export{fe as default};
