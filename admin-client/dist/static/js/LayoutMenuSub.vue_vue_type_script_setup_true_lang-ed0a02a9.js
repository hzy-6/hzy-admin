import{_ as m}from"./AppIcon.vue_vue_type_script_setup_true_lang-7672b527.js";import{d as I,f as a,o as e,l as t,w as s,S as b,B as c,g as i,t as p,c as f,G as g,M as _}from"./index-5ce8de01.js";const C=I({__name:"LayoutMenuSub",props:{menuInfo:{}},setup(d){const o=d;return(u,B)=>{const y=a("a-menu-item"),h=a("LayoutMenuSub",!0),k=a("a-sub-menu");return e(),t(k,b({key:o.menuInfo.id},u.$attrs),{title:s(()=>[o.menuInfo.icon?(e(),t(m,{key:0,name:o.menuInfo.icon},null,8,["name"])):c("",!0),i("span",null,p(u.$t(`menu.${o.menuInfo.id}`)),1)]),default:s(()=>{var r;return[(e(!0),f(_,null,g((r=o.menuInfo.children)==null?void 0:r.filter(n=>n.show),n=>{var l;return e(),f(_,null,[!n.children||((l=n.children)==null?void 0:l.filter($=>$.show).length)==0&&n.type==2?(e(),t(y,{key:n.id,title:u.$t(`menu.${n.id}`)},{default:s(()=>[n.icon?(e(),t(m,{key:0,name:n.icon},null,8,["name"])):c("",!0),i("span",null,p(u.$t(`menu.${n.id}`)),1)]),_:2},1032,["title"])):(e(),t(h,{"menu-info":n,key:n.id},null,8,["menu-info"]))],64)}),256))]}),_:1},16)}}});export{C as _};
