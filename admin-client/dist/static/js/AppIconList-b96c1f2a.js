import{d as I,r as x,U as w,e as z,o as n,c as a,g as s,a as p,t as l,O as d,i as m,G as u,z as k,v as A,D as y,a2 as N,V as B,p as S,k as V}from"./index-1d3290fc.js";import{_ as h}from"./AppIcon.vue_vue_type_script_setup_true_lang-5c9d9d70.js";import{_ as $}from"./_plugin-vue_export-helper-c27b6911.js";const L=o=>(S("data-v-6e4644a2"),o=o(),V(),o),E={class:"hzy-icon-list"},b={style:{display:"flex","align-items":"center","justify-content":"center"}},D={class:"hzy-icon-show"},P={class:"ml-10"},T=L(()=>s("h4",{class:"mt-24"},[m("更多图表请自行扩展："),s("a",{href:"https://www.xicons.org/#/",target:"_blank"},"https://www.xicons.org/#/")],-1)),j=["onClick"],F={class:"ml-10"},G={key:1,class:"icon-list pt-16"},M=["onClick"],O={class:"ml-10"},U=I({__name:"AppIconList",props:{name:null,height:null},emits:["update:name","onChangeName"],setup(o,{emit:v}){const i=o,e=x({active:1,names:[],count1:0,count2:0}),g=w(),f=c=>{v("update:name",c),v("onChangeName",c)},_=c=>{e.active=c,c===1&&(e.names=N(g),e.count1=e.names.length),c===2&&(e.names=B(g),e.count2=e.names.length)};return z(()=>{_(e.active)}),(c,r)=>(n(),a("div",E,[s("div",b,[s("div",D,[p(h,{name:i.name,size:40,color:"#fff"},null,8,["name"])]),s("h4",P,l(i.name),1)]),T,s("ul",null,[s("li",{class:d({active:e.active===1}),onClick:r[0]||(r[0]=t=>_(1))},[m(" Antd "),e.count1>0?(n(),a(u,{key:0},[m(" （数量:"+l(e.count1)+"个） ",1)],64)):k("",!0)],2),s("li",{class:d({active:e.active===2}),onClick:r[1]||(r[1]=t=>_(2))},[m(" Element Plus "),e.count2>0?(n(),a(u,{key:0},[m(" （数量:"+l(e.count2)+"个） ",1)],64)):k("",!0)],2)]),i.height&&i.height>0?(n(),a("div",{key:0,class:"icon-list pt-16",style:A({height:i.height+"px"})},[(n(!0),a(u,null,y(e.names,t=>(n(),a("div",{class:d(["icon-list-item",{active:o.name==t}]),onClick:C=>f(t)},[p(h,{name:t,size:20},null,8,["name"]),s("div",F,l(t),1)],10,j))),256))],4)):(n(),a("div",G,[(n(!0),a(u,null,y(e.names,t=>(n(),a("div",{class:d(["icon-list-item",{active:o.name==t}]),onClick:C=>f(t)},[p(h,{name:t,size:20},null,8,["name"]),s("div",O,l(t),1)],10,M))),256))]))]))}});const K=$(U,[["__scopeId","data-v-6e4644a2"]]);export{K as default};