import{a as h}from"./index-18c53eb7.js";import{_ as w}from"./PageContainer.vue_vue_type_script_setup_true_lang-1a8186f4.js";import{d as m,r as N,b as v,f as c,ae as B,o as a,l as i,w as t,v as C,i as D,g as l,a as L,c as P,t as o,B as S,u as s,y as V}from"./index-235b159a.js";import"./AppIcon.vue_vue_type_script_setup_true_lang-5572fb54.js";const I={id:"print"},J={key:0},A=m({name:"BaseListCom"}),T=m({...A,setup(R){const n=N({columns:[{title:"Name",dataIndex:"name"},{title:"Age",dataIndex:"age"},{title:"Address",dataIndex:"address"}],data:[{key:"1",name:"John Brown",age:32,address:"New York No. 1 Lake Park"},{key:"2",name:"Jim Green",age:42,address:"London No. 1 Lake Park"},{key:"3",name:"Joe Black",age:32,address:"Sidney No. 1 Lake Park"},{key:"4",name:"Disabled User",age:99,address:"Sidney No. 1 Lake Park"}]}),_={onChange:(e,d)=>{console.log(`selectedRowKeys: ${e}`,"selectedRows: ",d)},getCheckboxProps:e=>({disabled:e.name==="Disabled User",name:e.name})},r=v(null),{x:p,y:u,style:k}=h(r,{initialValue:{x:500,y:200}});return(e,d)=>{const y=c("a-button"),f=c("a-table"),g=B("print");return a(),i(w,null,{default:t(()=>[C((a(),i(y,{type:"primary",class:"mb-16"},{default:t(()=>[D("打印")]),_:1})),[[g,"#print"]]),l("div",I,[L(f,{"row-selection":_,columns:n.columns,"data-source":n.data},{bodyCell:t(({column:x,text:b})=>[x.dataIndex==="name"?(a(),P("a",J,o(b),1)):S("",!0)]),_:1},8,["columns","data-source"])]),l("div",{ref_key:"el",ref:r,style:V([s(k),{position:"fixed","background-color":"red",width:"100px",height:"100px",color:"#fff",cursor:"pointer"}])},"快拖动我... x:"+o(s(p))+"y:"+o(s(u)),5)]),_:1})}}});export{T as default};