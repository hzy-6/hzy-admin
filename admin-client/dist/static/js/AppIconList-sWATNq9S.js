import{d as w,r as x,V as z,e as N,o as a,c as o,g as s,a as h,t as l,S as d,j as m,M as p,B as k,x as A,G as y,a1 as B,W as S,p as V,k as $}from"./index-C9oHGpmd.js";import{_}from"./AppIcon.vue_vue_type_script_setup_true_lang-o_ph5tPH.js";import{_ as E}from"./_plugin-vue_export-helper-x3n3nnut.js";const L=c=>(V("data-v-e28cce60"),c=c(),$(),c),b={class:"hzy-icon-list"},j={style:{display:"flex","align-items":"center","justify-content":"center"}},M={class:"hzy-icon-show"},P={class:"ml-10"},T=L(()=>s("h4",{class:"mt-24"},[m("更多图表请自行扩展："),s("a",{href:"https://www.xicons.org/#/",target:"_blank"},"https://www.xicons.org/#/")],-1)),D=["onClick"],F={class:"ml-10"},G={key:1,class:"icon-list pt-16"},W=["onClick"],q={class:"ml-10"},H=w({__name:"AppIconList",props:{name:{},height:{}},emits:["update:name","onChangeName"],setup(c,{emit:C}){const i=c,v=C,e=x({active:1,names:[],count1:0,count2:0}),g=z(),f=n=>{v("update:name",n),v("onChangeName",n)},u=n=>{e.active=n,n===1&&(e.names=B(g),e.count1=e.names.length),n===2&&(e.names=S(g),e.count2=e.names.length)};return N(()=>{u(e.active)}),(n,r)=>(a(),o("div",b,[s("div",j,[s("div",M,[h(_,{name:i.name,size:40,color:"#fff"},null,8,["name"])]),s("h4",P,l(i.name),1)]),T,s("ul",null,[s("li",{class:d({active:e.active===1}),onClick:r[0]||(r[0]=t=>u(1))},[m(" Antd "),e.count1>0?(a(),o(p,{key:0},[m(" （数量:"+l(e.count1)+"个） ",1)],64)):k("",!0)],2),s("li",{class:d({active:e.active===2}),onClick:r[1]||(r[1]=t=>u(2))},[m(" Element Plus "),e.count2>0?(a(),o(p,{key:0},[m(" （数量:"+l(e.count2)+"个） ",1)],64)):k("",!0)],2)]),i.height&&i.height>0?(a(),o("div",{key:0,class:"icon-list pt-16",style:A({height:i.height+"px"})},[(a(!0),o(p,null,y(e.names,t=>(a(),o("div",{class:d(["icon-list-item",{active:n.name==t}]),onClick:I=>f(t)},[h(_,{name:t,size:20},null,8,["name"]),s("div",F,l(t),1)],10,D))),256))],4)):(a(),o("div",G,[(a(!0),o(p,null,y(e.names,t=>(a(),o("div",{class:d(["icon-list-item",{active:n.name==t}]),onClick:I=>f(t)},[h(_,{name:t,size:20},null,8,["name"]),s("div",q,l(t),1)],10,W))),256))]))]))}}),Q=E(H,[["__scopeId","data-v-e28cce60"]]);export{Q as default};