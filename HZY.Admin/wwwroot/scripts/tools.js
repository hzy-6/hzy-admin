/**
 * 工具类
 */
class Tools {
    //Vue.prototype 对象
    vueProtoType = null;

    constructor() {
        this.vuePrototype = top.Vue.prototype;
        this.vuePrototype.$ELEMENT = { size: 'small', zIndex: 99999999 }; //small
        Vue.prototype.$ELEMENT = this.vuePrototype.$ELEMENT; //small
    }

    /**
     * 配置信息
     * 
     */
    config() {
        return {
            tokenKey: "Authorization_HZY_ADMIN",
            guidEmpty: '00000000-0000-0000-0000-000000000000',
        };
    }

    isLoadingClose = false;
    loadingIndex = null;
    /**
     * 加载开始
     * 
     */
    loadingStart() {
        var value = 0.1;
        var time = setInterval(function() {
            if (this.isLoadingClose) {
                top.NProgress.set(1);
                return clearInterval(time);
            }
            value = value + 0.1;
            if (value >= 1) {
                top.NProgress.set(1);
                return clearInterval(time);
            }
            top.NProgress.set(value);
        }, 100);
    }

    /**
     * 加载结束
     * 
     */
    loadingStop() {
        this.isLoadingClose = true;
    }

    /**
     * 消息提示框
     * 
     * @param {消息正文} text 
     * @param {信息类型} type 
     */
    message(text, type = 'info') {
        let t = this;

        if (type === '成功') {
            t.vuePrototype.$message({
                message: text,
                type: 'success',
                duration: 5000,
                dangerouslyUseHTMLString: true,
            });
            return;
        }
        if (type === '错误') {
            t.vuePrototype.$message({
                message: text,
                type: 'error',
                duration: 5000,
                dangerouslyUseHTMLString: true,
            });
            return;
        }
        if (type === '警告') {
            t.vuePrototype.$message({
                message: text,
                type: 'warning',
                duration: 5000,
                dangerouslyUseHTMLString: true,
            });
            return;
        }
        t.vuePrototype.$message({
            message: text,
            duration: 5000,
            dangerouslyUseHTMLString: true,
        });
    }

    /**
     * 提示框
     * 
     * @param {消息正文} text 
     * @param {信息类型} type 
     * @param {确定回调} call 
     */
    alert(text, call, title) {
        this.vuePrototype.$alert(text, title, {
            confirmButtonText: '确定',
            callback: action => { call(action) }
        });
    }

    /**
     * 询问
     * 
     * @param {消息正文} text 
     * @param {确认回调} successCallBack 
     * @param {取消回调} cancelCallBack 
     * @param {标题} title 
     */
    confirm(text, successCallBack, cancelCallBack, title = '警告') {
        this.vuePrototype.$confirm(text, title, {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning',
            center: true
        }).then(() => {
            if (successCallBack) successCallBack();
        }).catch(() => {
            if (cancelCallBack) cancelCallBack();
        });
    }

    /**
     * 通知
     * 
     * @param {消息正文} text 
     * @param {信息类型} type 
     * @param {标题} title 
     */
    notice(text, type, title = "提示") {
        if (type === '成功') {
            this.vuePrototype.$notify({
                title: title,
                message: text,
                type: 'success'
            });
        } else if (type === '警告') {
            this.vuePrototype.$notify({
                title: title,
                message: text,
                type: 'warning'
            });
        } else if (type === '错误') {
            this.vuePrototype.$notify({
                title: title,
                message: text,
                type: 'error'
            });
        } else {
            this.vuePrototype.$notify({
                title: title,
                message: text,
                type: 'info'
            });
        }
    }

    /**
     * 建立一個可存取到該file的url  用于上传图片，，可通过该地址浏览图片
     * 
     * @param {*} file 
     */
    getObjectUrl(file) {
        let url = "";
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }

    /**
     * 将图片对象转换为 base64
     * 
     * @param {*} obj 
     * @param {*} callBack 
     */
    readFile(obj, callBack) {
        var file = obj.files[0];
        var resVal;
        //判断类型是不是图片
        if (!/image\/\w+/.test(file.type)) {
            alert("请确保文件为图像类型");
            return false;
        }
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function() {
            //alert(this.result); //就是base64
            resVal = this.result;
            if (callBack) callBack(resVal);
            //return resVal;
        }

    }

