import{d as $,C as F,A as N,L as V,D as j,v as E,n as R,f as u,o as l,l as y,w as t,g as i,a as e,u as n,c as m,B as h,j as r,t as A,T as P,m as z}from"./index-5ce8de01.js";import{_ as s}from"./AppIcon.vue_vue_type_script_setup_true_lang-7672b527.js";import{u as I}from"./index-5fc1cca4.js";import U from"./LayoutMenuOneLevel-8c93c3b6.js";import{M as q,E as G}from"./MenuStore-d0fd35df.js";import{S as J}from"./SettingsStore-3ed109bb.js";import{_ as K}from"./LanguageComponent.vue_vue_type_script_setup_true_lang-b9e5102b.js";const Q={key:0,style:{flex:"1 1 0%",height:"100%",display:"flex"}},W={key:1,style:{flex:"1 1 0%"}},X={class:"hzy-header-btn"},Y={class:"hzy-header-btn"},Z={href:"javascript:;"},a=16,de=$({__name:"LayoutHeader",setup(ee){F(O=>({"091c5174":b.value}));const v=N(),_=V(),p=q();j();const g=J(),f=E(),b=R(()=>f.state.isDark?"rgba(255, 255, 255, 0.2)":"rgba(0, 0, 0, 0.04)"),{isFullscreen:C,enter:te,exit:ne,toggle:k}=I();function S(){P.confirm("您确定要退出登录吗?",()=>z.push("/login"))}function w(){_.refresh(z.currentRoute.value.fullPath)}function x(){window.open("https://www.yuque.com/u378909/yidf7v","_black")}function M(){window.open("http://124.221.128.7:6600/","_black")}return(O,o)=>{const B=u("a-badge"),d=u("a-tooltip"),L=u("a-menu-item"),D=u("a-menu"),H=u("a-dropdown"),T=u("a-layout-header");return l(),y(T,{class:"hzy-layout-header"},{default:t(()=>[i("div",{class:"hzy-header-btn",onClick:o[0]||(o[0]=c=>n(p).onChangeCollapse(!n(p).state.isCollapse))},[e(s,{name:n(p).state.isCollapse?"MenuUnfoldOutlined":"MenuFoldOutlined",size:a},null,8,["name"])]),n(p).state.menuMode==n(G).top?(l(),m("div",Q,[e(U)])):(l(),m("div",W)),n(_).state.isMobile?h("",!0):(l(),m("div",{key:2,class:"hzy-header-btn text-danger",onClick:o[1]||(o[1]=c=>M()),style:{"font-weight":"bold"}},"Pro By React ")),e(d,null,{title:t(()=>[r("HzyAdmin 文档")]),default:t(()=>[n(_).state.isMobile?h("",!0):(l(),m("div",{key:0,class:"hzy-header-btn",onClick:x},[e(B,{status:"success",dot:""},{default:t(()=>[e(s,{name:"rocket-outlined",size:a})]),_:1})]))]),_:1}),e(d,null,{title:t(()=>[r("刷新当前选项卡")]),default:t(()=>[i("div",{class:"hzy-header-btn",onClick:w},[e(s,{name:"ReloadOutlined",size:a})])]),_:1}),e(d,null,{title:t(()=>[r("全屏")]),default:t(()=>[n(_).state.isMobile?h("",!0):(l(),m("div",{key:0,class:"hzy-header-btn",onClick:o[2]||(o[2]=(...c)=>n(k)&&n(k)(...c))},[e(s,{name:n(C)?"FullscreenExitOutlined":"FullscreenOutlined",size:a},null,8,["name"])]))]),_:1}),e(d,null,{title:t(()=>[r("暗黑")]),default:t(()=>[i("div",{class:"hzy-header-btn",onClick:o[3]||(o[3]=c=>n(f).changeTheme(!n(f).state.isDark))},[n(f).state.isDark?(l(),y(s,{key:0,name:"Sunny",size:a})):(l(),y(s,{key:1,name:"MoonNight",size:a}))])]),_:1}),e(K,null,{default:t(()=>[i("div",X,[e(s,{name:"TranslationOutlined",size:a})])]),_:1}),e(H,null,{overlay:t(()=>[e(D,null,{default:t(()=>[e(L,{onClick:S},{default:t(()=>[i("a",Z,[e(s,{name:"LogoutOutlined"}),r("  退出登录 ")])]),_:1})]),_:1})]),default:t(()=>[i("div",Y,[e(s,{name:"UserOutlined",size:a}),r("    "),i("span",null,A(n(v).state.userInfo.name?n(v).state.userInfo.name:"未知用户"),1)])]),_:1}),e(d,null,{title:t(()=>[r("界面设置")]),default:t(()=>[i("div",{class:"hzy-header-btn",onClick:o[4]||(o[4]=c=>n(g).isShow())},[e(s,{name:"SettingOutlined",size:a})])]),_:1})]),_:1})}}});export{de as _};
