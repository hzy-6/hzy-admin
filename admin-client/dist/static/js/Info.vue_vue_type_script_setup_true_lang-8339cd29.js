import{d as y,r as C,b as L,f as n,ak as T,o as i,l as f,w as u,a as l,i as p,E as F,T as $}from"./index-1d3290fc.js";const D=y({__name:"Info",props:{onSuccess:{type:Function}},setup(g,{expose:_}){const b=g,e=C({vm:{id:"",form:{value:""}},visible:!1,saveLoading:!1}),m=L();_({open:({key:s})=>{e.visible=!0,e.visible&&(e.vm.id=s)}});function x(){var s;(s=m.value)==null||s.validate().then(()=>{e.saveLoading=!0,setTimeout(()=>{e.saveLoading=!1,b.onSuccess(),$.message.success("提交成功!"),e.visible=!1},1e3)})}return(s,a)=>{const d=n("a-button"),t=n("a-input"),o=n("a-form-item"),v=n("a-col"),U=n("a-row"),q=n("a-form"),k=n("a-spin"),w=n("a-modal"),c=T("drag");return i(),f(w,{visible:e.visible,"onUpdate:visible":a[11]||(a[11]=r=>e.visible=r),title:e.vm.id?"编辑":"新建",centered:"",onOk:a[12]||(a[12]=r=>e.visible=!1),width:800},{footer:u(()=>[l(d,{type:"primary",loading:e.saveLoading,onClick:a[0]||(a[0]=r=>x())},{default:u(()=>[p(" 提交")]),_:1},8,["loading"]),l(d,{onClick:a[1]||(a[1]=r=>e.visible=!1)},{default:u(()=>[p("关闭")]),_:1})]),default:u(()=>[F((i(),f(k,{spinning:e.saveLoading},{default:u(()=>[l(q,{ref_key:"refForm",ref:m,layout:"vertical",model:e.vm.form},{default:u(()=>[l(U,{gutter:[16,0]},{default:u(()=>[l(v,{xs:24,sm:12,md:12,lg:12,xl:12},{default:u(()=>[l(o,{label:"用户名",ref:"value",name:"value",rules:[{required:!0,trigger:"blur"}]},{default:u(()=>[l(t,{value:e.vm.form.value,"onUpdate:value":a[2]||(a[2]=r=>e.vm.form.value=r),placeholder:"请输入"},null,8,["value"])]),_:1},512)]),_:1}),l(v,{xs:24,sm:12,md:12,lg:12,xl:12},{default:u(()=>[l(o,{label:"年龄",ref:"value",name:"value",rules:[{required:!0,trigger:"blur"}]},{default:u(()=>[l(t,{value:e.vm.form.value,"onUpdate:value":a[3]||(a[3]=r=>e.vm.form.value=r),placeholder:"请输入"},null,8,["value"])]),_:1},512)]),_:1}),l(v,{xs:24,sm:12,md:12,lg:12,xl:12},{default:u(()=>[l(o,{label:"地址",ref:"value",name:"value",rules:[{required:!0,trigger:"blur"}]},{default:u(()=>[l(t,{value:e.vm.form.value,"onUpdate:value":a[4]||(a[4]=r=>e.vm.form.value=r),placeholder:"请输入"},null,8,["value"])]),_:1},512)]),_:1}),l(v,{xs:24,sm:12,md:12,lg:12,xl:12},{default:u(()=>[l(o,{label:"用户名",ref:"value",name:"value",rules:[{required:!0,trigger:"blur"}]},{default:u(()=>[l(t,{value:e.vm.form.value,"onUpdate:value":a[5]||(a[5]=r=>e.vm.form.value=r),placeholder:"请输入"},null,8,["value"])]),_:1},512)]),_:1}),l(v,{xs:24,sm:12,md:12,lg:12,xl:12},{default:u(()=>[l(o,{label:"年龄",ref:"value",name:"value",rules:[{required:!0,trigger:"blur"}]},{default:u(()=>[l(t,{value:e.vm.form.value,"onUpdate:value":a[6]||(a[6]=r=>e.vm.form.value=r),placeholder:"请输入"},null,8,["value"])]),_:1},512)]),_:1}),l(v,{xs:24,sm:12,md:12,lg:12,xl:12},{default:u(()=>[l(o,{label:"地址",ref:"value",name:"value",rules:[{required:!0,trigger:"blur"}]},{default:u(()=>[l(t,{value:e.vm.form.value,"onUpdate:value":a[7]||(a[7]=r=>e.vm.form.value=r),placeholder:"请输入"},null,8,["value"])]),_:1},512)]),_:1}),l(v,{xs:24,sm:12,md:12,lg:12,xl:12},{default:u(()=>[l(o,{label:"用户名",ref:"value",name:"value",rules:[{required:!0,trigger:"blur"}]},{default:u(()=>[l(t,{value:e.vm.form.value,"onUpdate:value":a[8]||(a[8]=r=>e.vm.form.value=r),placeholder:"请输入"},null,8,["value"])]),_:1},512)]),_:1}),l(v,{xs:24,sm:12,md:12,lg:12,xl:12},{default:u(()=>[l(o,{label:"年龄",ref:"value",name:"value",rules:[{required:!0,trigger:"blur"}]},{default:u(()=>[l(t,{value:e.vm.form.value,"onUpdate:value":a[9]||(a[9]=r=>e.vm.form.value=r),placeholder:"请输入"},null,8,["value"])]),_:1},512)]),_:1}),l(v,{xs:24,sm:12,md:12,lg:12,xl:12},{default:u(()=>[l(o,{label:"地址",ref:"value",name:"value",rules:[{required:!0,trigger:"blur"}]},{default:u(()=>[l(t,{value:e.vm.form.value,"onUpdate:value":a[10]||(a[10]=r=>e.vm.form.value=r),placeholder:"请输入"},null,8,["value"])]),_:1},512)]),_:1})]),_:1})]),_:1},8,["model"])]),_:1},8,["spinning"])),[[c]])]),_:1},8,["visible","title"])}}});export{D as _};
