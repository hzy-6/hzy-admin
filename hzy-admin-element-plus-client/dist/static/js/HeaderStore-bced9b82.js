import{m as n,p as l,C as d,q as S}from"./index-5bb0c9d3.js";const g=n("SettingsStore",()=>{let t=l({isOpen:!1});function e(s){t.isOpen=s}return{state:t,onOpen:e}}),o=window.location.origin,u=n("HeaderStore",()=>{const t=d();let e=l({class:[]});function s(a){e.class=[];var r=i.getHeaderClass();r&&e.class.push(r)}s(t.state.isDark),S(()=>t.state.isDark,a=>{s()});function c(a){i.setHeaderClass(a),s(t.state.isDark)}return{state:e,setHeaderClass:c}});class i{static setHeaderClass(e){localStorage.setItem(`${o}_header_class`,e||"")}static getHeaderClass(){return localStorage.getItem(`${o}_header_class`)}}export{u as H,g as S};
