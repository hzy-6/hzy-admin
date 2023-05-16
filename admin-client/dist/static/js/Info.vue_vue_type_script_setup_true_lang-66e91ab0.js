var K=Object.defineProperty;var W=(x,u,f)=>u in x?K(x,u,{enumerable:!0,configurable:!0,writable:!0,value:f}):x[u]=f;var A=(x,u,f)=>(W(x,typeof u!="symbol"?u+"":u,f),f);import{H as U,d as X,r as Y,b as Z,f as s,o as _,l as c,w as t,a as l,i as a,t as Q,z as y,g as F,T as w}from"./index-1d3290fc.js";import ee from"./AppIconList-b96c1f2a.js";import{_ as k}from"./AppIcon.vue_vue_type_script_setup_true_lang-5c9d9d70.js";class P{static findList(u,f,e={},h=[]){return U.post(`${this.urlPrefix}/findList`,{page:u,size:f,search:e,searchSort:h})}static deleteList(u){return U.post(`${this.urlPrefix}/deleteList`,u)}static findForm(u){return U.get(`${this.urlPrefix}/findForm${u?"/"+u:""}`)}static saveForm(u,f){return U.post(`${this.urlPrefix}/${u?"update":"create"}`,f)}static exportExcel(u={},f=[]){return U.download(`${this.urlPrefix}/exportExcel`,{page:-1,size:-1,search:u,searchSort:f})}static getAll(u={}){return U.post(`${this.urlPrefix}/getAll`,u)}static copyMenu(u){return U.post(`${this.urlPrefix}/copyMenu${u?"/"+u:""}`)}}A(P,"urlPrefix","/api/v1/admin/SysMenu");const te=F("a",{href:"https://next.antdv.com/components/icon-cn",target:"black"}," AntdV 3.0 官方icon ",-1),le=F("p",null,"http://ip:port/#/页面地址/{menuid}/{token}",-1),ne=F("p",null,"1、加入菜单id采用代码 {menuid}",-1),oe=F("p",null,"2、加入token 采用代码 {token}",-1),ae=F("p",null,"参考模板：http://ip:port/pages/页面存放目录/index.html#/页面地址/{menuid}",-1),ue=F("p",null,"1、加入菜单id采用代码 {menuid}",-1),me=F("p",null,"2、加入token 采用代码 {token}",-1),ie={class:"text-center p-15"},ve=X({__name:"Info",props:{onSuccess:{type:Function}},setup(x,{expose:u}){const f=x,e=Y({vm:{id:"",form:{},allFunctions:[],menuFunctionList:[]},visible:!1,loading:!1,parentId:null,checkAll:!1,indeterminate:!1,iconFormVisible:!1}),h=Z();u({open:(i="",n="")=>{var m;e.visible=!0,e.visible&&(e.vm.id=i),(m=h.value)==null||m.resetFields(),e.parentId=n,e.loading=!0,P.findForm(i).then(g=>{e.loading=!1,g.code==1&&(e.vm=g.data,e.vm.menuFunctionList.length==0&&e.vm.allFunctions.length>0&&I())})}});function S(){var i;(i=h.value)==null||i.validate().then(async()=>{if(e.vm.form.type==2&&e.vm.menuFunctionList.length==0)return w.message.warning("请设置功能模块!");if(e.vm.form.type==2&&e.vm.menuFunctionList.length>0){var n=e.vm.menuFunctionList;for(let m=0;m<n.length;m++){const g=n[m];if(!g.number)return w.message.warning(`功能模块设置第${m+1}行 请填写序号!`);if(!g.functionCode)return w.message.warning(`功能模块设置第${m+1}行 请填写功能编码!`);if(!g.functionName)return w.message.warning(`功能模块设置第${m+1}行 请填写功能名称!`)}}try{e.loading=!0,e.vm.form.parentId=e.parentId??e.vm.form.parentId;const m=await P.saveForm(e.vm.id,e.vm);if(e.loading=!1,m.code!=1)return;w.message.success("操作成功!"),f.onSuccess(),e.visible=!1}catch{e.loading=!1}})}function V(i){return{number:i.number,menuId:e.vm.id?e.vm.id:0,functionCode:i.byName,functionName:i.name,remark:i.remark}}function I(){e.vm.menuFunctionList=[],e.vm.allFunctions.forEach(i=>{O(V(i))})}function z(){e.vm.menuFunctionList=[];var i=e.vm.allFunctions.filter(n=>n.byName=="Display");i.length>0&&e.vm.menuFunctionList.push(V(i[0]))}function M(i){var n=e.vm.menuFunctionList;e.vm.menuFunctionList=[];for(let m=0;m<n.length;m++){const g=n[m];m!=i&&e.vm.menuFunctionList.push(g)}}function O(i){i?e.vm.menuFunctionList.push(i):(e.vm.menuFunctionList.push({number:0,menuId:e.vm.id?e.vm.id:0,functionCode:"",functionName:"",remark:""}),console.log(e.vm.menuFunctionList))}function B(){e.vm.form.mode==2&&(e.vm.form.url="core/components/layouts/LayoutIframe.vue",e.vm.form.moduleUrl="http://ip:port/#/页面地址/{menuid}/{token}",e.vm.form.moduleUrlPro="http://ip:port/pages/页面存放目录/index.html#/页面地址/{menuid}")}function D(){e.vm.form.router=e.vm.form.componentName?"/"+e.vm.form.componentName:""}return(i,n)=>{const m=s("a-button"),g=s("a-space"),d=s("a-form-item"),r=s("a-col"),v=s("a-radio"),C=s("a-radio-group"),p=s("a-input"),T=s("a-input-search"),j=s("a-modal"),$=s("a-tooltip"),N=s("a-row"),L=s("a-table-column"),E=s("a-input-number"),H=s("a-popconfirm"),R=s("a-table"),q=s("a-form"),G=s("a-spin"),J=s("a-drawer");return _(),c(J,{visible:e.visible,"onUpdate:visible":n[24]||(n[24]=o=>e.visible=o),title:e.vm.id?"编辑":"新建",centered:"",onOk:n[25]||(n[25]=o=>e.visible=!1),width:1300},{footer:t(()=>[l(g,{size:8},{default:t(()=>[l(m,{type:"primary",loading:e.loading,onClick:n[0]||(n[0]=o=>S())},{default:t(()=>[a(" 提交")]),_:1},8,["loading"]),l(m,{onClick:n[1]||(n[1]=o=>e.visible=!1)},{default:t(()=>[a("关闭")]),_:1})]),_:1})]),default:t(()=>[l(G,{spinning:e.loading},{default:t(()=>[l(q,{ref_key:"refForm",ref:h,layout:"vertical",model:e.vm.form},{default:t(()=>[l(N,{gutter:[16,0]},{default:t(()=>[l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,{label:"菜单Id"},{default:t(()=>[a(Q(e.vm.form.id),1)]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,{label:"选项类型"},{default:t(()=>[l(C,{value:e.vm.form.type,"onUpdate:value":n[2]||(n[2]=o=>e.vm.form.type=o)},{default:t(()=>[l(v,{value:1},{default:t(()=>[a("目录")]),_:1}),l(v,{value:2},{default:t(()=>[a("菜单")]),_:1})]),_:1},8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,{label:"模式"},{default:t(()=>[l(C,{value:e.vm.form.mode,"onUpdate:value":n[3]||(n[3]=o=>e.vm.form.mode=o),onChange:B},{default:t(()=>[l(v,{value:1},{default:t(()=>[a("普通")]),_:1}),l(v,{value:2},{default:t(()=>[a("微前端")]),_:1})]),_:1},8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,{label:"编号"},{default:t(()=>[l(p,{value:e.vm.form.number,"onUpdate:value":n[4]||(n[4]=o=>e.vm.form.number=o),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,{label:"菜单名称"},{default:t(()=>[l(p,{value:e.vm.form.name,"onUpdate:value":n[5]||(n[5]=o=>e.vm.form.name=o),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,null,{label:t(()=>[a(" 图标  "),te]),default:t(()=>[l(T,{value:e.vm.form.icon,"onUpdate:value":n[6]||(n[6]=o=>e.vm.form.icon=o),placeholder:"请输入",onSearch:n[7]||(n[7]=o=>e.iconFormVisible=!e.iconFormVisible)},{enterButton:t(()=>[e.vm.form.icon?(_(),c(k,{key:0,name:e.vm.form.icon},null,8,["name"])):(_(),c(k,{key:1,name:"search-outlined"}))]),_:1},8,["value"]),l(j,{visible:e.iconFormVisible,"onUpdate:visible":n[10]||(n[10]=o=>e.iconFormVisible=o),title:"图标库",width:"100%","wrap-class-name":"full-modal",footer:!1},{default:t(()=>[l(ee,{name:e.vm.form.icon,"onUpdate:name":n[8]||(n[8]=o=>e.vm.form.icon=o),onOnChangeName:n[9]||(n[9]=()=>e.iconFormVisible=!e.iconFormVisible)},null,8,["name"])]),_:1},8,["visible"])]),_:1})]),_:1}),e.vm.form.type==2?(_(),c(r,{key:0,xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,{label:"组件名称"},{default:t(()=>[l(p,{value:e.vm.form.componentName,"onUpdate:value":n[11]||(n[11]=o=>e.vm.form.componentName=o),placeholder:"请输入",onChange:D},null,8,["value"])]),_:1})]),_:1})):y("",!0),e.vm.form.type==2?(_(),c(r,{key:1,xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,{label:"菜单页面物理地址"},{default:t(()=>[l(p,{value:e.vm.form.url,"onUpdate:value":n[12]||(n[12]=o=>e.vm.form.url=o),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1})):y("",!0),e.vm.form.type==2?(_(),c(r,{key:2,xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,null,{label:t(()=>[a(" 菜单路由    "),l($,null,{title:t(()=>[a("跳转外部地址使用此表达式：/external/jump/:path(.*) 。并且要在跳转地址填上外部网址")]),default:t(()=>[l(k,{name:"QuestionCircleOutlined",class:"text-danger"})]),_:1})]),default:t(()=>[l(p,{value:e.vm.form.router,"onUpdate:value":n[13]||(n[13]=o=>e.vm.form.router=o),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1})):y("",!0),e.vm.form.type==2?(_(),c(r,{key:3,xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,null,{label:t(()=>[a(" 跳转地址    "),l($,null,{title:t(()=>[a("跳转地址（不填默认使用 菜单路由地址）支持 http、https")]),default:t(()=>[l(k,{name:"QuestionCircleOutlined",class:"text-danger"})]),_:1})]),default:t(()=>[l(p,{value:e.vm.form.jumpUrl,"onUpdate:value":n[14]||(n[14]=o=>e.vm.form.jumpUrl=o),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1})):y("",!0),e.vm.form.type==2?(_(),c(r,{key:4,xs:24},{default:t(()=>[l(N,{style:{width:"100%"}},{default:t(()=>[l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,null,{label:t(()=>[a(" 显示状态   "),l($,null,{title:t(()=>[a(" 隐藏后菜单不会显示在左侧显示，但是路由会自动添加到程序中 ")]),default:t(()=>[l(k,{name:"QuestionCircleOutlined",class:"text-danger"})]),_:1})]),default:t(()=>[l(C,{value:e.vm.form.show,"onUpdate:value":n[15]||(n[15]=o=>e.vm.form.show=o)},{default:t(()=>[l(v,{value:!0},{default:t(()=>[a("显示")]),_:1}),l(v,{value:!1},{default:t(()=>[a("隐藏")]),_:1})]),_:1},8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,null,{label:t(()=>[a(" 菜单状态    "),l($,null,{title:t(()=>[a("停用后菜单不会显示在左侧显示，并且路由也不会自动添加到程序中")]),default:t(()=>[l(k,{name:"QuestionCircleOutlined",class:"text-danger"})]),_:1})]),default:t(()=>[l(C,{value:e.vm.form.state,"onUpdate:value":n[16]||(n[16]=o=>e.vm.form.state=o)},{default:t(()=>[l(v,{value:!0},{default:t(()=>[a("正常")]),_:1}),l(v,{value:!1},{default:t(()=>[a("停用")]),_:1})]),_:1},8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,{label:"是否缓存组件"},{default:t(()=>[l(C,{value:e.vm.form.keepAlive,"onUpdate:value":n[17]||(n[17]=o=>e.vm.form.keepAlive=o)},{default:t(()=>[l(v,{value:!0},{default:t(()=>[a("是")]),_:1}),l(v,{value:!1},{default:t(()=>[a("否")]),_:1})]),_:1},8,["value"])]),_:1})]),_:1}),l(r,{xs:24,sm:12,md:12,lg:12,xl:6},{default:t(()=>[l(d,{label:"选项卡能否关闭"},{default:t(()=>[l(C,{value:e.vm.form.close,"onUpdate:value":n[18]||(n[18]=o=>e.vm.form.close=o)},{default:t(()=>[l(v,{value:!0},{default:t(()=>[a("是")]),_:1}),l(v,{value:!1},{default:t(()=>[a("否")]),_:1})]),_:1},8,["value"])]),_:1})]),_:1})]),_:1})]),_:1})):y("",!0),e.vm.form.type==2?(_(),c(N,{key:5,gutter:[16,0],style:{width:"100%"}},{default:t(()=>[e.vm.form.type==2&&e.vm.form.mode==2?(_(),c(r,{key:0,xs:24,sm:12,md:12,lg:12,xl:12},{default:t(()=>[l(d,null,{label:t(()=>[a(" 模块地址（Dev 开发模式）    "),l($,null,{title:t(()=>[a(" 参考模板: "),le,ne,oe]),default:t(()=>[l(k,{name:"QuestionCircleOutlined",class:"text-danger"})]),_:1})]),default:t(()=>[l(p,{value:e.vm.form.moduleUrl,"onUpdate:value":n[19]||(n[19]=o=>e.vm.form.moduleUrl=o),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1})):y("",!0),e.vm.form.type==2&&e.vm.form.mode==2?(_(),c(r,{key:1,xs:24,sm:12,md:12,lg:12,xl:12},{default:t(()=>[l(d,null,{label:t(()=>[a(" 模块地址（Pro 生产模式）    "),l($,null,{title:t(()=>[a(" 参考模板: "),ae,ue,me]),default:t(()=>[l(k,{name:"QuestionCircleOutlined",class:"text-danger"})]),_:1})]),default:t(()=>[l(p,{value:e.vm.form.moduleUrlPro,"onUpdate:value":n[20]||(n[20]=o=>e.vm.form.moduleUrlPro=o),placeholder:"请输入"},null,8,["value"])]),_:1})]),_:1})):y("",!0)]),_:1})):y("",!0),l(r,{xs:24},{default:t(()=>[l(R,{"data-source":e.vm.menuFunctionList,size:"small",pagination:!1},{default:t(()=>[l(L,{key:"index",title:"索引"},{default:t(({index:o})=>[a(Q(o+1),1)]),_:1}),l(L,{key:"number",title:"序号","data-index":"number"},{default:t(({record:o})=>[l(E,{value:o.number,"onUpdate:value":b=>o.number=b,min:1,max:500},null,8,["value","onUpdate:value"])]),_:1}),l(L,{key:"functionCode",title:"功能编码","data-index":"functionCode"},{default:t(({record:o})=>[l(p,{value:o.functionCode,"onUpdate:value":b=>o.functionCode=b,placeholder:"功能编码"},null,8,["value","onUpdate:value"])]),_:1}),l(L,{key:"functionName",title:"功能名称","data-index":"functionName"},{default:t(({record:o})=>[l(p,{value:o.functionName,"onUpdate:value":b=>o.functionName=b,placeholder:"功能编码"},null,8,["value","onUpdate:value"])]),_:1}),l(L,{key:"remark",title:"备注","data-index":"remark"},{default:t(({record:o})=>[l(p,{value:o.remark,"onUpdate:value":b=>o.remark=b,placeholder:"功能编码"},null,8,["value","onUpdate:value"])]),_:1}),l(L,{key:"action",title:"操作"},{default:t(({index:o})=>[l(H,{title:"确定要移除吗？","ok-text":"是","cancel-text":"否",onConfirm:b=>M(o)},{default:t(()=>[l(m,{type:"link",danger:""},{default:t(()=>[a("移除")]),_:1})]),_:2},1032,["onConfirm"])]),_:1})]),_:1},8,["data-source"]),F("div",ie,[l(m,{type:"primary",onClick:n[21]||(n[21]=o=>O())},{default:t(()=>[a("添加一行")]),_:1}),l(m,{class:"ml-15",onClick:n[22]||(n[22]=o=>I())},{default:t(()=>[a("使用默认功能集")]),_:1}),l(m,{class:"ml-15",onClick:n[23]||(n[23]=o=>z())},{default:t(()=>[a("使用显示功能")]),_:1})])]),_:1})]),_:1})]),_:1},8,["model"])]),_:1},8,["spinning"])]),_:1},8,["visible","title"])}}});export{P as S,ve as _};