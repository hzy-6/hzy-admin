import g from"./Index-7039e85e.js";import{e as r,t as b,w as v,f as i,q as x,v as _,y as s,m as k,F as w}from"./vendor-4ca571b9.js";import"./index-13b87e1a.js";const B={props:{value:String},emits:["update:value"],setup(p,{emit:d}){const n=p,o=r(!1),u="* * * * * ? *",e=r(u);b(()=>{e.value=n.value?n.value:u}),v(()=>e,a=>{d("update:value",a)}),v(()=>n.value,a=>{e.value=a||u});const m=a=>{if(typeof a!="string")return!1;e.value=a,o.value=!1},f=()=>{o.value=!0};return(a,l)=>{const c=i("a-input"),C=i("a-modal");return x(),_(w,null,[s(c,{value:e.value,"onUpdate:value":l[0]||(l[0]=t=>e.value=t),placeholder:"\u8BF7\u8F93\u5165",onClick:f},null,8,["value"]),s(C,{title:"Cron\u8868\u8FBE\u5F0F",visible:o.value,"onUpdate:visible":l[2]||(l[2]=t=>o.value=t),footer:null,width:800,bodyStyle:{padding:0}},{default:k(()=>[s(g,{i18n:"cn",maxHeight:"350px",onChange:m,value:e.value,"onUpdate:value":l[1]||(l[1]=t=>e.value=t)},null,8,["value"])]),_:1},8,["visible"])],64)}}};export{B as default};