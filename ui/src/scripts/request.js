import axios from "axios";
import tools from "@/scripts/tools";
import appConsts from '@/scripts/app-consts';
import router from '@/router'

//axios 基本配置
axios.defaults.timeout = 100 * 1000;
axios.defaults.baseURL = appConsts.domainName + "/api";
let isLoading = true;

//http request 拦截器
axios.interceptors.request.use(
    (config) => {
        if (isLoading) {
            tools.loadingStart();
        }

        let authorization = tools.getAuthorization();
        if (authorization) {
            config.headers[appConsts.authorizationKeyName] = authorization;
        }
        config.headers["X-Requested-With"] = "XMLHttpRequest";
        config.headers["Content-Type"] = "application/json; charset=UTF-8";

        if (!config.data) return config;

        if (config.data.isUpload) config.headers["Content-Type"] = "multipart/form-data";

        return config;
    },
    (error) => {
        console.log(error);
        return Promise.reject(error);
    }
);

//http response 拦截器
axios.interceptors.response.use(
    (response) => {
        if (isLoading) {
            tools.loadingStop();
        }

        const data = response.data;

        if (Object.prototype.hasOwnProperty.call(data, "code")) {
            //     程序异常 = -2,
            // 未授权 = -1,
            // 失败 = 0,
            // 成功 = 1,

            if (data.code === -1) {
                //接口授权码无效
                tools.message(data.message + ",请重新登录授权!", "警告");
                return router.push("/login");
            }
            if (data.code === -2) {
                //服务端异常
                tools.message(data.message, "错误");
            }
            if (data.code === 0) {
                //失败
                tools.message(data.message, "警告");
            }
        }

        return response;
    },
    (error) => {
        if (isLoading) {
            tools.loadingStop();
        }

        if (error.response) {

            if (error.response.status === 401) {
                tools.notice("未授权!", "错误");
                router.replace("/login");
                // window.location.reload();
            }
        }

        if (error.message === 'Network Error') {
            tools.message('网络连接错误!', "错误");
            router.replace("/login");
        }

        console.log(error);

        return Promise.reject(error.response.data);

    }
);

/**
 * 封装get方法
 * @param url
 * @param data
 * @param loading 是否有加载效果
 * @param headers 头部信息
 * @returns {Promise}
 */
export function get(url, data = {}, loading = true, config = {}) {
    isLoading = loading;
    config["params"] = data;
    return new Promise((resolve, reject) => {
        axios
            .get(url, config)
            .then((response) => {
                if (response) resolve(response.data);
            })
            .catch((err) => {
                reject(err);
            });
    });
}

/**
 * 封装post请求
 * @param url
 * @param data
 * @param loading 是否有加载效果
 * @param config config信息
 * @returns {Promise}
 */
export function post(url, data = {}, loading = true, config = {}) {
    isLoading = loading;
    return new Promise((resolve, reject) => {
        axios.post(url, data, config).then(
            (response) => {
                if (response) resolve(response.data);
            },
            (err) => {
                reject(err);
            }
        );
    });
}

/**
 * 封装 post 请求 用于上传文件
 * @param url
 * @param data
 * @param loading 是否有加载效果
 * @param config config信息
 * @returns {Promise}
 */
export function upload(url, data = {}, loading = true, config = {}) {
    isLoading = loading;
    if (!data) data = {};
    data.isUpload = true;
    return new Promise((resolve, reject) => {
        axios.post(url, data, config).then(
            (response) => {
                if (response) resolve(response.data);
            },
            (err) => {
                reject(err);
            }
        );
    });
}

/**
 * 封装patch请求
 * @param url
 * @param data
 * @param loading 是否有加载效果
 * @param config config信息
 * @returns {Promise}
 */
export function patch(url, data = {}, loading = true, config = {}) {
    isLoading = loading;
    return new Promise((resolve, reject) => {
        axios.patch(url, data, config).then(
            (response) => {
                if (response) resolve(response.data);
            },
            (err) => {
                reject(err);
            }
        );
    });
}

/**
 * 封装put请求
 * @param url
 * @param data
 * @param loading 是否有加载效果
 * @param config config信息
 * @returns {Promise}
 */
export function put(url, data = {}, loading = true, config = {}) {
    isLoading = loading;
    return new Promise((resolve, reject) => {
        axios.put(url, data, config).then(
            (response) => {
                if (response) resolve(response.data);
            },
            (err) => {
                reject(err);
            }
        );
    });
}

/**
 * 封装 post请求 用于下载文件
 * 
 * @param {*} url 
 * @param {*} data 
 * @param {是否有加载效果} loading 
 * @returns 
 */
export function download(url, data = {}, loading = true, fileName) {
    isLoading = loading;
    return new Promise((resolve, reject) => {
        axios.post(url, data, { responseType: "blob" }).then(
            (response) => {
                var res = response.data;
                //如果没有文件名称 则使用当前时间
                if (!fileName) fileName = new Date().getTime();
                //如果响应头里面有 filename 则使用响应头中的 filename
                var contentDisposition = response.headers["content-disposition"];
                if (contentDisposition && contentDisposition.indexOf("filename=") > -1) {
                    let patt = new RegExp('filename=([^;]+\\.[^\\.;]+);*');
                    let result = patt.exec(contentDisposition);
                    fileName = decodeURI(result[1]);
                }
                console.log(response);
                var blob = new Blob([res], { type: res.type });
                if (window.navigator && window.navigator.msSaveOrOpenBlob) {
                    // IE
                    window.navigator.msSaveOrOpenBlob(blob, fileName);
                } else {
                    let url = (window.URL || window.webkitURL).createObjectURL(blob);
                    // window.open(url, "_blank"); //下载
                    // window.URL.revokeObjectURL(url) // 只要映射存在，Blob就不能进行垃圾回收，因此一旦不再需要引用，就必须小心撤销URL，释放掉blob对象。

                    let a = document.createElement("a");
                    a.style.display = "none";
                    a.href = url;
                    a.setAttribute("download", fileName);
                    document.body.appendChild(a);
                    a.click();
                    document.body.removeChild(a); // 下载完成移除元素
                    // window.location.href = url
                    window.URL.revokeObjectURL(url); // 只要映射存在，Blob就不能进行垃圾回收，因此一旦不再需要引用，就必须小心撤销URL，释放掉blob对象。
                }

                resolve(res);


            },
            (err) => {
                reject(err);
            }
        );
    });

    // return new Promise((resolve, reject) => {
    //     post(url, data, loading, { responseType: "blob" }).then(
    //         (res) => {

    //         },
    //         (err) => {
    //             reject(err);
    //         }
    //     );
    // });
}

/**
 * 封装 get请求 用于获取文件流
 *
 * @param url
 * @param data
 * @param loading 是否有加载效果
 * @returns {Promise}
 */
export function getFileStream(url, data = {}, loading = true) {
    return new Promise((resolve, reject) => {
        get(url, data, loading, { responseType: "blob" }).then(
            (res) => {
                // var blob = new Blob([res], { type: res.type });

                resolve(res);
            },
            (err) => {
                reject(err);
            }
        );
    });
}
