import{I as d,q as p,r as u,e as c,P as M,j as h,L as i,n as r}from"./index-1d3290fc.js";const f=d("LayoutStore",()=>{const o=p();let e=u({isMobile:!1,demarcation:768});c(()=>{t()});const t=()=>{e.isMobile=window.innerWidth<e.demarcation,window.onresize=()=>(()=>{e.isMobile=window.innerWidth<e.demarcation})()};function n(l){o.closeTabSelf(l),setTimeout(()=>{M(()=>{h.push("/redirect"+l)})},100)}return{state:e,refresh:n}});var S=(o=>(o.default="1",o.top="2",o.left="3",o))(S||{});const W=d("MenuStore",()=>{const o=f();var e=o.state.isMobile?!0:s.getCollapsed();let t=u({width:i.menu.maxWidth,minWidth:i.menu.minWidth,maxWidth:i.menu.maxWidth,mobileWidth:0,leftModeWidth:i.menu.leftModeWidth,isCollapse:e,menuMode:window.innerWidth<o.state.demarcation?"1":s.getMenuMode()});r(()=>t.menuMode,a=>s.setMenuMode(a)),r(()=>t.isCollapse,a=>n(a)),r(()=>o.state.isMobile,a=>{s.setMenuMode(window.innerWidth<o.state.demarcation?"1":s.getMenuMode()),a&&(t.isCollapse=!0),n(t.isCollapse)}),c(()=>{l(e),n(t.isCollapse)});function n(a){if(o.state.isMobile){t.width=0;return}a?t.width=t.minWidth:t.width=t.maxWidth}function l(a){t.isCollapse=a,s.setCollapsed(a)}function m(a){t.menuMode=a}return{state:t,onChangeCollapse:l,setMenuMode:m}});class s{static getCollapsed(){return localStorage.getItem(i.appPrefix+"_collapsed")=="1"}static setCollapsed(e){localStorage.setItem(i.appPrefix+"_collapsed",e?"1":"0")}static setMenuMode(e){localStorage.setItem(i.appPrefix+"_one_level_menu_mode",e.toString())}static getMenuMode(){let e=localStorage.getItem(i.appPrefix+"_one_level_menu_mode");return e||"1"}}export{S as E,f as L,W as M};
