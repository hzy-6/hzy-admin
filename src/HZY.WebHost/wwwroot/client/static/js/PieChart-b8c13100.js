var d=Object.defineProperty;var n=Object.getOwnPropertySymbols;var h=Object.prototype.hasOwnProperty,u=Object.prototype.propertyIsEnumerable;var o=(e,t,a)=>t in e?d(e,t,{enumerable:!0,configurable:!0,writable:!0,value:a}):e[t]=a,i=(e,t)=>{for(var a in t||(t={}))h.call(t,a)&&o(e,a,t[a]);if(n)for(var a of n(t))u.call(t,a)&&o(e,a,t[a]);return e};import{G as l}from"./index-e6bad8c8.js";import{_ as p}from"./index-2d81a173.js";import{d as f,s as m,c as s,t as b,w as j,u as O,q as _,v as g}from"./vendor-4ca571b9.js";const w=f({name:"LineChartSingle",props:{id:{type:String,default(){return new Date().getTime()+"_"+Math.floor(Math.random()*1e3)}},data:Array,height:{type:Number,default(){return 500}},valueAlias:String},setup(e){const t=m({id:s(()=>e.id),chartObject:null,data:s(()=>e.data)}),a=()=>{t.chartObject=new l({container:t.id,autoFit:!0,height:e.height}),t.chartObject.coordinate("theta",{radius:.75}),t.chartObject.scale("percent",{formatter:r=>(r=(r*100).toFixed(2)+"%",r)}),t.chartObject.tooltip({showTitle:!1,showMarkers:!1}),t.chartObject.interval().position("percent").color("type").label("percent",{content:r=>`${r.type}: ${(r.percent*100).toFixed(2)}%`}).adjust("stack"),t.chartObject.interaction("element-active")},c=r=>{!t.chartObject||(t.chartObject.annotation().clear(!0),t.chartObject.data(r),t.chartObject.render())};return b(()=>{a(),c(t.data)}),j(t.data,r=>{c(r)}),i({},O(t))}}),$=["id"];function v(e,t,a,c,r,y){return _(),g("div",{id:e.id},null,8,$)}var F=p(w,[["render",v]]);export{F as default};