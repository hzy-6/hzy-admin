var k=Object.defineProperty;var C=(i,o,s)=>o in i?k(i,o,{enumerable:!0,configurable:!0,writable:!0,value:s}):i[o]=s;var g=(i,o,s)=>(C(i,typeof o!="symbol"?o+"":o,s),s);import{H as f,d as T,r as U,b as L,f as r,o as S,l as N,w as n,a,j as x,T as O}from"./index-5ce8de01.js";class b{static findList(o={}){return f.post(`${this.urlPrefix}/findList`,o)}static deleteList(o){return f.post(`${this.urlPrefix}/deleteList`,o)}static findForm(o){return f.get(`${this.urlPrefix}/findForm${o?"/"+o:""}`)}static saveForm(o,s){return f.post(`${this.urlPrefix}/${o?"update":"create"}`,s)}static sysOrganizationTree(){return f.post(`${this.urlPrefix}/sysOrganizationTree`)}}g(b,"urlPrefix","/api/v1/admin/SysDictionary");const H=T({__name:"Info",props:{onSuccess:{type:Function}},setup(i,{expose:o}){const s=i,e=U({vm:{id:"",form:{}},visible:!1,loading:!1}),c=L();o({open:(u="",t="")=>{var m;e.visible=!0,e.visible&&(e.vm.id=u),(m=c.value)==null||m.resetFields(),e.loading=!0,b.findForm(u).then(d=>{e.loading=!1,d.code==200&&(e.vm=d.data,e.vm.form.parentId=t)})}});function y(){var u;(u=c.value)==null||u.validate().then(async()=>{try{e.loading=!0;const t=await b.saveForm(e.vm.id,e.vm.form);if(e.loading=!1,t.code!=200)return;O.message.success("操作成功!"),s.onSuccess(),e.visible=!1}catch{e.loading=!1}})}return(u,t)=>{const m=r("a-button"),d=r("a-input-number"),p=r("a-form-item"),v=r("a-col"),_=r("a-input"),$=r("a-row"),F=r("a-form"),w=r("a-spin"),P=r("a-modal");return S(),N(P,{open:e.visible,"onUpdate:open":t[6]||(t[6]=l=>e.visible=l),title:e.vm.id?"编辑":"新建",centered:"",onOk:t[7]||(t[7]=l=>e.visible=!1),width:400},{footer:n(()=>[a(m,{type:"primary",loading:e.loading,onClick:t[0]||(t[0]=l=>y())},{default:n(()=>[x(" 提交")]),_:1},8,["loading"]),a(m,{onClick:t[1]||(t[1]=l=>e.visible=!1)},{default:n(()=>[x("关闭")]),_:1})]),default:n(()=>[a(w,{spinning:e.loading},{default:n(()=>[a(F,{ref_key:"refForm",ref:c,layout:"vertical",model:e.vm.form},{default:n(()=>[a($,{gutter:[16,0]},{default:n(()=>[a(v,{xs:24},{default:n(()=>[a(p,{label:"序号"},{default:n(()=>[a(d,{id:"inputNumber",value:e.vm.form.sort,"onUpdate:value":t[2]||(t[2]=l=>e.vm.form.sort=l),min:0,max:50,class:"w100"},null,8,["value"])]),_:1})]),_:1}),a(v,{xs:24},{default:n(()=>[a(p,{label:"编码"},{default:n(()=>[a(_,{value:e.vm.form.code,"onUpdate:value":t[3]||(t[3]=l=>e.vm.form.code=l),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1}),a(v,{xs:24},{default:n(()=>[a(p,{label:"分组名称/键"},{default:n(()=>[a(_,{value:e.vm.form.name,"onUpdate:value":t[4]||(t[4]=l=>e.vm.form.name=l),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1}),a(v,{xs:24},{default:n(()=>[a(p,{label:"值"},{default:n(()=>[a(_,{value:e.vm.form.value,"onUpdate:value":t[5]||(t[5]=l=>e.vm.form.value=l),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1})]),_:1})]),_:1},8,["model"])]),_:1},8,["spinning"])]),_:1},8,["open","title"])}}});export{b as S,H as _};
