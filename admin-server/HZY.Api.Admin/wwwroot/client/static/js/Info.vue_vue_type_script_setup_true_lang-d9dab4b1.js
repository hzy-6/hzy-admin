var L=Object.defineProperty;var S=(i,o,r)=>o in i?L(i,o,{enumerable:!0,configurable:!0,writable:!0,value:r}):i[o]=r;var x=(i,o,r)=>(S(i,typeof o!="symbol"?o+"":o,r),r);import{H as v,d as T,r as q,b as z,f as s,o as B,l as E,w as n,a,j as _,T as H}from"./index-5ce8de01.js";class c{static findList(o,r,e={},m=[]){return v.post(`${this.urlPrefix}/findList`,{page:o,size:r,search:e,searchSort:m})}static deleteList(o){return v.post(`${this.urlPrefix}/deleteList`,o)}static findForm(o){return v.get(`${this.urlPrefix}/findForm${o?"/"+o:""}`)}static saveForm(o,r){return v.post(`${this.urlPrefix}/${o?"update":"create"}`,r)}static exportExcel(o={},r=[]){return v.download(`${this.urlPrefix}/exportExcel`,{page:-1,size:-1,search:o,searchSort:r})}}x(c,"urlPrefix","/api/v1/admin/SysPost");const j=T({__name:"Info",props:{onSuccess:{type:Function}},setup(i,{expose:o}){const r=i,e=q({vm:{id:"",form:{}},visible:!1,loading:!1}),m=z();o({open:(u="")=>{var t;e.visible=!0,e.visible&&(e.vm.id=u),(t=m.value)==null||t.resetFields(),e.loading=!0,c.findForm(u).then(d=>{e.loading=!1,d.code==200&&(e.vm=d.data)})}});function $(){var u;(u=m.value)==null||u.validate().then(async()=>{try{e.loading=!0;const t=await c.saveForm(e.vm.id,e.vm.form);if(e.loading=!1,t.code!=200)return;H.message.success("操作成功!"),r.onSuccess(),e.visible=!1}catch{e.loading=!1}})}return(u,t)=>{const d=s("a-button"),w=s("a-input-number"),f=s("a-form-item"),p=s("a-col"),g=s("a-input"),b=s("a-radio"),F=s("a-radio-group"),k=s("a-textarea"),y=s("a-row"),P=s("a-form"),U=s("a-spin"),C=s("a-modal");return B(),E(C,{open:e.visible,"onUpdate:open":t[7]||(t[7]=l=>e.visible=l),title:e.vm.id?"编辑":"新建",centered:"",onOk:t[8]||(t[8]=l=>e.visible=!1),width:400},{footer:n(()=>[a(d,{type:"primary",loading:e.loading,onClick:t[0]||(t[0]=l=>$())},{default:n(()=>[_(" 提交")]),_:1},8,["loading"]),a(d,{onClick:t[1]||(t[1]=l=>e.visible=!1)},{default:n(()=>[_("关闭")]),_:1})]),default:n(()=>[a(U,{spinning:e.loading},{default:n(()=>[a(P,{ref_key:"refForm",ref:m,layout:"vertical",model:e.vm.form},{default:n(()=>[a(y,{gutter:[16,0]},{default:n(()=>[a(p,{xs:24},{default:n(()=>[a(f,{label:"编号",name:"number"},{default:n(()=>[a(w,{value:e.vm.form.number,"onUpdate:value":t[2]||(t[2]=l=>e.vm.form.number=l),min:1,max:999,class:"w100"},null,8,["value"])]),_:1})]),_:1}),a(p,{xs:24},{default:n(()=>[a(f,{label:"岗位编码",name:"code"},{default:n(()=>[a(g,{value:e.vm.form.code,"onUpdate:value":t[3]||(t[3]=l=>e.vm.form.code=l),placeholder:"请输入",rules:[{required:!0,message:"请输入岗位编码",trigger:"blur"}]},null,8,["value"])]),_:1})]),_:1}),a(p,{xs:24},{default:n(()=>[a(f,{label:"名称",name:"name"},{default:n(()=>[a(g,{value:e.vm.form.name,"onUpdate:value":t[4]||(t[4]=l=>e.vm.form.name=l),placeholder:"请输入",rules:[{required:!0,message:"请输入名称",trigger:"blur"}]},null,8,["value"])]),_:1})]),_:1}),a(p,{xs:24},{default:n(()=>[a(f,{label:"状态"},{default:n(()=>[a(F,{value:e.vm.form.state,"onUpdate:value":t[5]||(t[5]=l=>e.vm.form.state=l)},{default:n(()=>[a(b,{value:1},{default:n(()=>[_("正常")]),_:1}),a(b,{value:2},{default:n(()=>[_("停用")]),_:1})]),_:1},8,["value"])]),_:1})]),_:1}),a(p,{xs:24},{default:n(()=>[a(f,{label:"备注"},{default:n(()=>[a(k,{value:e.vm.form.remarks,"onUpdate:value":t[6]||(t[6]=l=>e.vm.form.remarks=l),placeholder:"请输入",rows:4},null,8,["value"])]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])]),_:1},8,["spinning"])]),_:1},8,["open","title"])}}});export{c as S,j as _};
