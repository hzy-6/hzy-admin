var w=Object.defineProperty;var I=(s,o,n)=>o in s?w(s,o,{enumerable:!0,configurable:!0,writable:!0,value:n}):s[o]=n;var b=(s,o,n)=>(I(s,typeof o!="symbol"?o+"":o,n),n);import{_ as M}from"./PageContainer.vue_vue_type_script_setup_true_lang-lZgQDTDD.js";import{H as f,d as S,b as h,e as F,a6 as T,f as c,o as B,l as N,w as a,a as l,g as t,j as d,t as i,p as E,k as P}from"./index-cV5RpzD5.js";import{_ as $}from"./_plugin-vue_export-helper-x3n3nnut.js";import"./AppIcon.vue_vue_type_script_setup_true_lang-Fnoq4ehk.js";class m{static getEFCoreMonitorContext(){return f.post(`${this.urlPrefix}/GetEFCoreMonitorContext/`)}static getTimeConsumingRanking(){return f.post(`${this.urlPrefix}/GetTimeConsumingRanking/`)}static getNewest(){return f.post(`${this.urlPrefix}/GetNewest/`)}}b(m,"urlPrefix","/api/v1/admin/MonitorEFCore");const e=s=>(E("data-v-aedeeb8a"),s=s(),P(),s),q=e(()=>t("div",null,"数据连接打开",-1)),D=e(()=>t("span",null,"次",-1)),G=e(()=>t("div",null,"数据连接断开",-1)),R=e(()=>t("span",null,"次",-1)),V=e(()=>t("div",null,"连接失败",-1)),H=e(()=>t("span",null,"次",-1)),j=e(()=>t("div",null,"创建命令",-1)),z=e(()=>t("span",null,"次",-1)),U=e(()=>t("div",null,"执行命令",-1)),A=e(()=>t("span",null,"次",-1)),J=e(()=>t("div",null,"命令执行失败",-1)),K=e(()=>t("span",null,"次",-1)),L=e(()=>t("div",null,"创建事务",-1)),O=e(()=>t("span",null,"次",-1)),Q=e(()=>t("div",null,"提交事务",-1)),W=e(()=>t("span",null,"次",-1)),X=e(()=>t("div",null,"回滚事务",-1)),Y=e(()=>t("span",null,"次",-1)),Z=e(()=>t("div",null,"事务失败",-1)),tt=e(()=>t("span",null,"次",-1)),et={class:"text-danger"},nt=S({name:"monitor_efcore",__name:"Index",setup(s){const o=h(!1),n=h({}),v=h();let C=null;F(()=>{x(),C=setInterval(()=>{x()},15*1e3)}),T(()=>{clearInterval(C)});async function x(){o.value=!0;const _=await m.getEFCoreMonitorContext();if(o.value=!1,_.code!=200)return;n.value=_.data,o.value=!0;const r=await m.getTimeConsumingRanking();o.value=!1,r.code==200&&(v.value=r.data)}return(_,r)=>{const u=c("a-card-grid"),g=c("a-card"),p=c("a-table-column"),y=c("a-table");return B(),N(M,null,{default:a(()=>[l(g,{title:!1,bodyStyle:{display:"flex"}},{default:a(()=>[l(u,null,{default:a(()=>[q,t("h1",null,[d(i(n.value.openDbConnectionCount??0)+" ",1),D])]),_:1}),l(u,null,{default:a(()=>[G,t("h1",null,[d(i(n.value.closeDbConnectionCount??0)+" ",1),R])]),_:1}),l(u,null,{default:a(()=>[V,t("h1",null,[d(i(n.value.connectionFailedCount??0)+" ",1),H])]),_:1}),l(u,null,{default:a(()=>[j,t("h1",null,[d(i(n.value.createCommandCount??0)+" ",1),z])]),_:1}),l(u,null,{default:a(()=>[U,t("h1",null,[d(i(n.value.executeCommandCount??0)+" ",1),A])]),_:1})]),_:1}),l(g,{title:!1,bodyStyle:{display:"flex"},style:{"border-top":"0"}},{default:a(()=>[l(u,null,{default:a(()=>[J,t("h1",null,[d(i(n.value.commandFailedCount??0)+" ",1),K])]),_:1}),l(u,null,{default:a(()=>[L,t("h1",null,[d(i(n.value.createTransactionCount??0)+" ",1),O])]),_:1}),l(u,null,{default:a(()=>[Q,t("h1",null,[d(i(n.value.submitTransactionCount??0)+" ",1),W])]),_:1}),l(u,null,{default:a(()=>[X,t("h1",null,[d(i(n.value.rollBackCount??0)+" ",1),Y])]),_:1}),l(u,null,{default:a(()=>[Z,t("h1",null,[d(i(n.value.transactionFailedCount??0)+" ",1),tt])]),_:1})]),_:1}),l(y,{"data-source":v.value,size:"middle",pagination:!1},{default:a(()=>[l(p,{key:"sql",title:"Sql Script","data-index":"sql"}),l(p,{key:"elapsedMilliseconds",title:"耗时","data-index":"elapsedMilliseconds",width:100},{default:a(({record:k})=>[t("span",et,i(k.elapsedMilliseconds)+" 毫秒",1)]),_:1}),l(p,{key:"time",title:"执行时间","data-index":"time",width:200})]),_:1},8,["data-source"])]),_:1})}}}),ut=$(nt,[["__scopeId","data-v-aedeeb8a"]]);export{ut as default};
