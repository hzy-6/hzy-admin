import{d as h,b as c,T as i,q as g,m as k,C as y,e as x,n as I,f as b,o as n,l as w,w as d,c as s,D as L,a as B,E as C,F as S,u as _,x as T,G as D}from"./index-1d3290fc.js";import{_ as U}from"./_plugin-vue_export-helper-c27b6911.js";const z=["src"],A=h({__name:"LayoutIframe",setup(E){const u=c(i.getAuthorization()),m=c(),p=g(),f=k(()=>p.state.tabs.filter(t=>t.meta.mode==2)),o=c(!1),l=y();x(()=>{u.value=i.getAuthorization()}),I(()=>f.value,(t,e)=>{t.length>e.length&&(o.value=!0)});function v(t,e,r){return e=e==null?void 0:e.replace("{menuid}",r.toString()),e=e==null?void 0:e.replace("{token}",u.value),e}return(t,e)=>{const r=b("a-spin");return n(),w(r,{spinning:o.value},{default:d(()=>[(n(!0),s(D,null,L(_(f),(a,F)=>(n(),s("div",{key:a.path},[B(T,{name:"fade-transform",mode:"out-in"},{default:d(()=>[C((n(),s("div",{key:a.path},[(n(),s("iframe",{ref_for:!0,ref_key:"iframe",ref:m,src:v(a.meta.moduleUrl,a.meta.moduleUrlPro,a.meta.menuId),frameBorder:"0",onLoad:e[0]||(e[0]=R=>o.value=!1),key:a.path},null,40,z))])),[[S,a.path==_(l).currentRoute.value.path]])]),_:2},1024)]))),128))]),_:1},8,["spinning"])}}});const M=U(A,[["__scopeId","data-v-7ad024a8"]]);export{M as default};
