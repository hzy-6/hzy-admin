var $=Object.defineProperty;var L=(d,s,l)=>s in d?$(d,s,{enumerable:!0,configurable:!0,writable:!0,value:l}):d[s]=l;var g=(d,s,l)=>(L(d,typeof s!="symbol"?s+"":s,l),l);import{H as m,d as w,r as E,f as p,o as K,l as B,w as o,a as n,j as r,c as T,g as A,B as H,T as P}from"./index-5ce8de01.js";import{S}from"./SysOrganizationService-833430ab.js";class v{static findList(s,l,e={},h=[]){return m.post(`${this.urlPrefix}/findList`,{page:s,size:l,search:e,searchSort:h})}static deleteList(s){return m.post(`${this.urlPrefix}/deleteList`,s)}static findForm(s){return m.get(`${this.urlPrefix}/findForm${s?"/"+s:""}`)}static saveForm(s,l){return m.post(`${this.urlPrefix}/${s?"update":"create"}`,l)}static exportExcel(s={},l=[]){return m.download(`${this.urlPrefix}/exportExcel`,{page:-1,size:-1,search:s,searchSort:l})}static getDataAuthorityByRoleId(s){return m.get(`${this.urlPrefix}/getDataAuthorityByRoleId/${s}`)}}g(v,"urlPrefix","/api/v1/admin/SysDataAuthority");const z={key:0},I={class:"mb-15"},U={style:{"max-height":"280px","overflow-y":"auto"}},N=w({__name:"DataAuthority",props:{onSuccess:{type:Function}},setup(d,{expose:s}){const l=d,e=E({vm:{id:"",form:{sysDataAuthority:{},sysDataAuthorityCustomList:[]}},visible:!1,loading:!1,tree:{data:[],expandedKeys:[],selectedKeys:[],checkedKeys:[],allKeys:[],allExpandedKeys:[]},selectAll:!1,expandedAll:!1});s({open:(y="")=>{e.visible=!0,e.visible&&(e.vm.id=y),e.loading=!0,v.getDataAuthorityByRoleId(y).then(async t=>{if(e.loading=!1,t.code!=200)return;e.vm.form.sysDataAuthority=t.data.sysDataAuthority,e.vm.form.sysDataAuthority.roleId=y,e.vm.form.sysDataAuthorityCustomList=t.data.sysDataAuthorityCustomList;let i=(await S.sysOrganizationTree()).data;e.tree.data=i.rows,e.tree.expandedKeys=i.expandedRowKeys,e.tree.allKeys=i.allKeys,e.tree.allExpandedKeys=i.expandedRowKeys;var f=e.vm.form.sysDataAuthorityCustomList;for(let c=0;c<f.length;c++){const x=f[c];e.tree.checkedKeys.push(x.sysOrganizationId)}e.selectAll=e.tree.checkedKeys.length==e.tree.allKeys.length,e.expandedAll=e.tree.expandedKeys.length==e.tree.allExpandedKeys.length})}});async function h(){if(e.vm.form.sysDataAuthority.permissionType===1){var y=e.tree.checkedKeys;e.vm.form.sysDataAuthorityCustomList=[];for(let u=0;u<y.length;u++){const i=y[u];e.vm.form.sysDataAuthorityCustomList.push({sysOrganizationId:i})}}else e.vm.form.sysDataAuthorityCustomList=[];e.loading=!0,(await v.saveForm(e.vm.id,e.vm.form)).code==200&&(P.message.success("操作成功!"),l.onSuccess(),e.visible=!1)}function k(){e.selectAll?e.tree.checkedKeys=e.tree.allKeys:e.tree.checkedKeys=[]}function _(){e.expandedAll?e.tree.expandedKeys=e.tree.allExpandedKeys:e.tree.expandedKeys=[]}return(y,t)=>{const u=p("a-button"),i=p("a-radio"),f=p("a-radio-group"),c=p("a-divider"),x=p("a-checkbox"),D=p("a-tree"),C=p("a-spin"),b=p("a-modal");return K(),B(b,{open:e.visible,"onUpdate:open":t[11]||(t[11]=a=>e.visible=a),title:"数据权限设置",centered:"",onOk:t[12]||(t[12]=a=>e.visible=!1),width:400},{footer:o(()=>[n(u,{type:"primary",loading:e.loading,onClick:t[0]||(t[0]=a=>h())},{default:o(()=>[r(" 提交")]),_:1},8,["loading"]),n(u,{onClick:t[1]||(t[1]=a=>e.visible=!1)},{default:o(()=>[r("关闭")]),_:1})]),default:o(()=>[n(C,{spinning:e.loading},{default:o(()=>[n(f,{value:e.vm.form.sysDataAuthority.permissionType,"onUpdate:value":t[2]||(t[2]=a=>e.vm.form.sysDataAuthority.permissionType=a)},{default:o(()=>[n(i,{style:{display:"flex",height:"30px",lineHeight:"30px"},value:1},{default:o(()=>[r("自定义权限")]),_:1}),n(i,{style:{display:"flex",height:"30px",lineHeight:"30px"},value:2},{default:o(()=>[r("查看所有数据")]),_:1}),n(i,{style:{display:"flex",height:"30px",lineHeight:"30px"},value:3},{default:o(()=>[r("仅查看本组织")]),_:1}),n(i,{style:{display:"flex",height:"30px",lineHeight:"30px"},value:4},{default:o(()=>[r("仅查看本组织和下属组织")]),_:1}),n(i,{style:{display:"flex",height:"30px",lineHeight:"30px"},value:5},{default:o(()=>[r("仅查看本人")]),_:1})]),_:1},8,["value"]),e.vm.form.sysDataAuthority.permissionType===1?(K(),T("div",z,[n(c,null,{default:o(()=>[r("自定义数据权限")]),_:1}),A("div",I,[n(x,{checked:e.selectAll,"onUpdate:checked":t[3]||(t[3]=a=>e.selectAll=a),onChange:t[4]||(t[4]=a=>k())},{default:o(()=>[r("全选/全不选")]),_:1},8,["checked"]),n(x,{checked:e.expandedAll,"onUpdate:checked":t[5]||(t[5]=a=>e.expandedAll=a),onChange:t[6]||(t[6]=a=>_())},{default:o(()=>[r("展开/折叠")]),_:1},8,["checked"])]),A("div",U,[n(D,{expandedKeys:e.tree.expandedKeys,"onUpdate:expandedKeys":t[7]||(t[7]=a=>e.tree.expandedKeys=a),checkedKeys:e.tree.checkedKeys,"onUpdate:checkedKeys":t[8]||(t[8]=a=>e.tree.checkedKeys=a),onCheck:t[9]||(t[9]=a=>e.selectAll=a.length==e.tree.allKeys.length),onExpand:t[10]||(t[10]=a=>e.expandedAll=a.length==e.tree.allExpandedKeys.length),checkable:"","tree-data":e.tree.data},null,8,["expandedKeys","checkedKeys","tree-data"])])])):H("",!0)]),_:1},8,["spinning"])]),_:1},8,["open"])}}});export{N as _};
