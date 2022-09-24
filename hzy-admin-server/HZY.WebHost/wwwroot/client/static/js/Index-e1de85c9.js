import{b as B,r as I,a as T,l as N,o as R,c as i,m as c,d as g,h as e,w as t,g as s,q as _,A as D,z as p,n as d,f as w,aW as V,e as j,aS as z,t as E}from"./index-7205fff8.js";import U from"./List-e8e19a74.js";import Y from"./Info-645458de.js";import{o as S}from"./organizationService-ea1e06b6.js";const K=d(" \u6B63\u5E38 "),P=d(" \u505C\u7528 "),q=d("\u67E5\u8BE2"),H=d("\u91CD\u7F6E"),W=d("\u5173\u95ED"),G=d(" \u9AD8\u7EA7\u68C0\u7D22 "),J=d(" \u65B0\u5EFA "),Q=d("\u6B63\u5E38"),X=d("\u505C\u7528"),Z=["onClick"],ee=["onClick"],te=j("a",{class:"text-danger"},"\u5220\u9664",-1),ae={name:"system_organization"},ie=Object.assign(ae,{setup(oe){const F=B(),n=I({search:{state:!1,vm:{name:null,state:1}},loading:!1,data:[]}),k=T(null),y=T(null),m=F.getPowerByMenuId(N.currentRoute.value.meta.menuId),l={onResetSearch(){let r=n.search.vm;for(let a in r)r[a]=null;r.state=1,l.findList()},findList(){n.loading=!0,S.findList(n.search.vm).then(r=>{let a=r.data;n.loading=!1,n.data=a,z(()=>{l.setAllTreeExpand()})})},deleteList(r){let a=[];r&&a.push(r),S.deleteList(a).then(v=>{v.code==1&&(E.message("\u5220\u9664\u6210\u529F!","\u6210\u529F"),l.findList())})},openForm(r,a){k.value.openForm({visible:!0,key:r,parentId:a})},formatDate(r){return V(r).format("YYYY-MM-DD")},setAllTreeExpand(){y.value.setAllTreeExpand(!0)}};return R(()=>{l.findList()}),(r,a)=>{const v=i("a-input"),h=i("a-col"),x=i("a-radio"),O=i("a-radio-group"),f=i("a-button"),A=i("a-row"),u=i("vxe-column"),C=i("a-tag"),b=i("a-divider"),M=i("a-popconfirm"),$=i("vxe-table");return c(),g("div",null,[e(U,{ref:"refList",tableData:s(n),onOnChange:l.onChange},{search:t(()=>[e(A,{gutter:[15,15]},{default:t(()=>[e(h,{xs:24,sm:12,md:8,lg:6,xl:4},{default:t(()=>[e(v,{value:s(n).search.vm.name,"onUpdate:value":a[0]||(a[0]=o=>s(n).search.vm.name=o),placeholder:"\u540D\u79F0"},null,8,["value"])]),_:1}),e(h,{xs:24,sm:12,md:8,lg:6,xl:4},{default:t(()=>[e(O,{value:s(n).search.vm.state,"onUpdate:value":a[1]||(a[1]=o=>s(n).search.vm.state=o)},{default:t(()=>[e(x,{value:1},{default:t(()=>[K]),_:1}),e(x,{value:2},{default:t(()=>[P]),_:1})]),_:1},8,["value"])]),_:1}),e(h,{xs:24,sm:12,md:8,lg:6,xl:4,style:{float:"right"}},{default:t(()=>[e(f,{type:"primary",class:"mr-15",onClick:l.findList},{default:t(()=>[q]),_:1},8,["onClick"]),e(f,{class:"mr-15",onClick:l.onResetSearch},{default:t(()=>[H]),_:1},8,["onClick"]),e(f,{type:"danger",class:"mr-15",onClick:a[2]||(a[2]=o=>s(n).search.state=!1)},{default:t(()=>[W]),_:1})]),_:1})]),_:1})]),toolbar:t(()=>[e(v,{value:s(n).search.vm.name,"onUpdate:value":a[3]||(a[3]=o=>s(n).search.vm.name=o),placeholder:"\u540D\u79F0",onKeyup:l.findList},null,8,["value","onKeyup"]),s(m).search?(c(),_(f,{key:0,onClick:a[4]||(a[4]=o=>s(n).search.state=!s(n).search.state)},{icon:t(()=>[e(D,{name:s(n).search.state?"UpOutlined":"DownOutlined"},null,8,["name"])]),default:t(()=>[G]),_:1})):p("",!0),s(m).insert?(c(),_(f,{key:1,type:"primary",onClick:a[5]||(a[5]=o=>l.openForm())},{icon:t(()=>[e(D,{name:"PlusOutlined"})]),default:t(()=>[J]),_:1})):p("",!0)]),table:t(()=>[e($,{class:"mt-15",ref_key:"refTable",ref:y,border:"",stripe:"",data:s(n).data,"row-config":{isCurrent:!0,isHover:!0},"column-config":{isCurrent:!0,resizable:!0},"checkbox-config":{highlight:!0},"tree-config":{transform:!0,rowField:"id",parentField:"parentId"}},{default:t(()=>[e(u,{field:"name",title:"\u90E8\u95E8\u540D\u79F0","tree-node":""}),e(u,{field:"orderNumber",title:"\u6392\u5E8F\u53F7"}),e(u,{field:"levelCode",title:"\u7EA7\u522B\u7801"}),e(u,{field:"state",title:"\u72B6\u6001"},{default:t(({row:o})=>[o.state==1?(c(),_(C,{key:0,color:"success"},{default:t(()=>[Q]),_:1})):(c(),_(C,{key:1,color:"warning"},{default:t(()=>[X]),_:1}))]),_:1}),e(u,{field:"lastModificationTime",title:"\u66F4\u65B0\u65F6\u95F4"},{default:t(({row:o})=>[d(w(l.formatDate(o.lastModificationTime)),1)]),_:1}),e(u,{field:"creationTime",title:"\u521B\u5EFA\u65F6\u95F4"},{default:t(({row:o})=>[d(w(l.formatDate(o.creationTime)),1)]),_:1}),e(u,{field:"id",title:"\u64CD\u4F5C"},{default:t(({row:o})=>[s(m).insert?(c(),g("a",{key:0,href:"javascript:void(0)",onClick:L=>l.openForm(null,o.id)},"\u65B0\u5EFA",8,Z)):p("",!0),e(b,{type:"vertical"}),s(m).update?(c(),g("a",{key:1,href:"javascript:void(0)",onClick:L=>l.openForm(o.id)},"\u7F16\u8F91",8,ee)):p("",!0),e(b,{type:"vertical"}),s(m).delete?(c(),_(M,{key:2,title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:L=>l.deleteList(o.id),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:t(()=>[te]),_:2},1032,["onConfirm"])):p("",!0)]),_:1})]),_:1},8,["data"])]),_:1},8,["tableData","onOnChange"]),e(Y,{ref_key:"formRef",ref:k,onOnSuccess:a[6]||(a[6]=()=>l.findList())},null,512)])}}});export{ie as default};
