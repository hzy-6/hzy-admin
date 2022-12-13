import axios, { AxiosRequestConfig, AxiosResponse } from "axios";
import AppConsts from "../../utils/AppConsts";
import Tools from "./Tools";
import router from "@/core/router";
import ApiResult from "../typings/ApiResult";

/**
 * 网络请求客户端
 */
class Http {

    private static isLoading: boolean = true;

    /**
     * 初始化请求配置
     */
    static init(): void {

        //axios 基本配置
        axios.defaults.timeout = 100 * 1000;
        axios.defaults.baseURL = AppConsts.domainServerApi;

        //http request 拦截器
        axios.interceptors.request.use(
            (config: AxiosRequestConfig<any>) => {
                if (Http.isLoading) {
                    Tools.loadingStart();
                }

                let authorization = Tools.getAuthorization();
                if (authorization) {
                    config!.headers![AppConsts.authorizationKeyName] = authorization;
                }

                config!.headers!["X-Requested-With"] = "XMLHttpRequest";

                if (!config!.headers!["Content-Type"]) {
                    config!.headers!["Content-Type"] = "application/json; charset=UTF-8";
                }

                if (!config.data) return config;

                return config;
            },
            (error) => {
                console.log(error);
                return Promise.reject(error);
            }
        );

        //http response 拦截器
        axios.interceptors.response.use(
            (response: any) => {
                if (Http.isLoading) {
                    Tools.loadingStop();
                }

                const data = response.data;

                if (Object.prototype.hasOwnProperty.call(data, "code")) {
                    //     程序异常 = -2,
                    // 未授权 = -1,
                    // 失败 = 0,
                    // 成功 = 1,

                    if (data.code === -1) {
                        //接口授权码无效
                        Tools.message.warning(data.message + ",请重新登录授权!");
                        return router.push(AppConsts.loginPath);
                    }
                    if (data.code === -2) {
                        //服务端异常
                        Tools.message.error(data.message);
                    }
                    if (data.code === 0) {
                        //失败
                        Tools.message.error(data.message);
                    }
                }

                return response;
            },
            (error) => {
                if (Http.isLoading) {
                    Tools.loadingStop();
                }

                if (error.response) {
                    if (error.response.status === 401) {
                        Tools.notice.warning("未授权!");
                        router.replace(AppConsts.loginPath);
                        // window.location.reload();
                    }
                }

                if (error.message === 'Network Error') {
                    Tools.message.error('网络连接错误!');
                    router.replace(AppConsts.loginPath);
                }

                console.log(error);
                return Promise.reject(error.response.data);
            }
        );
    }

    /**
     * get 请求
     * @param url 地址
     * @param data 数据
     * @param loading 是否有全局加载转圈
     * @param config 其他配置信息
     * @returns Promise 对象
     */
    static async get(url: string, data = {}, loading: boolean = true, config: any = {}): Promise<ApiResult<any>> {
        Http.isLoading = loading;
        const result = await axios.get<ApiResult<any>>(url, {
            params: data,
            ...config
        });
        return result.data;
    }

    /**
     * 封装post请求
     * @param url
     * @param data
     * @param loading 是否有加载效果
     * @param config config信息
     * @returns {Promise}
     */
    static async post(url: string, data = {}, loading: boolean = true, config = {}): Promise<ApiResult<any>> {
        Http.isLoading = loading;
        const result = await axios.post<ApiResult<any>>(url, data, config);
        return result.data;
    }

    /**
     * 封装 post 请求 用于上传文件
     * @param url
     * @param data
     * @param loading 是否有加载效果
     * @param config config信息
     * @returns {Promise}
     */
    static async upload(url: string, data: any = {}, loading: boolean = true, config = {}): Promise<ApiResult<any>> {
        Http.isLoading = loading;
        if (!data) data = {};
        const result = await axios.post<ApiResult<any>>(url, data, {
            headers: { "Content-Type": "multipart/form-data" },
            ...config
        });
        return result.data;
    }

    /**
     * 封装patch请求
     * @param url
     * @param data
     * @param loading 是否有加载效果
     * @param config config信息
     * @returns {Promise}
     */
    static async patch(url: string, data = {}, loading: boolean = true, config = {}): Promise<ApiResult<any>> {
        Http.isLoading = loading;
        const result = await axios.patch<ApiResult<any>>(url, data, config);
        return result.data;
    }

    /**
     * 封装put请求
     * @param url
     * @param data
     * @param loading 是否有加载效果
     * @param config config信息
     * @returns {Promise}
     */
    static async put(url: string, data = {}, loading: boolean = true, config = {}): Promise<ApiResult<any>> {
        Http.isLoading = loading;
        const result = await axios.put<ApiResult<any>>(url, data, config);
        return result.data;
    }

    /**
     * 封装 post请求 用于下载文件
     * @param url 
     * @param data 
     * @param loading 
     * @param fileName 
     * @returns 
     */
    static async download(url: string, data = {}, loading: boolean = true, fileName: string | null = null): Promise<any> {
        Http.isLoading = loading;
        const result = await axios.post<AxiosResponse<any>>(url, data, { responseType: "blob" });

        var res = result.data;
        //如果没有文件名称 则使用当前时间
        if (!fileName) fileName = new Date().getTime().toString();
        //如果响应头里面有 filename 则使用响应头中的 filename
        var contentDisposition = result.headers["content-disposition"];
        if (contentDisposition && contentDisposition.indexOf("filename=") > -1) {
            let patt = new RegExp('filename=([^;]+\\.[^\\.;]+);*');
            let result = patt.exec(contentDisposition);
            fileName = decodeURI(result![1]);
        }
        console.log(result);
        var blob = new Blob([res.data], { type: res.data.type });
        let href = (window.URL || window.webkitURL).createObjectURL(blob);
        let a = document.createElement("a");
        a.style.display = "none";
        a.href = href;
        a.setAttribute("download", fileName);
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a); // 下载完成移除元素
        window.URL.revokeObjectURL(href); // 只要映射存在，Blob就不能进行垃圾回收，因此一旦不再需要引用，就必须小心撤销URL，释放掉blob对象。
    }

    /**
     * 封装 get请求 用于获取文件流
     * @param url 
     * @param data 
     * @param loading 
     * @returns 
     */
    static async getFileStream(url: string, data = {}, loading: boolean = true): Promise<ApiResult<any>> {

        const result = await Http.get(url, data, loading, { responseType: "blob" });

        return result.data;
    }


}

//初始化 请求对象
Http.init();

export default Http;