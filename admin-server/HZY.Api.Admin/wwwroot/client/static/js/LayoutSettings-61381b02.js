import{L as z,M as w}from"./MenuStore-74778aad.js";import{H as M,S as L}from"./SettingsStore-dce6f951.js";import{d as B,f as i,o as r,l as f,w as t,a as s,i as a,g as u,c as _,B as h,z as V,u as e,F as k,s as H,x as C}from"./index-ceef6588.js";import{_ as N}from"./_plugin-vue_export-helper-c27b6911.js";const T={class:"hzy-skin-list mb-5 text-center"},$=["onClick"],F={class:"mt-16 text-center"},I={class:"hzy-skin-list mb-5 text-center"},U=["onClick"],E={key:1,class:"mt-16 text-center"},G=B({__name:"LayoutSettings",setup(j){const p=z(),d=w(),v=M(),y=L();return(q,n)=>{const c=i("a-divider"),g=i("a-button"),m=i("a-radio"),b=i("a-radio-group"),S=i("a-drawer");return r(),f(S,{class:"hzy-settings",placement:"right",width:"300px",closable:!1,visible:e(y).state.show,"onUpdate:visible":n[2]||(n[2]=o=>e(y).state.show=o)},{default:t(()=>[s(c,null,{default:t(()=>[a("头部颜色")]),_:1}),u("div",T,[(r(),_(k,null,h(12,(o,l)=>u("div",{key:l,class:V(["hzy-skin-item","hzy-layout-header-"+l]),onClick:x=>e(v).setHeaderClass("hzy-layout-header-"+l)},null,10,$)),64))]),s(g,{block:"",onClick:n[0]||(n[0]=o=>e(v).setHeaderClass(""))},{default:t(()=>[a("重置")]),_:1}),s(c,null,{default:t(()=>[a("菜单颜色")]),_:1}),u("div",F,[u("div",I,[(r(!0),_(k,null,h(e(d).menuCustomThemes,(o,l)=>(r(),_("div",{key:l,class:"hzy-skin-item",style:H([{border:"1px solid #67c23a"},{backgroundColor:o.backgroundColor}]),onClick:x=>e(d).onChangeMenuCustomThemesIndex(l)},null,12,U))),128))])]),e(p).state.isMobile?C("",!0):(r(),f(c,{key:0},{default:t(()=>[a("菜单栏模式")]),_:1})),e(p).state.isMobile?C("",!0):(r(),_("div",E,[s(b,{name:"radioGroup",defaultValue:"1",value:e(d).state.menuMode,"onUpdate:value":n[1]||(n[1]=o=>e(d).state.menuMode=o)},{default:t(()=>[s(m,{value:"1"},{default:t(()=>[a("默认")]),_:1}),s(m,{value:"2"},{default:t(()=>[a("顶部")]),_:1}),s(m,{value:"3"},{default:t(()=>[a("左侧")]),_:1})]),_:1},8,["value"])]))]),_:1},8,["visible"])}}});const O=N(G,[["__scopeId","data-v-87a6e81e"]]);export{O as default};