import{C as i}from"./index-1bb7a4b3.js";import{d as s,p as h,e as o,s as d,q as p,o as l,c as u}from"./index-5bb0c9d3.js";import"./index-79630e7c.js";const m=["id"],_=s({__name:"LineChartMultiple",props:{id:{default:new Date().getTime()+"_"+Math.floor(Math.random()*1e3)},data:null,height:{default:500}},setup(c){const a=c,t=h({id:o(()=>a.id),chartObject:null,data:o(()=>a.data)}),n=()=>{t.chartObject=new i({container:t.id,autoFit:!0,height:a.height}),t.chartObject.scale({x:{min:0},y:{type:"pow",nice:!0},group:{}}),t.chartObject.axis("y",{label:{formatter:e=>parseFloat(e).toFixed(2)}}),t.chartObject.tooltip({showCrosshairs:!0,shared:!0}),t.chartObject.line().position("x*y").color("group").shape("smooth"),t.chartObject.point().position("x*y").color("group").shape("circle")},r=e=>{!t.chartObject||(t.chartObject.annotation().clear(!0),t.chartObject.data(e),t.chartObject.render())};return d(()=>{n(),r(t.data)}),p(t.data,e=>{r(e)}),(e,b)=>(l(),u("div",{id:t.id},null,8,m))}});export{_ as default};
