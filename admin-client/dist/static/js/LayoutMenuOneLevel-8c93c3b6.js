import{d as J,C as K,A as z,v as B,n as h,m as d,r as T,q as N,e as R,f as x,o as n,c as u,u as s,g as r,M as p,G as y,l as f,w as M,B as _,R as g,t as v,j as V,a as w}from"./index-5ce8de01.js";import{_ as S}from"./AppIcon.vue_vue_type_script_setup_true_lang-7672b527.js";import{M as P,E as k}from"./MenuStore-d0fd35df.js";import{h as b}from"./hzy-0a0982eb.js";import{_ as j}from"./_plugin-vue_export-helper-c27b6911.js";const E={key:0,class:"hzy-left-nav"},A={class:"hzy-logo"},F=["src"],q=["onClick"],D={class:"mt-8"},G={key:1,class:"hzy-one-nav"},I=["onClick"],W={class:"menu-item"},H={class:"ml-5"},O=J({__name:"LayoutMenuOneLevel",setup(Q){K(e=>{var c;return{"0a53a6cd":s(i).state.leftModeWidth+"px","07a0f518":(c=s(C).state.tokenTheme)==null?void 0:c.colorPrimary}});const i=P(),a=z(),C=B(),L=h(()=>d.currentRoute.value.fullPath),m=h(()=>a.getTopMenuIdByCurrentRoute()),l=T({selectedKey:L.value});N(()=>d.currentRoute.value,e=>{t.initTopMenu()});const t={initTopMenu(){if(m.value)l.selectedKey=m.value.toString(),t.onMenuSelected(m.value.toString());else if(a.state.oneLevels.length>0){var e=a.state.oneLevels[0];l.selectedKey=t.getJumpUrl(e),t.onMenuSelected(l.selectedKey)}},onMenuSelected(e){const c=a.getRouterByFullPath(e);c&&d.hasRoute(c.name)&&l.selectedKey!=e?d.push(e):(l.selectedKey=e,a.setSubmenu(e))},getJumpUrl(e){return e.jumpUrl?e.jumpUrl:e.componentName?e.componentName:e.id}};return R(()=>{a.createOneLevelMenu(),t.initTopMenu()}),(e,c)=>{const U=x("a-tooltip");return n(),u(p,null,[s(i).state.menuMode==s(k).left?(n(),u("div",E,[r("div",A,[r("img",{src:s(b),width:"80",alt:"logo"},null,8,F)]),r("ul",null,[(n(!0),u(p,null,y(s(a).state.oneLevels,o=>(n(),f(U,{placement:"right"},{title:M(()=>[V(v(e.$t(`menu.${o.id}`)),1)]),default:M(()=>[(n(),u("li",{key:t.getJumpUrl(o),class:g({active:t.getJumpUrl(o)==l.selectedKey}),onClick:$=>t.onMenuSelected(t.getJumpUrl(o))},[w(S,{name:o.icon,size:22},null,8,["name"]),r("div",D,v(e.$t(`menu.${o.id}`)),1)],10,q))]),_:2},1024))),256))])])):_("",!0),s(i).state.menuMode==s(k).top?(n(),u("ul",G,[(n(!0),u(p,null,y(s(a).state.oneLevels,o=>(n(),u("li",{key:t.getJumpUrl(o),class:g({active:t.getJumpUrl(o)==l.selectedKey}),onClick:$=>t.onMenuSelected(t.getJumpUrl(o))},[r("div",W,[o.icon?(n(),f(S,{key:0,name:o.icon,size:16},null,8,["name"])):_("",!0),r("div",H,v(e.$t(`menu.${o.id}`)),1)])],10,I))),128))])):_("",!0)],64)}}});const oe=j(O,[["__scopeId","data-v-b29145ca"]]);export{oe as default};
