import{d as c,b as p,f as _,o as m,l as d,w as u,g as t}from"./index-C9oHGpmd.js";const i=t("p",null,"Some contents...",-1),f=t("p",null,"Some contents...",-1),h=t("p",null,"Some contents...",-1),C=c({__name:"TableEditor",setup(g,{expose:s}){const e=p(!1),a=o=>{console.log("open",o)};return s({open:(o="")=>{e.value=!0}}),(o,n)=>{const l=_("a-drawer");return m(),d(l,{open:e.value,"onUpdate:open":n[0]||(n[0]=r=>e.value=r),class:"custom-class","root-class-name":"root-class-name","root-style":{color:"blue"},style:{color:"red"},title:"数据库编辑器",placement:"right",onAfterOpenChange:a,width:"60%"},{default:u(()=>[i,f,h]),_:1},8,["open"])}}});export{C as _};