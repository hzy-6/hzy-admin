import{C as i}from"./index-DuLOsH3H.js";import{d as s,r as d,n as c,e as h,q as l,o as p,c as u}from"./index-C9oHGpmd.js";import"./cache-lnuXhGZC.js";const m=["id"],_=s({__name:"PieChart",props:{id:{default:new Date().getTime()+"_"+Math.floor(Math.random()*1e3)},data:{},height:{default:500}},setup(n){const a=n,t=d({id:c(()=>a.id),chartObject:null,data:c(()=>a.data)}),o=()=>{t.chartObject=new i({container:t.id,autoFit:!0,height:a.height}),t.chartObject.coordinate("theta",{radius:.75}),t.chartObject.scale("percent",{formatter:e=>(e=(e*100).toFixed(2)+"%",e)}),t.chartObject.tooltip({showTitle:!1,showMarkers:!1}),t.chartObject.interval().position("percent").color("type").label("percent",{content:e=>`${e.type}: ${(e.percent*100).toFixed(2)}%`}).adjust("stack"),t.chartObject.interaction("element-active")},r=e=>{t.chartObject&&(t.chartObject.annotation().clear(!0),t.chartObject.data(e),t.chartObject.render())};return h(()=>{o(),r(t.data)}),l(t.data,e=>{r(e)}),(e,b)=>(p(),u("div",{id:t.id},null,8,m))}});export{_ as default};
