import{_ as v}from"./AppIcon.vue_vue_type_script_setup_true_lang-5c9d9d70.js";import{d as T,A as D,m as E,T as I,r as L,j as c,n as U,f as h,o as t,l as a,w as K,u as f,c as m,D as k,G as y,z as M,g,t as S}from"./index-1d3290fc.js";import{_ as w}from"./LayoutMenuSub.vue_vue_type_script_setup_true_lang-d93f0759.js";import{M as j,E as A}from"./MenuStore-d8f43d95.js";const z=T({__name:"LayoutMenu",setup(N){const C=j(),i=D(),x=E(()=>I.genTreeData(i.state.userInfo.menus,null)),r=L({defaultSelectedKeys:[c.currentRoute.value.meta.menuId??""],selectedKeys:[c.currentRoute.value.meta.menuId??""],openKeys:B()});U(()=>c.currentRoute.value,u=>{r.selectedKeys=[u.meta.menuId??""]});function B(){let n=c.currentRoute.value.meta.levelCode;if(!n)return[];var s=[];if(n.indexOf(".")>-1)for(var d=n.split("."),o=0;o<d.length-1;o++){var p=d[o];s.push(parseInt(p))}return s}function R(u){const n=i.state.userInfo.menus.find(s=>s.id==u.key);c.push({path:(n==null?void 0:n.jumpUrl)??(n==null?void 0:n.router)??"/404"})}return(u,n)=>{const s=h("a-menu-item"),d=h("a-menu");return t(),a(d,{mode:"inline",onSelect:R,selectedKeys:r.selectedKeys,"onUpdate:selectedKeys":n[0]||(n[0]=o=>r.selectedKeys=o),openKeys:r.openKeys,"onUpdate:openKeys":n[1]||(n[1]=o=>r.openKeys=o)},{default:K(()=>{var o,p;return[f(C).state.menuMode!=f(A).default?(t(!0),m(y,{key:0},k((o=f(i).state.subMenus)==null?void 0:o.filter(e=>e.show),e=>{var l;return t(),m(y,null,[!e.children||((l=e.children)==null?void 0:l.filter(_=>_.show).length)==0&&e.type==2?(t(),a(s,{key:e.id,title:e.name},{default:K(()=>[e.icon?(t(),a(v,{key:0,name:e.icon},null,8,["name"])):M("",!0),g("span",null,S(e.name),1)]),_:2},1032,["title"])):(t(),a(w,{key:1,"menu-info":e},null,8,["menu-info"]))],64)}),256)):(t(!0),m(y,{key:1},k((p=f(x))==null?void 0:p.filter(e=>e.show),e=>{var l;return t(),m(y,null,[!e.children||((l=e.children)==null?void 0:l.filter(_=>_.show).length)==0&&e.type==2?(t(),a(s,{key:e.id,title:e.name},{default:K(()=>[e.icon?(t(),a(v,{key:0,name:e.icon},null,8,["name"])):M("",!0),g("span",null,S(e.name),1)]),_:2},1032,["title"])):(t(),a(w,{key:1,"menu-info":e},null,8,["menu-info"]))],64)}),256))]}),_:1},8,["selectedKeys","openKeys"])}}});export{z as _};
