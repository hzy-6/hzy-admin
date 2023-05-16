import{d as w,b as P,r as b,f as t,o as x,l as q,w as s,u as y,a as e,i,T as _}from"./index-1d3290fc.js";import{P as C}from"./PersonalCenterService-b01089dc.js";const k=w({name:"system_change_password"}),B=w({...k,setup(F){const d=P(),a=b({vm:{oldPassword:"",newPassword:"",qrPassword:""}}),f={oldPassword:[{required:!0,message:"请输入旧密码",trigger:"blur"},{min:3,max:20,message:"长度在 3 至 20 之间",trigger:"blur"}],newPassword:[{required:!0,message:"请输入新密码",trigger:"blur"},{min:3,max:20,message:"长度在 3 至 20 之间",trigger:"blur"}],qrPassword:[{required:!0,message:"请输入确认新密码",trigger:"blur"},{min:3,max:20,message:"长度在 3 至 20 之间",trigger:"blur"}]};function v(){var u;(u=d.value)==null||u.validate().then(()=>{if(a.vm.newPassword!=a.vm.qrPassword)return _.message.warning("两次密码不一致!");C.changePassword(a.vm).then(r=>{r.code==1&&_.message.success("操作成功!")})})}return(u,r)=>{const m=t("a-input"),l=t("a-form-item"),n=t("a-col"),p=t("a-button"),g=t("a-row"),c=t("a-form");return x(),q(c,{layout:"vertical",ref_key:"refForm",ref:d,model:a.vm,rules:y(f)},{default:s(()=>[e(g,{gutter:[16,0]},{default:s(()=>[e(n,{xs:24},{default:s(()=>[e(l,{label:"旧密码",name:"oldPassword"},{default:s(()=>[e(m,{value:a.vm.oldPassword,"onUpdate:value":r[0]||(r[0]=o=>a.vm.oldPassword=o),type:"password",placeholder:"旧密码"},null,8,["value"])]),_:1})]),_:1}),e(n,{xs:24},{default:s(()=>[e(l,{label:"新密码",name:"newPassword"},{default:s(()=>[e(m,{value:a.vm.newPassword,"onUpdate:value":r[1]||(r[1]=o=>a.vm.newPassword=o),type:"password",placeholder:"新密码"},null,8,["value"])]),_:1})]),_:1}),e(n,{xs:24},{default:s(()=>[e(l,{label:"确认新密码",name:"qrPassword"},{default:s(()=>[e(m,{value:a.vm.qrPassword,"onUpdate:value":r[2]||(r[2]=o=>a.vm.qrPassword=o),type:"password",placeholder:"确认新密码"},null,8,["value"])]),_:1})]),_:1}),e(n,{xs:24},{default:s(()=>[e(l,{"wrapper-col":{span:14}},{default:s(()=>[e(p,{type:"primary",onClick:r[3]||(r[3]=o=>v())},{default:s(()=>[i("提交")]),_:1}),e(p,{style:{"margin-left":"10px"},onClick:r[4]||(r[4]=()=>{var o;return(o=d.value)==null?void 0:o.resetFields()})},{default:s(()=>[i("重置")]),_:1})]),_:1})]),_:1})]),_:1})]),_:1},8,["model","rules"])}}});export{B as _};