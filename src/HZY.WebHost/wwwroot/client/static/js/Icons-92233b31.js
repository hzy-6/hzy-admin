var d=Object.defineProperty;var n=Object.getOwnPropertySymbols;var f=Object.prototype.hasOwnProperty,l=Object.prototype.propertyIsEnumerable;var a=(o,e,t)=>e in o?d(o,e,{enumerable:!0,configurable:!0,writable:!0,value:t}):o[e]=t,s=(o,e)=>{for(var t in e||(e={}))f.call(e,t)&&a(o,t,e[t]);if(n)for(var t of n(e))l.call(e,t)&&a(o,t,e[t]);return o};import _ from"./AppIconList-8b13829b.js";import{_ as u}from"./index-84e8d6c5.js";import{d as h,s as I,u as x,f as r,q as N,j as b,m as c,y as v,x as A}from"./vendor-d5c27e5b.js";const $=h({name:"IconsVue",components:{AppIconList:_},setup(){const o=I({iconName:"AlipaySquareFilled"});return s({},x(o))}}),k=A("a",{href:"https://next.antdv.com/components/icon-cn",target:"_black"}," \u5B98\u65B9\u56FE\u6807",-1);function y(o,e,t,B,C,L){const p=r("AppIconList"),m=r("a-card");return N(),b(m,{title:"Icons \u56FE\u6807\u96C6\u5408",bordered:!1,headStyle:{"border-bottom":0}},{extra:c(()=>[k]),default:c(()=>[v(p,{name:o.iconName,"onUpdate:name":e[0]||(e[0]=i=>o.iconName=i),height:600},null,8,["name"])]),_:1})}var j=u($,[["render",y]]);export{j as default};