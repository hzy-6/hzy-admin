import{T as L}from"./TimedTaskService-f9ca3f47.js";import{d as k,x,r,o as m,e as f,w as l,a as d,c as w,k as E,j as u,t as v,F as B}from"./index-ddc31fce.js";const h=k({__name:"LogInfo",setup(C,{expose:c}){const e=x({vm:{id:"",form:{}},visible:!1,saveLoading:!1,page:1});c({open:(n="")=>{e.visible=!0,e.visible&&(e.vm.id=n),p(n,!0)}});function p(n,t){e.saveLoading=!0,L.getJobLoggers(n,e.page).then(a=>{if(e.saveLoading=!1,a.code!=1)return;if(e.vm.form.data=a.data,!a.data||a.data.length==0){e.page=e.page-1;return}const o=[];t||e.vm.form.data.forEach(i=>{o.push(i)}),a.data.forEach(i=>{o.push(i)}),e.vm.form.data=o})}function g(){e.page=e.page+1,p(e.vm.id,!1)}return(n,t)=>{const a=r("a-timeline-item"),o=r("a-timeline"),i=r("a-button"),_=r("a-spin"),b=r("a-drawer");return m(),f(b,{visible:e.visible,"onUpdate:visible":t[1]||(t[1]=s=>e.visible=s),title:"\u4EFB\u52A1\u65E5\u5FD7",centered:"",onOk:t[2]||(t[2]=s=>e.visible=!1),width:1200},{default:l(()=>[d(_,{spinning:e.saveLoading},{default:l(()=>[d(o,null,{default:l(()=>[(m(!0),w(B,null,E(e.vm.form.data,s=>(m(),f(a,null,{default:l(()=>[u(v(s.text),1)]),_:2},1024))),256))]),_:1}),d(i,{type:"primary",class:"mt-18",block:"",onClick:t[0]||(t[0]=s=>g())},{default:l(()=>[u("Next Page "+v(e.page),1)]),_:1})]),_:1},8,["spinning"])]),_:1},8,["visible"])}}});export{h as _};