var d=Object.defineProperty;var n=(i,t,r)=>t in i?d(i,t,{enumerable:!0,configurable:!0,writable:!0,value:r}):i[t]=r;var a=(i,t,r)=>(n(i,typeof t!="symbol"?t+"":t,r),r);import{H as o}from"./index-cV5RpzD5.js";class l{static findList(t,r,e={},s=[]){return o.post(`${this.urlPrefix}/findList`,{page:t,size:r,search:e,searchSort:s})}static getCode(t){return o.post(`${this.urlPrefix}/getCode`,t)}static download(t){return o.download(`${this.urlPrefix}/download`,t)}static downloadAll(t){return o.download(`${this.urlPrefix}/downloadAll`,t)}static createDataDictionary(){return o.download(`${this.urlPrefix}/createDataDictionary`,{})}static autoImprotProject(t){return o.post(`${this.urlPrefix}/AutoImprotProject`,t)}}a(l,"urlPrefix","/api/v1/admin/CodeGeneration");export{l as C};
