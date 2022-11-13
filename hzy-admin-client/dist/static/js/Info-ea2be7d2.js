import{_ as D,r as $,a as H,j as s,W as P,k as u,q as p,w as l,g as a,f as t,L as V,c as w,H as L,F as I,n as v,X as z,t as F,S as j,e as U}from"./index-c3cea2d3.js";import{o as E}from"./organizationService-11fbe8ab.js";const W=v("\u63D0\u4EA4"),X=v("\u5173\u95ED"),A=v("\u9501\u5B9A"),G=v("\u4E0D\u9501\u5B9A"),J={emits:["onSuccess"],setup(K,{expose:T,emit:N}){const e=$({vm:{id:"",form:{},roleIds:[],allRoleList:[],allPostList:[]},visible:!1,saveLoading:!1,organizationTree:[]}),g=H(null),S={name:[{required:!0,message:"\u8BF7\u8F93\u5165\u771F\u5B9E\u59D3\u540D",trigger:"blur"}],loginName:[{required:!0,message:"\u8BF7\u8F93\u5165\u8D26\u6237\u540D\u79F0",trigger:"blur"}]},f={findForm(){return e.saveLoading=!0,z.findForm(e.vm.id).then(r=>{e.saveLoading=!1,r.code==1&&(e.vm=r.data,e.vm.form.password="")})},saveForm(){if(!e.vm.form.organizationId)return F.message("\u8BF7\u9009\u62E9\u7EC4\u7EC7","\u8B66\u544A");g.value.validate().then(()=>{e.saveLoading=!0,z.saveForm(e.vm).then(r=>{r.code==1&&(F.message("\u64CD\u4F5C\u6210\u529F!","\u6210\u529F"),N("onSuccess",r.data),e.visible=!1)}).finally(()=>{e.saveLoading=!1})})},openForm({visible:r,key:o,organizationId:_}){e.visible=r,r&&(e.vm.id=o,j(()=>{g.value.resetFields(),f.sysOrganizationTree()}),f.findForm().then(m=>{o||(e.vm.form.organizationId=_)}))},sysOrganizationTree(){E.sysOrganizationTree().then(r=>{e.organizationTree=r.data.rows})}};return T({...f}),(r,o)=>{const _=s("a-button"),m=s("a-input"),i=s("a-form-item"),d=s("a-col"),h=s("a-tree-select"),b=s("a-radio"),C=s("a-radio-group"),k=s("a-checkbox"),c=s("a-row"),y=s("a-checkbox-group"),O=s("a-form"),R=s("a-spin"),q=s("a-modal"),B=P("drag");return u(),p(q,{visible:t(e).visible,"onUpdate:visible":o[11]||(o[11]=n=>t(e).visible=n),title:t(e).vm.id?"\u7F16\u8F91":"\u65B0\u5EFA",centered:"",onOk:o[12]||(o[12]=n=>t(e).visible=!1),width:800},{footer:l(()=>[a(_,{type:"primary",onClick:o[0]||(o[0]=n=>f.saveForm()),loading:t(e).saveLoading},{default:l(()=>[W]),_:1},8,["loading"]),a(_,{type:"danger",ghost:"",onClick:o[1]||(o[1]=n=>t(e).visible=!1),class:"ml-15"},{default:l(()=>[X]),_:1})]),default:l(()=>[V((u(),p(R,{spinning:t(e).saveLoading},{default:l(()=>[a(O,{ref_key:"formRef",ref:g,layout:"vertical",model:t(e).vm.form,rules:S},{default:l(()=>[a(c,{gutter:[15,15]},{default:l(()=>[a(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:l(()=>[a(i,{label:"\u771F\u5B9E\u59D3\u540D",ref:"name",name:"name"},{default:l(()=>[a(m,{value:t(e).vm.form.name,"onUpdate:value":o[2]||(o[2]=n=>t(e).vm.form.name=n),placeholder:"\u8BF7\u8F93\u5165"},null,8,["value"])]),_:1},512)]),_:1}),a(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:l(()=>[a(i,{label:"\u8D26\u6237\u540D\u79F0",ref:"loginName",name:"loginName"},{default:l(()=>[a(m,{value:t(e).vm.form.loginName,"onUpdate:value":o[3]||(o[3]=n=>t(e).vm.form.loginName=n),placeholder:"\u8BF7\u8F93\u5165"},null,8,["value"])]),_:1},512)]),_:1}),a(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:l(()=>[a(i,{label:"\u8D26\u6237\u5BC6\u7801"},{default:l(()=>[a(m,{value:t(e).vm.form.password,"onUpdate:value":o[4]||(o[4]=n=>t(e).vm.form.password=n),placeholder:"\u8BF7\u8F93\u5165"},null,8,["value"])]),_:1})]),_:1}),a(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:l(()=>[a(i,{label:"\u8054\u7CFB\u7535\u8BDD"},{default:l(()=>[a(m,{value:t(e).vm.form.phone,"onUpdate:value":o[5]||(o[5]=n=>t(e).vm.form.phone=n),placeholder:"\u8BF7\u8F93\u5165"},null,8,["value"])]),_:1})]),_:1}),a(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:l(()=>[a(i,{label:"\u90AE\u7BB1\u5730\u5740"},{default:l(()=>[a(m,{value:t(e).vm.form.email,"onUpdate:value":o[6]||(o[6]=n=>t(e).vm.form.email=n),placeholder:"\u8BF7\u8F93\u5165"},null,8,["value"])]),_:1})]),_:1}),a(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:l(()=>[a(i,{label:"\u6240\u5C5E\u7EC4\u7EC7"},{default:l(()=>[a(h,{value:t(e).vm.form.organizationId,"onUpdate:value":o[7]||(o[7]=n=>t(e).vm.form.organizationId=n),"dropdown-style":{maxHeight:"400px",overflow:"auto"},placeholder:"\u6240\u5C5E\u7EC4\u7EC7","allow-clear":"","tree-default-expand-all":"","tree-data":t(e).organizationTree,"field-names":{children:"children",label:"title",key:"key",value:"key"}},null,8,["value","tree-data"])]),_:1})]),_:1}),a(d,{xs:24,sm:12,md:12,lg:12,xl:12},{default:l(()=>[a(i,{label:"\u5220\u9664\u9501\u5B9A"},{default:l(()=>[a(C,{value:t(e).vm.form.deleteLock,"onUpdate:value":o[8]||(o[8]=n=>t(e).vm.form.deleteLock=n)},{default:l(()=>[a(b,{value:!0},{default:l(()=>[A]),_:1}),a(b,{value:!1},{default:l(()=>[G]),_:1})]),_:1},8,["value"])]),_:1})]),_:1}),a(d,{xs:24,sm:24,md:24,lg:24,xl:24},{default:l(()=>[a(i,{label:"\u6240\u5C5E\u5C97\u4F4D"},{default:l(()=>[a(y,{value:t(e).vm.postIds,"onUpdate:value":o[9]||(o[9]=n=>t(e).vm.postIds=n),class:"w100"},{default:l(()=>[a(c,{gutter:[16,16]},{default:l(()=>[(u(!0),w(I,null,L(t(e).vm.allPostList,(n,x)=>(u(),p(d,{span:6,key:x},{default:l(()=>[a(k,{value:n.id},{default:l(()=>[v(U(n.name),1)]),_:2},1032,["value"])]),_:2},1024))),128))]),_:1})]),_:1},8,["value"])]),_:1})]),_:1}),a(d,{xs:24},{default:l(()=>[a(i,{label:"\u6240\u5C5E\u89D2\u8272"},{default:l(()=>[a(y,{value:t(e).vm.roleIds,"onUpdate:value":o[10]||(o[10]=n=>t(e).vm.roleIds=n),class:"w100"},{default:l(()=>[a(c,{gutter:[16,16]},{default:l(()=>[(u(!0),w(I,null,L(t(e).vm.allRoleList,(n,x)=>(u(),p(d,{span:6,key:x},{default:l(()=>[a(k,{value:n.id},{default:l(()=>[v(U(n.name),1)]),_:2},1032,["value"])]),_:2},1024))),128))]),_:1})]),_:1},8,["value"])]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])]),_:1},8,["spinning"])),[[B]])]),_:1},8,["visible","title"])}}},Y=D(J,[["__scopeId","data-v-44590c39"]]);export{Y as default};