import{d as S,A as w,b as $,e as I,y as p,j as v,a4 as N,f as _,u as z,o as t,c as r,g as u,N as d,z as y,s as A,a as V,w as h,F,B as R,l as C,x as g,t as k}from"./index-ceef6588.js";import{_ as T}from"./AppIcon.vue_vue_type_script_setup_true_lang-081834dc.js";const j={key:0},x={key:0,class:"mt-8"},D={key:1},M=S({__name:"PageContainer",props:{show:{type:Boolean,default:!0},describe:null,classPadding:null,bodyClassPadding:null,bodyStyle:null},setup(c){const o=c,f=w(),b=$([]);I(()=>{b.value=B(),document.title=p.appTitle+" - "+v.currentRoute.value.meta.title}),N(()=>{document.title=p.appTitle});function B(){let a=v.currentRoute.value.meta.levelCode;if(!a)return[];const n=[];if(a.indexOf(".")>-1)for(var l=a.split("."),e=0;e<l.length;e++){var P=l[e];const i=f.state.userInfo.menus.find(m=>m.id==P);n.push(i)}else{const i=f.state.userInfo.menus.find(m=>m.id=a);n.push(i)}return n}return(s,a)=>{const n=_("a-breadcrumb-item"),l=_("a-breadcrumb");return o.show&&z(p).showPageContainer?(t(),r("div",j,[u("div",{class:y([{"pl-16 pr-16 pt-12 pb-16":!c.classPadding},"bg-white"])},[d(s.$slots,"nav",{},()=>[V(l,null,{default:h(()=>[(t(!0),r(F,null,R(b.value,e=>(t(),C(n,null,{default:h(()=>[e.icon?(t(),C(T,{key:0,name:e.icon},null,8,["name"])):g("",!0),u("span",null,k(e.name),1)]),_:2},1024))),256))]),_:1})]),d(s.$slots,"describe",{},()=>[o.describe?(t(),r("div",x,[u("span",null,k(o.describe),1)])):g("",!0)])],2),u("div",{class:y({"p-16":!c.bodyClassPadding}),style:A({...o.bodyStyle??{}})},[d(s.$slots,"default")],6)])):(t(),r("div",D,[d(s.$slots,"default")]))}}});export{M as _};