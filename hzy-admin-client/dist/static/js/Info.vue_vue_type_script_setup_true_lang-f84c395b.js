import{d as w,x as y,E as U,r as t,o as k,e as S,w as a,a as l,j as f,m as A}from"./index-2f630cca.js";import{S as _}from"./SysOrganizationService-f0fe49b3.js";const I=w({__name:"Info",props:{onSuccess:{type:Function}},setup(F,{expose:b}){const g=F,e=y({vm:{id:"",form:{}},visible:!1,loading:!1}),v=U();b({open:(n="",o="")=>{var s;e.visible=!0,e.visible&&(e.vm.id=n),(s=v.value)==null||s.resetFields(),e.loading=!0,_.findForm(n).then(i=>{e.loading=!1,i.code==1&&(e.vm=i.data,e.vm.form.parentId=o)})}});function c(){var n;(n=v.value)==null||n.validate().then(async()=>{try{e.loading=!0;const o=await _.saveForm(e.vm.id,e.vm.form);if(e.loading=!1,o.code!=1)return;A.message.success("\u64CD\u4F5C\u6210\u529F!"),g.onSuccess(),e.visible=!1}catch{e.loading=!1}})}return(n,o)=>{const s=t("a-button"),i=t("a-input-number"),m=t("a-form-item"),r=t("a-col"),d=t("a-input"),p=t("a-radio"),x=t("a-radio-group"),B=t("a-row"),E=t("a-form"),C=t("a-spin"),D=t("a-modal");return k(),S(D,{visible:e.visible,"onUpdate:visible":o[8]||(o[8]=u=>e.visible=u),title:e.vm.id?"\u7F16\u8F91":"\u65B0\u5EFA",centered:"",onOk:o[9]||(o[9]=u=>e.visible=!1),width:800},{footer:a(()=>[l(s,{type:"primary",loading:e.loading,onClick:o[0]||(o[0]=u=>c())},{default:a(()=>[f(" \u63D0\u4EA4")]),_:1},8,["loading"]),l(s,{onClick:o[1]||(o[1]=u=>e.visible=!1)},{default:a(()=>[f("\u5173\u95ED")]),_:1})]),default:a(()=>[l(C,{spinning:e.loading},{default:a(()=>[l(E,{ref_key:"refForm",ref:v,layout:"vertical",model:e.vm.form},{default:a(()=>[l(B,{gutter:[16,0]},{default:a(()=>[l(r,{xs:24,sm:12,md:12,lg:12,xl:12},{default:a(()=>[l(m,{label:"\u6392\u5E8F\u53F7"},{default:a(()=>[l(i,{value:e.vm.form.orderNumber,"onUpdate:value":o[2]||(o[2]=u=>e.vm.form.orderNumber=u),min:1,max:999,class:"w100"},null,8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:12},{default:a(()=>[l(m,{label:"\u90E8\u95E8\u540D\u79F0"},{default:a(()=>[l(d,{value:e.vm.form.name,"onUpdate:value":o[3]||(o[3]=u=>e.vm.form.name=u),placeholder:"\u8BF7\u8F93\u5165"},null,8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:12},{default:a(()=>[l(m,{label:"\u8D1F\u8D23\u4EBA"},{default:a(()=>[l(d,{value:e.vm.form.leader,"onUpdate:value":o[4]||(o[4]=u=>e.vm.form.leader=u),placeholder:"\u8BF7\u8F93\u5165"},null,8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:12},{default:a(()=>[l(m,{label:"\u8054\u7CFB\u7535\u8BDD"},{default:a(()=>[l(d,{value:e.vm.form.phone,"onUpdate:value":o[5]||(o[5]=u=>e.vm.form.phone=u),placeholder:"\u8BF7\u8F93\u5165"},null,8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:12},{default:a(()=>[l(m,{label:"\u90AE\u7BB1"},{default:a(()=>[l(d,{value:e.vm.form.email,"onUpdate:value":o[6]||(o[6]=u=>e.vm.form.email=u),placeholder:"\u8BF7\u8F93\u5165"},null,8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:12},{default:a(()=>[l(m,{label:"\u72B6\u6001"},{default:a(()=>[l(x,{value:e.vm.form.state,"onUpdate:value":o[7]||(o[7]=u=>e.vm.form.state=u)},{default:a(()=>[l(p,{value:1},{default:a(()=>[f("\u6B63\u5E38")]),_:1}),l(p,{value:2},{default:a(()=>[f("\u505C\u7528")]),_:1})]),_:1},8,["value"])]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])]),_:1},8,["spinning"])]),_:1},8,["visible","title"])}}});export{I as _};