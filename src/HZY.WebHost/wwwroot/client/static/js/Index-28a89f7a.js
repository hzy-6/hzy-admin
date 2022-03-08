var V=Object.defineProperty,D=Object.defineProperties;var J=Object.getOwnPropertyDescriptors;var S=Object.getOwnPropertySymbols;var U=Object.prototype.hasOwnProperty,M=Object.prototype.propertyIsEnumerable;var I=(t,e,l)=>e in t?V(t,e,{enumerable:!0,configurable:!0,writable:!0,value:l}):t[e]=l,h=(t,e)=>{for(var l in e||(e={}))U.call(e,l)&&I(t,l,e[l]);if(S)for(var l of S(e))M.call(e,l)&&I(t,l,e[l]);return t},T=(t,e)=>D(t,J(e));import{d as j,h as q,r as x,v as H,t as G,i as s,o as p,p as b,A as K,B as Q,l as o,j as a,c as f,e as g,q as c,k as W}from"./vendor-c8880a38.js";import{_ as X,A as Y,u as Z,r as ee,t as te}from"./index-cd10d498.js";import{I as oe,s as k}from"./Info-8846f6f0.js";const ae=j({name:"system_role",components:{AppIcons:Y,Info:oe},setup(){const t=Z(),e=q({table:{search:{state:!1,fieldCount:2,vm:{name:null}},loading:!1,pageSizeOptions:[10,20,50,100,500,1e3],rows:10,page:1,total:0,data:[]}}),l=x(null),v=x(null),w=t.getPowerByMenuId(ee.currentRoute.value.meta.menuId),m={onChange(i){const{currentPage:n,pageSize:d}=i;e.table.page=n==0?1:n,e.table.rows=d,m.findList()},onResetSearch(){e.table.page=1;let i=e.table.search.vm;for(let n in i)i[n]=null;m.findList()},findList(){e.table.loading=!0,k.findList(e.table.rows,e.table.page,e.table.search.vm).then(i=>{let n=i.data;e.table.loading=!1,e.table.page=n.page,e.table.rows=n.size,e.table.total=n.total,e.table.data=n.dataSource})},deleteList(i){let n=[];i?n.push(i):n=v.value.getCheckboxRecords().map(d=>d.id),k.deleteList(n).then(d=>{d.code==1&&(te.message("\u5220\u9664\u6210\u529F!","\u6210\u529F"),m.findList())})},openForm(i){l.value.openForm({visible:!0,key:i})},exportExcel(){k.exportExcel(e.table.search.vm)}};return H(()=>{m.findList()}),T(h(h({},G(e)),m),{power:w,refForm:l,refTable:v})}}),ne={class:"p-24"},se=c("\u67E5\u8BE2"),le=c("\u91CD\u7F6E"),ie={key:0},re=c("\xA0\xA0\u6536\u8D77"),de={key:1},pe=c("\xA0\xA0\u5C55\u5F00"),ce=c(" \u65B0\u5EFA "),ue=c(" \u6279\u91CF\u5220\u9664 "),me=c("\u5BFC\u51FA Excel"),fe=c(" \u66F4\u591A\u64CD\u4F5C "),_e=c("\u6B63\u5E38"),ge=c("\u505C\u7528"),be=["onClick"],ve=W("a",{class:"text-danger"},"\u5220\u9664",-1);function he(t,e,l,v,w,m){const i=s("a-input"),n=s("a-col"),d=s("a-button"),y=s("a-row"),C=s("a-card"),_=s("AppIcons"),z=s("a-popconfirm"),P=s("a-menu-item"),$=s("a-menu"),O=s("a-dropdown"),u=s("vxe-column"),L=s("a-tag"),F=s("a-divider"),N=s("vxe-table"),A=s("vxe-pager"),B=s("a-spin"),E=s("Info");return p(),b("div",ne,[K(o(C,{class:"mb-24"},{default:a(()=>[o(y,{gutter:[24,24]},{default:a(()=>[o(n,{xs:24,sm:12,md:8,lg:6,xl:4},{default:a(()=>[o(i,{value:t.table.search.vm.name,"onUpdate:value":e[0]||(e[0]=r=>t.table.search.vm.name=r),placeholder:"\u540D\u79F0"},null,8,["value"])]),_:1}),o(n,{xs:24,sm:12,md:8,lg:6,xl:4,style:{float:"right"}},{default:a(()=>[o(d,{type:"primary",class:"mr-24",onClick:t.findList},{default:a(()=>[se]),_:1},8,["onClick"]),o(d,{class:"mr-24",onClick:t.onResetSearch},{default:a(()=>[le]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},512),[[Q,t.table.search.state]]),o(C,null,{default:a(()=>[o(y,{gutter:[24,24]},{default:a(()=>[o(n,{xs:24,sm:24,md:12,lg:12,xl:12},{default:a(()=>[t.power.search?(p(),f(d,{key:0,class:"mr-24",onClick:e[1]||(e[1]=r=>t.table.search.state=!t.table.search.state)},{default:a(()=>[t.table.search.state?(p(),b("div",ie,[o(_,{name:"UpOutlined"}),re])):(p(),b("div",de,[o(_,{name:"DownOutlined"}),pe]))]),_:1})):g("",!0),t.power.insert?(p(),f(d,{key:1,type:"primary",class:"mr-24",onClick:e[2]||(e[2]=r=>t.openForm())},{icon:a(()=>[o(_,{name:"PlusOutlined"})]),default:a(()=>[ce]),_:1})):g("",!0),t.power.delete?(p(),f(z,{key:2,title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:e[3]||(e[3]=r=>t.deleteList()),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:a(()=>[o(d,{type:"danger",class:"mr-24"},{icon:a(()=>[o(_,{name:"DeleteOutlined"})]),default:a(()=>[ue]),_:1})]),_:1})):g("",!0)]),_:1}),o(n,{xs:24,sm:24,md:12,lg:12,xl:12,class:"text-right"},{default:a(()=>[o(O,null,{overlay:a(()=>[o($,null,{default:a(()=>[o(P,{key:"1",onClick:t.exportExcel},{default:a(()=>[me]),_:1},8,["onClick"])]),_:1})]),default:a(()=>[o(d,null,{default:a(()=>[fe,o(_,{name:"DownOutlined"})]),_:1})]),_:1})]),_:1})]),_:1}),o(B,{spinning:t.table.loading},{default:a(()=>[o(N,{class:"mt-24",ref:"refTable",size:"medium",border:"",stripe:"",data:t.table.data,"row-config":{isHover:!0},"column-config":{resizable:!0}},{default:a(()=>[o(u,{type:"checkbox",width:"60"}),o(u,{field:"number",title:"\u5C97\u4F4D\u7F16\u53F7"}),o(u,{field:"code",title:"\u5C97\u4F4D\u7F16\u7801"}),o(u,{field:"name",title:"\u89D2\u8272\u540D\u79F0"}),o(u,{field:"state",title:"\u72B6\u6001"},{default:a(({row:r})=>[r.state==1?(p(),f(L,{key:0,color:"success"},{default:a(()=>[_e]),_:1})):(p(),f(L,{key:1,color:"warning"},{default:a(()=>[ge]),_:1}))]),_:1}),o(u,{field:"lastModificationTime",title:"\u66F4\u65B0\u65F6\u95F4"}),o(u,{field:"creationTime",title:"\u521B\u5EFA\u65F6\u95F4"}),o(u,{field:"id",title:"\u64CD\u4F5C"},{default:a(({row:r})=>[t.power.update?(p(),b("a",{key:0,href:"javascript:void(0)",onClick:R=>t.openForm(r.id)},"\u7F16\u8F91",8,be)):g("",!0),o(F,{type:"vertical"}),t.power.delete?(p(),f(z,{key:1,title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:R=>t.deleteList(r.id),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:a(()=>[ve]),_:2},1032,["onConfirm"])):g("",!0)]),_:1})]),_:1},8,["data"]),o(A,{class:"mt-24",background:"","current-page":t.table.page,"onUpdate:current-page":e[4]||(e[4]=r=>t.table.page=r),"page-size":t.table.rows,"onUpdate:page-size":e[5]||(e[5]=r=>t.table.rows=r),total:t.table.total,"page-sizes":t.table.pageSizeOptions,layouts:["PrevJump","PrevPage","JumpNumber","NextPage","NextJump","Sizes","FullJump","Total"],onPageChange:t.onChange},null,8,["current-page","page-size","total","page-sizes","onPageChange"])]),_:1},8,["spinning"])]),_:1}),o(E,{ref:"refForm",onOnSuccess:e[6]||(e[6]=()=>t.findList())},null,512)])}var ze=X(ae,[["render",he]]);export{ze as default};
