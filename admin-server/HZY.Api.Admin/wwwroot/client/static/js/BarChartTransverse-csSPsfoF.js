import{C as l}from"./index-DuLOsH3H.js";import{d as o,r as s,n,e as d,q as h,o as u,c as f}from"./index-C9oHGpmd.js";import"./cache-lnuXhGZC.js";const p=["id"],v=o({__name:"BarChartTransverse",props:{id:{default:new Date().getTime()+"_"+Math.floor(Math.random()*1e3)},data:{},height:{default:500},valueAlias:{}},setup(r){const e=r,t=s({id:n(()=>e.id),chartObject:null,data:n(()=>e.data)}),i=()=>{t.chartObject=new l({container:t.id,autoFit:!0,height:e.height}),t.chartObject.scale({value:{min:0,alias:e.valueAlias}}),t.chartObject.axis("type",{title:null,tickLine:null,line:null}),t.chartObject.axis("value",{label:null,title:{offset:30,style:{fontSize:12,fontWeight:300}}}),t.chartObject.legend(!1),t.chartObject.coordinate().transpose(),t.chartObject.interval().position("type*value").size(26).label("value",{style:{fill:"#8d8d8d"},offset:10}),t.chartObject.interaction("element-active")},c=a=>{t.chartObject&&(t.chartObject.annotation().clear(!0),t.chartObject.data(a),t.chartObject.render())};return d(()=>{i(),c(t.data)}),h(t.data,a=>{c(a)}),(a,b)=>(u(),f("div",{id:t.id},null,8,p))}});export{v as default};
