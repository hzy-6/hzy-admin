/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
var qs = Qs;

var hzyAdmin = {
    layer: null,
    vuePro: null,
    guidEmpty: '00000000-0000-0000-0000-000000000000',
    //获取 token 键名
    getTokenKey: function () {
        //return 'Authorization_' + window.location.hostname + '_' + window.location.port;
        return 'Authorization_HZY_ADMIN';
    },
    //axios:null,
    init: function () {
        this.layer = top.layer;
        this.vuePro = top.Vue.prototype;
        //this.axios = top.axios;
        var _this = this;

        //
        axios.defaults.timeout = 100 * 1000;
        axios.defaults.baseURL = '';

        //http request 拦截器
        axios.interceptors.request.use(config => {
            config.headers['X-Requested-With'] = 'XMLHttpRequest';
            //config.headers['Authorization'] = tools.getCookie('Authorization');
            var contentType = config.headers['Content-Type'];
            if (!contentType) {
                config.headers['Content-Type'] = 'application/json; charset=UTF-8';
            }

            if (!config.data) return config;

            if (config.data.isUpload) {
                config.headers['Content-Type'] = 'multipart/form-data; charset=UTF-8';
            }

            return config;
        }, error => {
            console.log(error);
            return Promise.reject(error);
        });

        //http response 拦截器
        axios.interceptors.response.use(response => {
            _this.loading.stop();
            var data = response.data;
            console.log(data);

            if (!data) return;

            if (data.hasOwnProperty('code')) {
                //     程序异常 = -2,
                // 未授权 = -1,
                // 失败 = 0,
                // 成功 = 1,

                if (data.code === -1) { //接口授权码无效
                    if (confirm(data.message + ',请重新登录授权!')) window.location = "Admin/Login/Out";
                } else if (data.code === -2) { //服务端异常
                    _this.alert(data.message, '错误');
                } else if (data.code === 0) { //失败
                    _this.alert(data.message, '警告');
                }
            }

            return response;
        }, error => {
            _this.loading.stop();
            console.log(error);
            if (error.response.status === 401) {
                _this.alert(data.message, '请重新登录授权!');
                window.location = "Admin/Login/Out";
            } else {
                return Promise.reject(error)
            }
        });
    },
    //加载标签页面
    toView: function (id, title, href, active = true, isClose = true) {
        top.hzyBootStrapTabs.addTab(id, title, href, true, isClose);
    },
    loading: {
        index: null,
        start: function () {
            this.index = hzyAdmin.vuePro.$loading({
                fullscreen: true,
                background: 'rgba(255,255,255,0)'
            });
        },
        stop: function () {
            if (this.index) {
                var _this = this;
                setTimeout(function () {
                    _this.index.close();
                }, 100);
            }
        }
    },
    //睡眠函数
    sleep: function (numberMillis) {
        var now = new Date();
        var exitTime = now.getTime() + numberMillis;
        while (true) {
            now = new Date();
            if (now.getTime() > exitTime) {
                return;
            }
        }
    },
    alert: function (text, type = 'info', title = '消息提示') {
        console.log(type);
        var _this = this;

        if (type === '成功') {
            _this.vuePro.$message({
                message: text,
                type: 'success',
                duration: 5000,
                dangerouslyUseHTMLString: true,
            });
            return;
        }
        if (type === '错误') {
            _this.vuePro.$message({
                message: text,
                type: 'error',
                duration: 5000,
                dangerouslyUseHTMLString: true,
            });
            return;
        }
        if (type === '警告') {
            _this.vuePro.$message({
                message: text,
                type: 'warning',
                duration: 5000,
                dangerouslyUseHTMLString: true,
            });
            return;
        }
        _this.vuePro.$message({
            message: text,
            duration: 5000,
            dangerouslyUseHTMLString: true,
        });
    },
    // http get 请求
    httpGet: function (url, data = {}, success, loading = true, config = {}) {
        var _this = this;
        if (loading) _this.loading.start();

        if (data) url += `?${qs.stringify(data)}`;

        var promise = new Promise((resolve, reject) => {
            axios.get(url, config)
                .then(response => {
                    resolve(response);
                })
                .catch(err => {
                    reject(err)
                })
        });

        promise.then(res => {
            if (loading) _this.loading.stop();
            if (success) success(res.data);
        });

        return promise;
    },
    // http post 请求
    httpPost: function (url, data = {}, success, loading = true, config = {}) {
        var _this = this;
        if (loading) _this.loading.start();

        var promise = new Promise((resolve, reject) => {
            axios.post(url, data, config)
                .then(response => {
                    if (response !== undefined) {
                        resolve(response);
                    }
                }, err => {
                    reject(err)
                })
        });

        promise.then(res => {
            if (loading) _this.loading.stop();
            if (success) success(res.data);
        });

        return promise;
    },
    // http delete 请求
    httpDelete: function (url, data = {}, success, loading = true, config = {}) {
        var _this = this;
        if (loading) _this.loading.start();

        var promise = new Promise((resolve, reject) => {
            axios.delete(url, data, config)
                .then(response => {
                    if (response !== undefined) {
                        resolve(response);
                    }
                }, err => {
                    reject(err)
                })
        });

        promise.then(res => {
            if (loading) _this.loading.stop();
            if (success) success(res.data);
        });

        return promise;
    },
    // 上传文件 请求
    httpUpload: function (url, data = {}, success, loading = true, config = {}) {
        var _this = this;
        if (loading) _this.loading.start();

        data.isUpload = true;

        var promise = new Promise((resolve, reject) => {
            axios.post(url, data, config)
                .then(response => {
                    if (response !== undefined) {
                        resolve(response);
                    }
                }, err => {
                    reject(err)
                })
        });

        promise.then(res => {
            if (loading) _this.loading.stop();
            if (success) success(res.data);
        });

        return promise;
    },
    //下载文件请求
    httpDownload: function (url, data = {}, loading = true) {
        var _this = this;
        if (loading) _this.loading.start();

        hzyAdmin.httpPost(url, data, null, loading, {
            // responseType: 'stream',
            responseType: 'blob',
            // responseType: 'arraybuffer',
        }).then(res => {
            console.log('res', res);
            if (loading) _this.loading.stop();
            var resData = res.data;

            var headers = res.headers;
            //"attachment; filename=6a9c13bc-e214-44e4-8456-dbca9fcd2367.xls;filename*=UTF-8''6a9c13bc-e214-44e4-8456-dbca9fcd2367.xls"
            var contentDisposition = headers['content-disposition'];
            var contentType = headers['content-type'];
            var attachmentInfoArrary = contentDisposition ? contentDisposition.split(';') : [];
            var fileName = '';
            if (attachmentInfoArrary.length > 1) {
                fileName = attachmentInfoArrary[1].split('=')[1];
            }
            var blob = new Blob([resData], {type: contentType});

            if (window.navigator && window.navigator.msSaveOrOpenBlob) { // IE
                window.navigator.msSaveOrOpenBlob(blob, fileName);
            } else {
                var url = (window.URL || window.webkitURL).createObjectURL(blob);
                // window.open(url, "_blank"); //下载
                // window.URL.revokeObjectURL(url) // 只要映射存在，Blob就不能进行垃圾回收，因此一旦不再需要引用，就必须小心撤销URL，释放掉blob对象。

                var a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                a.setAttribute('download', fileName);
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a); // 下载完成移除元素
                // window.location.href = url
                window.URL.revokeObjectURL(url); // 只要映射存在，Blob就不能进行垃圾回收，因此一旦不再需要引用，就必须小心撤销URL，释放掉blob对象。
            }
        });
    },
    //根据键取地址栏中的值
    getQueryString: function (key) {
        var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return r[2];
        return "";
    },
    //建立一個可存取到該file的url  用于上传图片，，可通过该地址浏览图片
    getObjectUrl: function (file) {
        var url = "";
        if (window.createObjectURL !== undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL !== undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL !== undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    },
    //将图片对象转换为 base64
    readFile: function (obj, callBack) {
        var file = obj.files[0];
        var resVal;
        //判断类型是不是图片  
        if (!/image\/\w+/.test(file.type)) {
            alert("请确保文件为图像类型");
            return false;
        }
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function (e) {
            //alert(this.result); //就是base64  
            resVal = this.result;
            if (callBack) callBack(resVal);
            //return resVal;
        }

    },
    setSession: function (key, value) {
        window.top.localStorage.setItem(key, JSON.stringify(value));
    },
    getSession: function (key) {
        return JSON.parse(window.top.localStorage.getItem(key));
    },
    getCookie: function (name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = top.document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    },
    delCookie: function (name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval = this.getCookie(name);
        if (cval != null)
            top.document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
    },
    //这是有设定过期时间的使用示例：
    //s20是代表20秒
    //h是指小时，如12小时则是：h12
    //d是天数，30天则：d30
    setCookie: function (name, value, time, path) {
        if (!time) time = 'h12';
        var strsec = hzyAdmin.getsec(time);
        var exp = new Date();
        exp.setTime(exp.getTime() + strsec * 1);
        //";domain=" + host +
        //ie 无法 设置 cookie 问题:IE11 cookie可以设置 domain 但是不能接受localhost 或者 顶级域名 类如http://myservername/，同时也不接受带下划线的子域名（_talck.com）
        top.document.cookie = name + "=" + escape(value) + (path ? (";path=" + path) : ";path=/") + ";expires=" + exp.toGMTString();
    },
    getsec: function (str) {
        var str1 = str.substring(1, str.length) * 1;
        var str2 = str.substring(0, 1);
        if (str2 === "s") {
            return str1 * 1000;
        } else if (str2 === "h") {
            return str1 * 60 * 60 * 1000;
        } else if (str2 === "d") {
            return str1 * 24 * 60 * 60 * 1000;
        }
    },
    openPage: function (title, href, end = null, w = 800, h = 700) {
        var _htmlW = top.$("html").width();
        var _htmlH = top.$("html").height();
        var _width = _htmlW > w ? w : _htmlW;
        var _height = _htmlH > h ? h : _htmlH;
        hzyAdmin.layer.open({
            type: 2,
            anim: 2,
            title: title,
            area: [_width + 'px', _height + 'px'],
            fixed: false, //不固定
            maxmin: true,
            content: href,
            end: function () {
                if (end) {
                    var findBack = window.localStorage.getItem('findBack');
                    if (!!findBack) {
                        end(JSON.parse(findBack));
                        window.localStorage.removeItem('findBack');
                    } else {
                        end(null);
                    }
                }
            }
        });
    }

};

Vue.prototype.$ELEMENT = {size: 'small', zIndex: 99999999};

hzyAdmin.init();
