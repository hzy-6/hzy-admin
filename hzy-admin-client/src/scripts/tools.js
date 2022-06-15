import { message, Modal, notification } from 'ant-design-vue';
import NProgress from 'nprogress';
import appConsts from './app-consts';

let tools = {
    nprogressState: false,
    /**
     * 加载效果开始
     */
    loadingStart() {
        var value = 0.1;
        tools.nprogressState = false;
        var loadingTime = setInterval(function () {
            if (tools.nprogressState) {
                NProgress.set(1);
                return clearInterval(loadingTime);
            }
            if (value > 0.8) {
                return;
            }
            value = value + 0.2;
            NProgress.set(value);
        }, 50);
    },
    /**
     * 加载效果结束
     */
    loadingStop() {
        tools.nprogressState = true;
    },
    //消息提醒
    message(text, type = '') {
        if (type === '成功') {
            message.success(text);
        } else if (type === '警告') {
            message.warning(text);
        } else if (type === '错误') {
            message.error(text);
        } else {
            message.info(text);
        }
    },
    //alert
    alert(text, type, call) {
        if (type === '成功') {
            Modal.success({
                title: "提醒",
                content: text,
                onOk() {
                    if (call) call();
                }
            });
        } else if (type === '警告') {
            Modal.warning({
                title: "提醒",
                content: text,
                onOk() {
                    if (call) call();
                }
            });
        } else if (type === '错误') {
            Modal.error({
                title: "提醒",
                content: text,
                onOk() {
                    if (call) call();
                }
            });
        } else {
            Modal.info({
                title: "提醒",
                content: text,
                onOk() {
                    console.log('call', call);
                    if (call) call();
                }
            });
        }
    },
    //询问
    confirm(text, successCallBack, cancelCallBack, title = '警告') {
        Modal.confirm({
            title: title,
            content: text,
            okText: '确认',
            cancelText: '取消',
            onOk() {
                if (successCallBack) successCallBack();
            },
            onCancel() {
                if (cancelCallBack) cancelCallBack();
            },
        });
    },
    //通知
    notice(text, type, title = "提示") {
        if (type === '成功') {
            notification.success({
                message: title,
                description: text
            });
        } else if (type === '警告') {
            notification.warning({
                message: title,
                description: text
            });
        } else if (type === '错误') {
            notification.error({
                message: title,
                description: text
            });
        } else {
            notification.info({
                message: title,
                description: text
            });
        }
    },
    //建立一個可存取到該file的url  用于上传图片，，可通过该地址浏览图片
    getObjectUrl: function (file) {
        var url = "";
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
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
        reader.onload = function () {
            //alert(this.result); //就是base64
            resVal = this.result;
            if (callBack) callBack(resVal);
            //return resVal;
        }

    },
    getCookie: function (name) {
        let reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        let arr = top.document.cookie.match(reg);
        if (arr)
            return unescape(arr[2]);
        else
            return null;
    },
    delCookie: function (name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval = tools.getCookie(name);
        if (cval != null)
            top.document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
    },
    //这是有设定过期时间的使用示例：
    //s20是代表20秒
    //h是指小时，如12小时则是：h12
    //d是天数，30天则：d30
    setCookie: function (name, value, time = 'h12', path = '/') {
        if (!time) time = 'h12';
        var strsec = tools.getSec(time);
        var exp = new Date();
        exp.setTime(exp.getTime() + strsec * 1);
        top.document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString() + (path ? (";path=" + path) : ";path=/");
    },
    getSec: function (str) {
        var str1 = str.substring(1, str.length) * 1;
        var str2 = str.substring(0, 1);
        if (str2 == "s") {
            return str1 * 1000;
        } else if (str2 == "h") {
            return str1 * 60 * 60 * 1000;
        } else if (str2 == "d") {
            return str1 * 24 * 60 * 60 * 1000;
        }
    },
    /**
     * @param {Object} json
     * @param {Object} type： 默认不传 ==>全部小写;传1 ==>全部大写;传2 ==>首字母大写
     * 将json的key值进行大小写转换
     */
    jsonKeysToCase(json, type) {
        if (typeof json == 'object') {
            var tempJson = JSON.parse(JSON.stringify(json));
            toCase(tempJson);
            return tempJson;
        } else {
            return json;
        }

        function toCase(json) {
            if (typeof json == 'object') {
                if (Array.isArray(json)) {
                    json.forEach(function (item) {
                        toCase(item);
                    })
                } else {
                    for (var key in json) {
                        var item = json[key];
                        if (typeof item == 'object') {
                            toCase(item);
                        }
                        delete (json[key]);
                        switch (type) {
                            case 1:
                                //key值全部大写
                                json[key.toLocaleUpperCase()] = item;
                                break;
                            case 2:
                                //key值首字母大写，其余小写
                                json[key.substring(0, 1).toLocaleUpperCase() + key.substring(1).toLocaleLowerCase()] = item;
                                break;
                            default:
                                //默认key值全部小写
                                json[key.toLocaleLowerCase()] = item;
                                break;
                        }
                    }
                }
            }
        }
    },
    //保存 token
    setAuthorization(token) {
        this.setCookie(appConsts.tokenKey, token);
    },
    //获取 token
    getAuthorization() {
        return this.getCookie(appConsts.tokenKey);
    },
    //删除 token
    delAuthorization() {
        this.delCookie(appConsts.tokenKey);
    },
    //清理垃圾信息
    clearCache(call) {
        localStorage.removeItem(appConsts.appPrefix + '-HeaderTheme');
        localStorage.removeItem(appConsts.appPrefix + '-MenuTheme');
        localStorage.removeItem(appConsts.appPrefix + '-OneLevelMenuMode');
        // localStorage.removeItem(appConsts.appPrefix + '-OpenMenuKeys');
        localStorage.removeItem(appConsts.appPrefix + '-MenuCollapsed');
        if (call) call();
    },
    //设置头部颜色
    setHeaderTheme(theme) {
        localStorage.setItem(appConsts.appPrefix + "-HeaderTheme", theme);
    },
    //获取头部颜色
    getHeaderTheme() {
        return localStorage.getItem(appConsts.appPrefix + "-HeaderTheme");
    },
    //存储菜单颜色
    setMenuTheme(theme) {
        localStorage.setItem(appConsts.appPrefix + "-MenuTheme", theme);
    },
    //获取菜单颜色 //light|dark //菜单主题颜色
    getMenuTheme() {
        let theme = localStorage.getItem(appConsts.appPrefix + "-MenuTheme");
        return theme ? theme : "dark";
    },
    //设置 oneLevelMenuMode
    setOneLevelMenuMode(topNav) {
        localStorage.setItem(appConsts.appPrefix + "-OneLevelMenuMode", topNav);
    },
    //获取 oneLevelMenuMode
    getOneLevelMenuMode() {
        let value = localStorage.getItem(appConsts.appPrefix + "-OneLevelMenuMode");
        return value ? (isNaN(parseInt(value)) ? 2 : parseInt(value)) : 2;
    },
    //获取菜单收展状态
    getMenuCollapsed() {
        let value = localStorage.getItem(appConsts.appPrefix + "-MenuCollapsed");
        return value == "1" ? true : false;
    },
    //设置菜单收展状态
    setMenuCollapsed(collapsed) {
        localStorage.setItem(appConsts.appPrefix + "-MenuCollapsed", collapsed ? "1" : "0");
    }
};

export default tools;