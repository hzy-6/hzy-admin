import{G as o}from"./index-7daa9ab8.js";import{_ as i,x as s,r as d,K as n,o as h,I as u,y as l,k as p,c as f}from"./index-c3cea2d3.js";const m=s({name:"LineChartSingle",props:{id:{type:String,default(){return new Date().getTime()+"_"+Math.floor(Math.random()*1e3)}},data:Array,height:{type:Number,default(){return 500}},valueAlias:String},setup(a){const t=d({id:n(()=>a.id),chartObject:null,data:n(()=>a.data)}),c=()=>{t.chartObject=new o({container:t.id,autoFit:!0,height:a.height}),t.chartObject.coordinate("theta",{radius:.75}),t.chartObject.scale("percent",{formatter:e=>(e=(e*100).toFixed(2)+"%",e)}),t.chartObject.tooltip({showTitle:!1,showMarkers:!1}),t.chartObject.interval().position("percent").color("type").label("percent",{content:e=>`${e.type}: ${(e.percent*100).toFixed(2)}%`}).adjust("stack"),t.chartObject.interaction("element-active")},r=e=>{!t.chartObject||(t.chartObject.annotation().clear(!0),t.chartObject.data(e),t.chartObject.render())};return h(()=>{c(),r(t.data)}),u(t.data,e=>{r(e)}),{...l(t)}}}),b=["id"];function j(a,t,c,r,e,O){return p(),f("div",{id:a.id},null,8,b)}const y=i(m,[["render",j]]);export{y as default};