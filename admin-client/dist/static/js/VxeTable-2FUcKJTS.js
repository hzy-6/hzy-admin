import{_ as u}from"./PageContainer.vue_vue_type_script_setup_true_lang-w--qcJ6v.js";import{d as _,b as w,f as i,o as m,l as p,w as o,a,g as n,c4 as b}from"./index-C9oHGpmd.js";import"./AppIcon.vue_vue_type_script_setup_true_lang-o_ph5tPH.js";const x=n("a",{href:"https://vxetable.cn/#/table/scroll/scroll",target:"_black"}," VxeTable 官网文档 ",-1),V=_({name:"VxeTableCom",__name:"VxeTable",setup(v){const s=w([]),f=(r,t)=>{let e=0;return r.forEach(l=>{e+=Number(l[t])}),b.round(e,2)},c=({columns:r,data:t})=>[r.map((l,d)=>{if(d===0)return"平均";switch(l.field){case"attr1":return f(t,"attr1")}return"-"})];return setTimeout(()=>{const r=[];for(let t=0;t<1e3;t++)r.push({name:"Test"+t,attr1:t,attr2:"a2-"+t,attr3:"a3-"+t,attr4:"a4-"+t,attr5:"a5-"+t,attr6:"a6-"+t,attr7:"a7-"+t,attr8:"a8-"+t,attr9:"a9-"+t,attr10:"a10-"+t,attr11:"a11-"+t,attr12:"a12-"+t,attr13:"a13-"+t,attr14:"a14-"+t});s.value=r},300),(r,t)=>{const e=i("vxe-column"),l=i("vxe-colgroup"),d=i("vxe-table",!0),h=i("a-card");return m(),p(u,null,{default:o(()=>[a(h,{title:"VxeTable 演示","body-style":{padding:0}},{extra:o(()=>[x]),default:o(()=>[n("div",null,[a(d,{border:"","show-overflow":"","show-header-overflow":"","show-footer-overflow":"","show-footer":"",height:"600px","footer-method":c,"scroll-x":{enabled:!0,gt:10},"scroll-y":{enabled:!0,gt:100},data:s.value},{default:o(()=>[a(e,{type:"seq",width:"100"}),a(e,{field:"name",title:"Name",width:"150",sortable:""}),a(l,{title:"分类1"},{default:o(()=>[a(e,{field:"attr1",title:"Attr1",width:"100"}),a(e,{field:"attr2",title:"Attr2",width:"100"}),a(e,{field:"attr3",title:"Attr3",width:"100"})]),_:1}),a(e,{field:"attr4",title:"Attr4",width:"100"}),a(e,{field:"attr5",title:"Attr5",width:"150",sortable:""}),a(e,{field:"attr6",title:"Attr6",width:"100"}),a(e,{field:"attr7",title:"Attr7",width:"100"}),a(e,{field:"attr8",title:"Attr8",width:"200","show-overflow":""}),a(e,{field:"attr9",title:"Attr9",width:"100"}),a(e,{field:"attr10",title:"Attr10",width:"100"}),a(l,{title:"分类2"},{default:o(()=>[a(e,{field:"attr11",title:"Attr11",width:"100"}),a(e,{field:"attr12",title:"Attr12",width:"100"}),a(e,{field:"attr13",title:"Attr13",width:"150",sortable:""}),a(e,{field:"attr14",title:"Attr14",width:"100"}),a(e,{field:"attr15",title:"Attr15",width:"100"})]),_:1})]),_:1},8,["data"])])]),_:1})]),_:1})}}});export{V as default};
