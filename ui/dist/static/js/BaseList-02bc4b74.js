var p=Object.defineProperty,u=Object.defineProperties;var _=Object.getOwnPropertyDescriptors;var t=Object.getOwnPropertySymbols;var g=Object.prototype.hasOwnProperty,y=Object.prototype.propertyIsEnumerable;var n=(a,o,e)=>o in a?p(a,o,{enumerable:!0,configurable:!0,writable:!0,value:e}):a[o]=e,d=(a,o)=>{for(var e in o||(o={}))g.call(o,e)&&n(a,e,o[e]);if(t)for(var e of t(o))y.call(o,e)&&n(a,e,o[e]);return a},r=(a,o)=>u(a,_(o));import{_ as f}from"./index-7aa787f9.js";import{d as w,k as b,t as C,b as N,o as c,m as l,s as h,h as x,u as L,x as B}from"./vendor-621951b9.js";const P=[{title:"Name",dataIndex:"name"},{title:"Age",dataIndex:"age"},{title:"Address",dataIndex:"address"}],S=[{key:"1",name:"John Brown",age:32,address:"New York No. 1 Lake Park"},{key:"2",name:"Jim Green",age:42,address:"London No. 1 Lake Park"},{key:"3",name:"Joe Black",age:32,address:"Sidney No. 1 Lake Park"},{key:"4",name:"Disabled User",age:99,address:"Sidney No. 1 Lake Park"}],$=w({name:"BaseListCom",setup(){const a=b({columns:P,data:S}),o={onChange:(e,s)=>{console.log(`selectedRowKeys: ${e}`,"selectedRows: ",s)},getCheckboxProps:e=>({disabled:e.name==="Disabled User",name:e.name})};return r(d({},C(a)),{rowSelection:o})}}),v={key:0};function I(a,o,e,s,D,J){const m=N("a-table");return c(),l("div",null,[h(m,{"row-selection":a.rowSelection,columns:a.columns,"data-source":a.data},{bodyCell:x(({column:i,text:k})=>[i.dataIndex==="name"?(c(),l("a",v,L(k),1)):B("",!0)]),_:1},8,["row-selection","columns","data-source"])])}var V=f($,[["render",I]]);export{V as default};