    /**
     * 
     * @param {*} name 
     */
    getCookie(name) {
        let reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        let arr = top.document.cookie.match(reg);
        if (arr)
            return unescape(arr[2]);
        else
            return null;
    }

    /**
     * 
     * @param {*} name 
     */
    delCookie(name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval = this.getCookie(name);
        if (cval != null)
            top.document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
    }

    /**
     * //这是有设定过期时间的使用示例：
     * //s20是代表20秒
     * //h是指小时，如12小时则是：h12
     * //d是天数，30天则：d30
     * 
     * @param {*} name 
     * @param {*} value 
     * @param {*} time 
     * @param {*} path 
     */
    setCookie(name, value, time = 'h12', path = '/') {
        if (!time) time = 'h12';
        var strsec = this.getSec(time);
        var exp = new Date();
        exp.setTime(exp.getTime() + strsec * 1);
        top.document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + (path ? (";path=" + path) : ";path=/");
    }

    /**
     * 
     * @param {*} str 
     */
    getSec(str) {
        var str1 = str.substring(1, str.length) * 1;
        var str2 = str.substring(0, 1);
        if (str2 == "s") {
            return str1 * 1000;
        } else if (str2 == "h") {
            return str1 * 60 * 60 * 1000;
        } else if (str2 == "d") {
            return str1 * 24 * 60 * 60 * 1000;
        }
    }

    /**
     * 保存 token
     * 
     * @param {*} token 
     */
    setAuthorization(token) {
        this.setCookie(tools.tokenKey, token);
    }

    /**
     * 获取 token
     */
    getAuthorization() {
        return this.getCookie(tools.tokenKey);
    }

    /**
     * 删除 token
     */
    delAuthorization() {
        this.delCookie(tools.tokenKey);
    }

    /**
     * 设置头部颜色
     * @param {*} theme 
     */
    setHeaderTheme(theme) {
        localStorage.setItem("hzyAdminUI-HeaderTheme", theme);
    }

    /**
     * 获取头部颜色
     */
    getHeaderTheme() {
        return localStorage.getItem("hzyAdminUI-HeaderTheme");
    }

    /**
     * 存储菜单颜色
     * @param {*} theme 
     */
    setMenuTheme(theme) {
        localStorage.setItem("hzyAdminUI-MenuTheme", theme);
    }

    /**
     * 获取菜单颜色 //light|dark //菜单主题颜色
     */
    getMenuTheme() {
        let theme = localStorage.getItem("hzyAdminUI-MenuTheme");
        return theme ? theme : "dark";
    }

    /**
     * 打开视图 这里只会打开已打开 和 在路由表中得
     * 
     * @param {*} key 
     */
    openView(key) {
        top.HZYADMINUI.openView(key);
    }

    /**
     * 添加一个新视图
     * 
     * @param {
     * obj = {
     *    key,
     *    title,
     *    url,
     *    close,
     *    active
     *   }
     * } obj 
     * 
     */
    addView(key, title, url, close = true, active = true) {
        top.HZYADMINUI.addView({
            key,
            title,
            url,
            close,
            active
        });
    }

    /**
     * 通过 Iframe 打开页面
     * 
     * @param {标题} title 
     * @param {地址} url 
     * @param {宽度} w 
     * @param {高度} h
     */
    pageOpen(title, url, end, w, h) {
        if (!title) {
            title = "无标题";
        }

        if (!url) {
            url = "https://gitee.com/hzy6";
        }

        if (!w) {
            w = 800;
        }

        if (!h) {
            h = 700;
        }

        var _htmlW = top.window.innerWidth;
        var _htmlH = top.window.innerHeight;
        var _width = _htmlW > w ? w : _htmlW;
        var _height = _htmlH > h ? h : _htmlH;

        this.getLayer().open({
            type: 2,
            anim: 2,
            title: title,
            area: [_width + 'px', _height + 'px'],
            fixed: false, //不固定
            maxmin: true,
            content: url,
            end: function() {
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

    /**
     * 获取 layer 对象
     * @returns 
     */
    getLayer() {
        return top.layer;
    }

};

window.tools = new Tools();