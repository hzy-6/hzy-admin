import{d as I,G as j,C as w,t as b,e as B,v as i,r as f,o,a,w as p,u as t,c,i as h,F as m,f as _,j as x,x as y}from"./index-5bb0c9d3.js";import{_ as C}from"./LayoutMenuSub.vue_vue_type_script_setup_true_lang-2429a517.js";import{M as L,E as U}from"./MenuStore-6bad5bcb.js";import{_ as k}from"./AppIcon.vue_vue_type_script_setup_true_lang-1df6f72d.js";import{_ as V}from"./_plugin-vue_export-helper-c4cb8a60.js";const E={class:"el-icon"},F={style:{"font-weight":"400"},class:"el-menu-title"},N={class:"el-icon"},O={style:{"font-weight":"400"},class:"el-menu-title"},P=I({__name:"LayoutMenu",setup(R){j(s=>({"643fa57a":t(n).menuCustomThemes[t(n).state.menuCustomThemesIndex].activeBgColor}));const v=w(),n=L(),d=b(),g=B(()=>i.currentRoute.value.fullPath);function M(s,u,r){console.log(s,u,r),s.indexOf("http://")>-1||s.indexOf("https://")>-1?i.push("/external/jump/"+s):i.push(s)}return(s,u)=>{const r=f("el-menu-item"),S=f("el-menu");return o(),a(S,{"default-active":t(g),"collapse-transition":!1,collapse:t(n).state.isCollapse&&!t(v).state.isMobile,"active-text-color":t(n).menuCustomThemes[t(n).state.menuCustomThemesIndex].activeTextColor,"background-color":t(n).menuCustomThemes[t(n).state.menuCustomThemesIndex].backgroundColor,"text-color":t(n).menuCustomThemes[t(n).state.menuCustomThemesIndex].textColor,onSelect:u[0]||(u[0]=(e,l,T)=>M(e,l,T))},{default:p(()=>[t(n).state.menuMode!=t(U).default?(o(!0),c(m,{key:0},h(t(d).state.subMenus,e=>(o(),c(m,null,[e.children.filter(l=>l.show).length==0&&e.type==2?(o(),a(r,{key:0,index:e.jumpUrl?e.jumpUrl:e.id+"",title:e.name},{default:p(()=>[_("i",E,[e.icon?(o(),a(k,{key:0,name:e.icon,class:"el-icon"},null,8,["name"])):x("",!0)]),_("span",F,y(e.name),1)]),_:2},1032,["index","title"])):(o(),a(C,{key:1,"menu-info":e},null,8,["menu-info"]))],64))),256)):(o(!0),c(m,{key:1},h(t(d).state.userInfo.menus,e=>(o(),c(m,null,[e.children.filter(l=>l.show).length==0&&e.type==2?(o(),a(r,{key:0,index:e.jumpUrl?e.jumpUrl:e.id+"",title:e.name},{default:p(()=>[_("i",N,[e.icon?(o(),a(k,{key:0,name:e.icon,class:"el-icon"},null,8,["name"])):x("",!0)]),_("span",O,y(e.name),1)]),_:2},1032,["index","title"])):(o(),a(C,{key:1,"menu-info":e},null,8,["menu-info"]))],64))),256))]),_:1},8,["default-active","collapse","active-text-color","background-color","text-color"])}}});const z=V(P,[["__scopeId","data-v-0c5e730e"]]);export{z as default};
