var j=Object.defineProperty;var S=Object.getOwnPropertySymbols;var q=Object.prototype.hasOwnProperty,E=Object.prototype.propertyIsEnumerable;var I=(o,r,d)=>r in o?j(o,r,{enumerable:!0,configurable:!0,writable:!0,value:d}):o[r]=d,N=(o,r)=>{for(var d in r||(r={}))q.call(r,d)&&I(o,d,r[d]);if(S)for(var d of S(r))E.call(r,d)&&I(o,d,r[d]);return o};import{p as y,b as H,i as O,r as G,a as R,c as p,j as g,d as K,L as Q,M as W,l as i,f as e,w as t,q as b,A as w,C as X,n as _,k as Y,e as Z,t as T}from"./index-0254a96f.js";const C="admin/low_code_table_info";var k={findList(o,r,d={}){return y(`${C}/findList/${o}/${r}`,d,!1)},deleteList(o){return o&&o.length===0?tools.message("\u8BF7\u9009\u62E9\u8981\u5220\u9664\u7684\u6570\u636E!","\u8B66\u544A"):y(`${C}/deleteList`,o,!1)},synchronization(o){return y(`${C}/synchronization/${o}`,null,!1)},change(o){return y(`${C}/change`,o,!1)}};const ee=_("\u67E5\u8BE2"),te=_("\u91CD\u7F6E"),ae=_(" \u68C0\u7D22 "),le=_(" \u540C\u6B65\u5B57\u6BB5 "),ne=_(" \u63D0\u4EA4\u66F4\u6539 "),oe=_(" \u6279\u91CF\u5220\u9664 "),se=_("\u662F"),ie=_("\u5426"),re=_("\u662F"),de=_("\u5426"),ce=Z("a",{class:"text-danger"},"\u5220\u9664",-1),ue={name:"LowCode-ColumnIndex"},fe=Object.assign(ue,{setup(o,{expose:r}){const d=H(),{params:U}=O.currentRoute.value,{id:B,title:pe}=U,a=G({table:{search:{state:!1,vm:{name:null,low_Code_TableId:B}},loading:!1,pageSizeOptions:[10,20,50,100,500,1e3],rows:10,page:1,total:0,data:[]},title:""}),D=R(null),L=R(null),F=d.getPowerByMenuId(O.currentRoute.value.meta.menuId),c={onChange(s){const{currentPage:l,pageSize:m}=s;a.table.page=l==0?1:l,a.table.rows=m,c.findList()},onResetSearch(){a.table.page=1;let s=a.table.search.vm;for(let l in s)l!="low_Code_TableId"&&(s[l]=null);c.findList()},findList(){a.table.loading=!0,k.findList(a.table.rows,a.table.page,a.table.search.vm).then(s=>{let l=s.data;a.table.loading=!1,a.table.page=l.page,a.table.rows=l.size,a.table.total=l.total,a.table.data=l.dataSource})},deleteList(s){let l=[];s?l.push(s):l=L.value.getCheckboxRecords().map(m=>m.id),k.deleteList(l).then(m=>{m.code==1&&(T.message("\u5220\u9664\u6210\u529F!","\u6210\u529F"),c.findList())})},openForm(s){D.value.openForm({visible:!0,key:s})},synchronization(){k.synchronization(a.table.search.vm.low_Code_TableId).then(s=>{T.message("\u540C\u6B65\u6210\u529F!","\u6210\u529F"),c.findList()})},change(){k.change(a.table.data).then(s=>{T.message("\u6570\u636E\u53D8\u66F4\u6210\u529F!","\u6210\u529F"),c.findList()})},loadData(s){a.table.search.vm.low_Code_TableId=s.id,c.findList()}};return r(N({},c)),(s,l)=>{const m=p("a-input"),h=p("a-col"),f=p("a-button"),z=p("a-row"),$=p("a-card"),x=p("a-popconfirm"),V=p("a-space"),u=p("vxe-column"),v=p("a-tag"),J=p("vxe-table"),A=p("vxe-pager"),M=p("a-spin");return g(),K("div",null,[Q(e($,{class:"mb-15"},{default:t(()=>[e(z,{gutter:[15,15]},{default:t(()=>[e(h,{xs:24,sm:12,md:8,lg:6,xl:4},{default:t(()=>[e(m,{value:i(a).table.search.vm.name,"onUpdate:value":l[0]||(l[0]=n=>i(a).table.search.vm.name=n),placeholder:"\u540D\u79F0"},null,8,["value"])]),_:1}),e(h,{xs:24,sm:12,md:8,lg:6,xl:4,style:{float:"right"}},{default:t(()=>[e(f,{type:"primary",class:"mr-15",onClick:c.findList},{default:t(()=>[ee]),_:1},8,["onClick"]),e(f,{class:"mr-15",onClick:c.onResetSearch},{default:t(()=>[te]),_:1},8,["onClick"])]),_:1})]),_:1})]),_:1},512),[[W,i(a).table.search.state]]),e($,null,{default:t(()=>[e(z,{gutter:[15,15]},{default:t(()=>[e(h,{xs:24,sm:24,md:12,lg:12,xl:12},{default:t(()=>[e(V,{size:15},{default:t(()=>[i(F).search?(g(),b(f,{key:0,onClick:l[1]||(l[1]=n=>i(a).table.search.state=!i(a).table.search.state)},{icon:t(()=>[e(w,{name:i(a).table.search.state?"UpOutlined":"DownOutlined"},null,8,["name"])]),default:t(()=>[ae]),_:1})):X("",!0),e(x,{title:"\u60A8\u786E\u5B9A\u8981\u66F4\u65B0\u8868\u5417?\u53EF\u80FD\u4F1A\u5BFC\u81F4\u6570\u636E\u4E22\u5931",onConfirm:l[2]||(l[2]=n=>c.synchronization()),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:t(()=>[e(f,{type:"primary"},{icon:t(()=>[e(w,{name:"ReloadOutlined"})]),default:t(()=>[le]),_:1})]),_:1}),e(x,{title:"\u60A8\u786E\u5B9A\u8981\u63D0\u4EA4\u66F4\u6539?",onConfirm:l[3]||(l[3]=n=>c.change()),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:t(()=>[e(f,{type:"primary"},{icon:t(()=>[e(w,{name:"PlusOutlined"})]),default:t(()=>[ne]),_:1})]),_:1}),e(x,{title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:l[4]||(l[4]=n=>c.deleteList()),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:t(()=>[e(f,{type:"danger"},{icon:t(()=>[e(w,{name:"DeleteOutlined"})]),default:t(()=>[oe]),_:1})]),_:1})]),_:1})]),_:1}),e(h,{xs:24,sm:24,md:12,lg:12,xl:12,class:"text-right"})]),_:1}),e(M,{spinning:i(a).table.loading},{default:t(()=>[e(J,{class:"mt-15",ref_key:"refTable",ref:L,size:"medium",border:"",stripe:"",data:i(a).table.data,"row-config":{isCurrent:!0,isHover:!0},"column-config":{isCurrent:!0,resizable:!0},"checkbox-config":{highlight:!0},"edit-config":{trigger:"click",mode:"cell"}},{default:t(()=>[e(u,{type:"seq",width:"50"}),e(u,{type:"checkbox",width:"50"}),e(u,{field:"columnName",title:"\u5217\u540D\u79F0"}),e(u,{field:"databaseColumnType",title:"\u6570\u636E\u5E93\u7C7B\u578B",width:"130px"}),e(u,{field:"csField",title:"C#\u5B57\u6BB5\u540D\u79F0"}),e(u,{field:"csType",title:"C#\u6570\u636E\u7C7B\u578B",width:"100px"}),e(u,{field:"isPrimary",title:"\u662F\u5426\u4E3B\u952E",width:"100px"},{default:t(({row:n})=>[n.isPrimary?(g(),b(v,{key:0,color:"success"},{default:t(()=>[se]),_:1})):(g(),b(v,{key:1,color:"default"},{default:t(()=>[ie]),_:1}))]),_:1}),e(u,{field:"isIdentity",title:"\u662F\u5426\u81EA\u589E",width:"100px"},{default:t(({row:n})=>[n.isIdentity?(g(),b(v,{key:0,color:"success"},{default:t(()=>[re]),_:1})):(g(),b(v,{key:1,color:"default"},{default:t(()=>[de]),_:1}))]),_:1}),e(u,{field:"describe",title:"\u5217\u663E\u793A\u540D\u79F0","edit-render":{},width:"150px"},{default:t(({row:n})=>[_(Y(n.describe),1)]),edit:t(({row:n})=>[e(m,{value:n.describe,"onUpdate:value":P=>n.describe=P,placeholder:"\u5217\u663E\u793A\u540D\u79F0"},null,8,["value","onUpdate:value"])]),_:1}),e(u,{field:"lastModificationTime",title:"\u66F4\u65B0\u65F6\u95F4",width:"120px"}),e(u,{field:"creationTime",title:"\u521B\u5EFA\u65F6\u95F4",width:"120px"}),e(u,{field:"id",title:"\u64CD\u4F5C",width:"80px"},{default:t(({row:n})=>[e(x,{title:"\u60A8\u786E\u5B9A\u8981\u5220\u9664\u5417?",onConfirm:P=>c.deleteList(n.id),okText:"\u786E\u5B9A",cancelText:"\u53D6\u6D88"},{default:t(()=>[ce]),_:2},1032,["onConfirm"])]),_:1})]),_:1},8,["data"]),e(A,{background:"","current-page":i(a).table.page,"onUpdate:current-page":l[5]||(l[5]=n=>i(a).table.page=n),"page-size":i(a).table.rows,"onUpdate:page-size":l[6]||(l[6]=n=>i(a).table.rows=n),total:i(a).table.total,"page-sizes":i(a).table.pageSizeOptions,layouts:["PrevJump","PrevPage","JumpNumber","NextPage","NextJump","Sizes","FullJump","Total"],onPageChange:c.onChange},null,8,["current-page","page-size","total","page-sizes","onPageChange"])]),_:1},8,["spinning"])]),_:1})])}}});export{fe as default};