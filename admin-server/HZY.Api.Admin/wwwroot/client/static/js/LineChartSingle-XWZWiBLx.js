import{C as i}from"./index-DuLOsH3H.js";import{d as s,r as h,n as c,e as d,q as l,o as u,c as p}from"./index-C9oHGpmd.js";import"./cache-lnuXhGZC.js";const m=["id"],_=s({__name:"LineChartSingle",props:{id:{default:new Date().getTime()+"_"+Math.floor(Math.random()*1e3)},data:{},height:{default:500}},setup(n){const a=n,t=h({id:c(()=>a.id),chartObject:null,data:c(()=>a.data)}),o=()=>{t.chartObject=new i({container:t.id,autoFit:!0,height:a.height}),t.chartObject.scale({year:{range:[0,1]},value:{min:0,nice:!0}}),t.chartObject.tooltip({showCrosshairs:!0,shared:!0}),t.chartObject.line().position("year*value").label("value"),t.chartObject.point().position("year*value")},r=e=>{t.chartObject&&(t.chartObject.annotation().clear(!0),t.chartObject.data(e),t.chartObject.render())};return d(()=>{o(),r(t.data)}),l(t.data,e=>{r(e)}),(e,b)=>(u(),p("div",{id:t.id},null,8,m))}});export{_ as default};
