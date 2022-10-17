import{t as x,E as V}from"./tools-4341801d.js";import{d as N,p as S,r as t,o as i,a as g,w as o,b as l,c as B,i as D,F as E,k as s,$ as F,x as C}from"./index-c165b22f.js";const $=s(" \u63D0\u4EA4 "),P=s("\u5173\u95ED"),R=s("\u9501\u5B9A"),M=s("\u4E0D\u9501\u5B9A"),G=N({__name:"Info",emits:["onSuccess"],setup(h,{expose:k,emit:I}){const e=S({vm:{id:null,form:{},roleIds:[],postIds:[],allRoleList:[],allPostList:[]},visible:!1,loading:!1,organizationId:"",organizationTree:[]});function w({id:m,organizationId:a,allOrganizationTree:f}){e.vm.id=m,e.visible=!0,e.organizationTree=f,e.organizationId=a,z()}function z(){e.loading=!0,F.findForm(e.vm.id).then(m=>{e.loading=!1,m.code==1&&(e.vm=m.data,e.vm.form.password="",e.organizationId&&(e.vm.form.organizationId=e.organizationId))})}function U(){if(!e.vm.form.organizationId)return x.message("\u8BF7\u9009\u62E9\u7EC4\u7EC7",V.\u8B66\u544A);e.loading=!0,F.saveForm(e.vm).then(m=>{m.code==1&&(I("onSuccess",1),x.message("\u63D0\u4EA4\u6210\u529F!",V.\u6210\u529F),e.visible=!1)}).finally(()=>{e.loading=!1})}return k({init:w}),(m,a)=>{const f=t("el-button"),r=t("el-input"),n=t("el-form-item"),d=t("el-col"),y=t("el-tree-select"),v=t("el-radio"),A=t("el-radio-group"),c=t("el-checkbox"),_=t("el-row"),b=t("el-checkbox-group"),L=t("el-form"),T=t("el-dialog");return i(),g(T,{centered:"","show-close":!1,draggable:"",width:800,modelValue:e.visible,"onUpdate:modelValue":a[11]||(a[11]=u=>e.visible=u),title:e.vm.id?"\u7F16\u8F91":"\u65B0\u5EFA"},{footer:o(()=>[l(f,{plain:"",type:"primary",loading:e.loading,onClick:a[0]||(a[0]=u=>U())},{default:o(()=>[$]),_:1},8,["loading"]),l(f,{plain:"",type:"danger",onClick:a[1]||(a[1]=u=>e.visible=!1)},{default:o(()=>[P]),_:1})]),default:o(()=>[l(L,{"label-position":"top","label-width":"auto"},{default:o(()=>[l(_,{gutter:20},{default:o(()=>[l(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:o(()=>[l(n,{label:"\u771F\u5B9E\u59D3\u540D"},{default:o(()=>[l(r,{modelValue:e.vm.form.name,"onUpdate:modelValue":a[2]||(a[2]=u=>e.vm.form.name=u),placeholder:"\u771F\u5B9E\u59D3\u540D"},null,8,["modelValue"])]),_:1})]),_:1}),l(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:o(()=>[l(n,{label:"\u8D26\u6237\u540D\u79F0"},{default:o(()=>[l(r,{modelValue:e.vm.form.loginName,"onUpdate:modelValue":a[3]||(a[3]=u=>e.vm.form.loginName=u),placeholder:"\u8D26\u6237\u540D\u79F0"},null,8,["modelValue"])]),_:1})]),_:1}),l(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:o(()=>[l(n,{label:"\u8D26\u6237\u5BC6\u7801"},{default:o(()=>[l(r,{modelValue:e.vm.form.password,"onUpdate:modelValue":a[4]||(a[4]=u=>e.vm.form.password=u),placeholder:"\u8D26\u6237\u5BC6\u7801"},null,8,["modelValue"])]),_:1})]),_:1}),l(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:o(()=>[l(n,{label:"\u8054\u7CFB\u7535\u8BDD"},{default:o(()=>[l(r,{modelValue:e.vm.form.phone,"onUpdate:modelValue":a[5]||(a[5]=u=>e.vm.form.phone=u),placeholder:"\u8054\u7CFB\u7535\u8BDD"},null,8,["modelValue"])]),_:1})]),_:1}),l(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:o(()=>[l(n,{label:"\u90AE\u7BB1\u5730\u5740"},{default:o(()=>[l(r,{modelValue:e.vm.form.email,"onUpdate:modelValue":a[6]||(a[6]=u=>e.vm.form.email=u),placeholder:"\u90AE\u7BB1\u5730\u5740"},null,8,["modelValue"])]),_:1})]),_:1}),l(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:o(()=>[l(n,{label:"\u6240\u5C5E\u7EC4\u7EC7"},{default:o(()=>[l(y,{modelValue:e.vm.form.organizationId,"onUpdate:modelValue":a[7]||(a[7]=u=>e.vm.form.organizationId=u),data:e.organizationTree,"render-after-expand":!1,props:{children:"children",label:"title",value:"key"},class:"w100"},null,8,["modelValue","data"])]),_:1})]),_:1}),l(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:o(()=>[l(n,{label:"\u5220\u9664\u9501\u5B9A"},{default:o(()=>[l(A,{modelValue:e.vm.form.deleteLock,"onUpdate:modelValue":a[8]||(a[8]=u=>e.vm.form.deleteLock=u)},{default:o(()=>[l(v,{label:!0},{default:o(()=>[R]),_:1}),l(v,{label:!1},{default:o(()=>[M]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1}),l(d,{xs:24,sm:24,md:24,lg:24,xl:24},{default:o(()=>[l(n,{label:"\u6240\u5C5E\u5C97\u4F4D"},{default:o(()=>[l(b,{modelValue:e.vm.postIds,"onUpdate:modelValue":a[9]||(a[9]=u=>e.vm.postIds=u),class:"w100"},{default:o(()=>[l(_,{gutter:16},{default:o(()=>[(i(!0),B(E,null,D(e.vm.allPostList,(u,p)=>(i(),g(d,{xs:24,sm:12,md:8,lg:6,xl:6,key:p},{default:o(()=>[l(c,{label:u.id},{default:o(()=>[s(C(u.name),1)]),_:2},1032,["label"])]),_:2},1024))),128))]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1}),l(d,{xs:24,sm:24,md:24,lg:24,xl:24},{default:o(()=>[l(n,{label:"\u6240\u5C5E\u89D2\u8272"},{default:o(()=>[l(b,{modelValue:e.vm.roleIds,"onUpdate:modelValue":a[10]||(a[10]=u=>e.vm.roleIds=u),class:"w100"},{default:o(()=>[l(_,{gutter:16},{default:o(()=>[(i(!0),B(E,null,D(e.vm.allRoleList,(u,p)=>(i(),g(d,{xs:24,sm:12,md:8,lg:6,xl:6,key:p},{default:o(()=>[l(c,{label:u.id},{default:o(()=>[s(C(u.name),1)]),_:2},1032,["label"])]),_:2},1024))),128))]),_:1})]),_:1},8,["modelValue"])]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["modelValue","title"])}}});export{G as _};