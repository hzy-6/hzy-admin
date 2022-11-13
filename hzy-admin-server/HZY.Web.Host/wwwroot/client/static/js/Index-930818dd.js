import{_ as H,b as X,r as G,K as J,a as T,i as Q,I as z,o as W,j as d,k as i,c as h,g as o,w as n,d as U,f as l,F as R,H as N,A as y,q as v,E as m,n as c,X as F,t as b,s as $,S as Y,e as Z,l as ee,m as te}from"./index-c3cea2d3.js";import ne from"./List-d1d0409f.js";import ae from"./Info-ea2be7d2.js";import{o as oe}from"./organizationService-11fbe8ab.js";const se=x=>(ee("data-v-b8ee3a19"),x=x(),te(),x),le=c("\u67E5\u8BE2"),re=c("\u91CD\u7F6E"),de=c("\u5173\u95ED"),ie=c(" \u9AD8\u7EA7\u68C0\u7D22 "),ue=c(" \u65B0\u5EFA "),ce=c(" \u6279\u91CF\u5220\u9664 "),pe=c(" \u5E26\u56DE\u6570\u636E "),me=c("\u5BFC\u51FA Excel"),fe=c(" \u66F4\u591A\u64CD\u4F5C "),_e=["onClick"],ge=se(()=>U("a",{class:"text-danger"},"\u5220\u9664",-1)),ke={name:"system_user"},ve=Object.assign(ke,{props:{isFindBack:{type:Boolean,default(){return!1}},defaultRowIds:Array,type:{type:Boolean,default(){return!0}}},emits:["onChange"],setup(x,{emit:D}){const f=x,E=X(),t=G({search:{state:!1,vm:{name:null,loginName:null,organizationId:null}},loading:!1,pageSizeOptions:[10,20,50,100,500,1e3],rows:10,page:1,total:0,columns:[],data:[],tree:{data:[],expandedKeys:[],selectedKeys:[],loadingTree:!1},findBack:{defaultRowIds:J(()=>f.defaultRowIds)}}),K=T(null),_=T(null),g=E.getPowerByMenuId(Q.currentRoute.value.meta.menuId),r={onChange(s){const{currentPage:e,pageSize:u}=s;t.page=e==0?1:e,t.rows=u,r.findList()},onResetSearch(){t.page=1;let s=t.search.vm;for(let e in s)s[e]=null;r.findList()},findList(){t.loading=!0,F.findList(t.rows,t.page,t.search.vm).then(s=>{let e=s.data;t.loading=!1,t.page=e.page,t.rows=e.size,t.total=e.total,t.columns=e.columns,t.data=e.dataSource,r.findBack.setCheckboxRow()})},deleteList(s){let e=[];s?e.push(s):e=_.value.table.getCheckboxRecords().map(u=>u.id),F.deleteList(e).then(u=>{u.code==1&&(b.message("\u5220\u9664\u6210\u529F!",$.success),r.findList())})},openForm(s){if(!s&&!t.search.vm.organizationId)return b.message("\u8BF7\u9009\u62E9\u7EC4\u7EC7!",$.warn);K.value.openForm({visible:!0,key:s,organizationId:t.search.vm.organizationId})},exportExcel(){F.exportExcel(t.search.vm)},sysOrganizationTree(){t.tree.loadingTree=!0,oe.sysOrganizationTree().then(s=>{t.tree.loadingTree=!1;let e=s.data;t.tree.data=e.rows,t.tree.expandedKeys=e.expandedRowKeys,r.findList()})},getFirst(){t.tree.selectedKeys=[]},findBack:{initRows(){!f.isFindBack||z(()=>f.defaultRowIds,s=>{r.findBack.setCheckboxRow()})},setCheckboxRow(){!f.isFindBack||(_.value.table.setAllCheckboxRow(!1),_.value.table.setCheckboxRow(r.findBack.getRowsByIds(t.findBack.defaultRowIds),!0))},onChange(){if(!!f.isFindBack){var s=_.value.table.getCheckboxRecords();if(s&&s.length==0)return b.message("\u8BF7\u9009\u62E9\u4E00\u6761\u6570\u636E!","\u8B66\u544A");if(f.type&&s.length>1)return b.message("\u53EA\u80FD\u9009\u62E9\u4E00\u6761\u6570\u636E!","\u8B66\u544A");D("onChange",_.value.table.getCheckboxRecords())}},getRowsByIds(s){if(!!f.isFindBack){var e=[],u=t.data;for(let C=0;C<u.length;C++){const w=u[C];s.filter(k=>k==w.id).length>0&&e.push(w)}return e}}}};return r.findBack.initRows(),z(()=>t.tree.selectedKeys,s=>{t.search.vm.organizationId=s.length>0?s[0]:null,r.findList()}),W(()=>{r.sysOrganizationTree()}),(s,e)=>{const u=d("a-tree"),C=d("a-spin"),w=d("a-card"),k=d("a-col"),B=d("a-input"),p=d("a-button"),L=d("a-row"),A=d("a-checkbox"),V=d("a-popover"),O=d("a-popconfirm"),j=d("a-menu-item"),P=d("a-menu"),M=d("a-dropdown"),S=d("vxe-column"),q=d("a-divider");return i(),h("div",null,[o(L,{gutter:[15,15]},{default:n(()=>[o(k,{xs:24,sm:12,md:12,lg:5,xl:5},{default:n(()=>[o(w,{title:"\u7EC4\u7EC7\u67B6\u6784",class:"w100 mb-15 min-height"},{extra:n(()=>[U("a",{href:"javascript:void(0)",onClick:e[0]||(e[0]=(...a)=>r.getFirst&&r.getFirst(...a))},"\u67E5\u770B\u4E00\u7EA7")]),default:n(()=>[o(C,{spinning:l(t).tree.loadingTree},{default:n(()=>[o(u,{expandedKeys:l(t).tree.expandedKeys,"onUpdate:expandedKeys":e[1]||(e[1]=a=>l(t).tree.expandedKeys=a),selectedKeys:l(t).tree.selectedKeys,"onUpdate:selectedKeys":e[2]||(e[2]=a=>l(t).tree.selectedKeys=a),"tree-data":l(t).tree.data},null,8,["expandedKeys","selectedKeys","tree-data"])]),_:1},8,["spinning"])]),_:1})]),_:1}),o(k,{xs:24,sm:12,md:12,lg:19,xl:19},{default:n(()=>[o(ne,{ref_key:"refList",ref:_,tableData:l(t),onOnChange:r.onChange},{search:n(()=>[o(L,{gutter:[15,15]},{default:n(()=>[o(k,{xs:24,sm:12,md:8,lg:6,xl:6},{default:n(()=>[o(B,{value:l(t).search.vm.name,"onUpdate:value":e[3]||(e[3]=a=>l(t).search.vm.name=a),placeholder:"\u771F\u5B9E\u540D\u79F0"},null,8,["value"])]),_:1}),o(k,{xs:24,sm:12,md:8,lg:6,xl:6},{default:n(()=>[o(B,{value:l(t).search.vm.loginName,"onUpdate:value":e[4]||(e[4]=a=>l(t).search.vm.loginName=a),placeholder:"\u8D26\u6237\u540D\u79F0"},null,8,["value"])]),_:1}),o(k,{xs:24,sm:12,md:8,lg:6,xl:6,style:{float:"right"}},{default:n(()=>[o(p,{type:"primary",class:"mr-15",onClick:r.findList},{default:n(()=>[le]),_:1},8,["onClick"]),o(p,{class:"mr-15",onClick:r.onResetSearch},{default:n(()=>[re]),_:1},8,["onClick"]),o(p,{type:"danger",class:"mr-15",onClick:e[5]||(e[5]=a=>l(t).search.state=!1)},{default:n(()=>[de]),_:1})]),_:1})]),_:1})]),toolbar:n(()=>[o(V,null,{content:n(()=>[(i(!0),h(R,null,N(l(t).columns.filter(a=>a.fieldName.substr(0,1)!="_"),a=>(i(),h("div",null,[o(A,{checked:a.show,"onUpdate:checked":I=>a.show=I,onChange:e[6]||(e[6]=()=>Y(()=>_.value.table.refreshColumn()))},{default:n(()=>[c(Z(a.title),1)]),_:2},1032,["checked","onUpdate:checked"])]))),256))]),default:n(()=>[o(p,null,{default:n(()=>[o(y,{name:"BarsOutlined"})]),_:1})]),_:1}),o(B,{value:l(t).search.vm.name,"onUpdate:value":e[7]||(e[7]=a=>l(t).search.vm.name=a),placeholder:"\u540D\u79F0",onKeyup:r.findList},null,8,["value","onKeyup"]),l(g).search?(i(),v(p,{key:0,onClick:e[8]||(e[8]=a=>l(t).search.state=!l(t).search.state)},{icon:n(()=>[o(y,{name:l(t).search.state?"UpOutlined":"DownOutlined"},null,8,["name"])]),default:n(()=>[ie]),_:1})):m("",!0),l(g).insert&&!s.$props.isFindBack?(i(),v(p,{key:1,type:"primary",onClick:e[9]||(e[9]=a=>r.openForm())},{icon:n(()=>[o(y,{name:"PlusOutlined"})]),default:n(()=>[ue]),_:1})):m("",!0),l(g).delete&&!s.$props.isFindBack?(i(),v(O,{key:2,title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:e[10]||(e[10]=a=>r.deleteList()),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:n(()=>[o(p,{type:"danger"},{icon:n(()=>[o(y,{name:"DeleteOutlined"})]),default:n(()=>[ce]),_:1})]),_:1})):m("",!0),s.$props.isFindBack?(i(),v(p,{key:3,type:"primary",onClick:e[11]||(e[11]=a=>r.findBack.onChange())},{icon:n(()=>[o(y,{name:"CheckOutlined"})]),default:n(()=>[pe]),_:1})):m("",!0),o(M,null,{overlay:n(()=>[o(P,null,{default:n(()=>[o(j,{key:"1",onClick:r.exportExcel},{default:n(()=>[me]),_:1},8,["onClick"])]),_:1})]),default:n(()=>[o(p,null,{default:n(()=>[fe,o(y,{name:"DownOutlined"})]),_:1})]),_:1})]),"table-col-default":n(()=>[(i(!0),h(R,null,N(l(t).columns.filter(a=>a.fieldName!="id"),a=>(i(),h(R,null,[a.fieldName!="id"?(i(),v(S,{field:a.fieldName,title:a.title,visible:a.show,key:a.id},null,8,["field","title","visible"])):m("",!0)],64))),256)),(l(g).update||l(g).delete)&&!s.$props.isFindBack?(i(),v(S,{key:0,field:"id",title:"\u64CD\u4F5C"},{default:n(({row:a})=>[l(g).update?(i(),h("a",{key:0,href:"javascript:void(0)",onClick:I=>r.openForm(a.id)},"\u7F16\u8F91",8,_e)):m("",!0),o(q,{type:"vertical"}),l(g).delete?(i(),v(O,{key:1,title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:I=>r.deleteList(a.id),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:n(()=>[ge]),_:2},1032,["onConfirm"])):m("",!0)]),_:1})):m("",!0)]),_:1},8,["tableData","onOnChange"])]),_:1})]),_:1}),o(ae,{ref_key:"refForm",ref:K,onOnSuccess:e[12]||(e[12]=()=>r.findList())},null,512)])}}}),we=H(ve,[["__scopeId","data-v-b8ee3a19"]]);export{we as default};