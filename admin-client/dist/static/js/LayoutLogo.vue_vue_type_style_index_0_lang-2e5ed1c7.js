import{d as c,v as u,n as m,u as s,o as p,c as _,t as i,x as f,B as y,O as v,P as d}from"./index-5ce8de01.js";import{M as g}from"./MenuStore-d0fd35df.js";const h=c({__name:"LayoutLogo",setup(k){const a=g(),n=u(),{useToken:r}=v,{token:t}=r(),l=m(()=>{var e,o;return(e=t.value.Menu)!=null&&e.colorItemText?(o=t.value.Menu)==null?void 0:o.colorItemText:n.state.isDark?"#ffffff":""});return(e,o)=>s(a).state.isCollapse?y("",!0):(p(),_("div",{key:0,class:"hzy-logo",style:f({color:l.value})},i(s(d).appTitle),5))}});export{h as _};