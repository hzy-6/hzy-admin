import { message as AntdvMessage, Modal as AntdvModal, notification as AntdvMotification } from 'ant-design-vue';
import NProgress from 'nprogress';
import { useCookies } from '@vueuse/integrations/useCookies'
import AppConsts from '../../utils/AppConsts';

/**
 * 程序工具类
 * 
 */
class Tools {

    static nprogressState: boolean;

    /**
     * 加载效果开始
     */
    static loadingStart(): void {
        let value = 0.1;
        const time: any = setInterval(() => {
            if (this.nprogressState) {
                NProgress.set(1);
                return clearInterval(time);
            }
            value = value + 0.1;
            if (value >= 1) {
                NProgress.set(1);
                return clearInterval(time);
            }
            NProgress.set(value);
        }, 50);
    }

    /**
     * 加载效果结束
     */
    static loadingStop(): void {
        this.nprogressState = true;
    }

    /**
     * 消息提醒
     */
    static message = {
        /**
         * success
         * @param text 消息内容
         * @returns 
         */
        success: (text: string) => AntdvMessage.success(text),

        /**
         * warning
         * @param text 消息内容
         * @returns 
         */
        warning: (text: string) => AntdvMessage.warning(text),

        /**
         * error
         * @param text 消息内容
         * @returns 
         */
        error: (text: string) => AntdvMessage.error(text),

        /**
         * info
         * @param text 消息内容
         * @returns 
         */
        info: (text: string) => AntdvMessage.info(text),
    }

    /**
     * alert
     */
    static alert = {
        /**
         * 
         * @param text 消息内容
         * @param onOk 确定回调
         * @returns 
         */
        success: (text: string, onOk: () => void) =>
            AntdvModal.success({ title: "Notice", content: text, onOk() { onOk?.() } }),

        /**
         * 
         * @param text 消息内容
         * @param onOk 确定回调
         * @returns 
         */
        warning: (text: string, onOk: () => void) =>
            AntdvModal.warning({ title: "Notice", content: text, onOk() { onOk?.() } }),

        /**
        * 
        * @param text 消息内容
        * @param onOk 确定回调
        * @returns 
        */
        error: (text: string, onOk: () => void) =>
            AntdvModal.error({ title: "Notice", content: text, onOk() { onOk?.() } }),

        /**
         * 
         * @param text 消息内容
         * @param onOk 确定回调
         * @returns 
         */
        info: (text: string, onOk: () => void) =>
            AntdvModal.info({ title: "Notice", content: text, onOk() { onOk?.() } }),
    }

    /**
     * 询问
     * 
     * @param text 
     * @param successCallBack 
     * @param cancelCallBack 
     * @param title 
     */
    static confirm(text: string, successCallBack?: () => void, cancelCallBack?: () => void, title = '警告'): void {
        AntdvModal.confirm({
            title: title,
            content: text,
            okText: '确认',
            cancelText: '取消',
            onOk() {
                successCallBack?.();
            },
            onCancel() {
                cancelCallBack?.();
            },
        });
    }

    static notice = {
        /**
         * success
         * @param text 消息内容
         * @param title 标题
         * @returns 
         */
        success: (text: string, title: string = "提示") =>
            AntdvMotification.success({ message: title, description: text }),

        /**
         * warning
         * @param text 消息内容
         * @param title 标题
         * @returns 
         */
        warning: (text: string, title: string = "提示") =>
            AntdvMotification.warning({ message: title, description: text }),

        /**
         * error
         * @param text 消息内容
         * @param title 标题
         * @returns 
         */
        error: (text: string, title: string = "提示") =>
            AntdvMotification.error({ message: title, description: text }),

        /**
         * info
         * @param text 消息内容
         * @param title 标题
         * @returns 
         */
        info: (text: string, title: string = "提示") =>
            AntdvMotification.info({ message: title, description: text }),
    }

    /**
     * 建立一個可存取到該file的url  用于上传图片，，可通过该地址浏览图片
     * 
     * @param file 
     * @returns 
     */
    static getFileUrl(file: File): string {
        let url = "";
        if (window.URL.createObjectURL != undefined) { // basic
            url = window.URL.createObjectURL(file);
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
     * @param obj 
     * @param callBack 
     * @returns 
     */
    static readFile(obj: File[], callBack: (resValue: string | ArrayBuffer | null) => void): void {
        const file = obj[0];
        let resVal;
        //判断类型是不是图片
        if (!/ image\/\w+/.test(file.type)) {
            alert("请确保文件为图像类型");
            return;
        }
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function () {
            //alert(this.result); //就是base64
            resVal = this.result;
            callBack?.(resVal);
            //return resVal;
        }

    }

    /**
     * 存储授权码
     * @param tokenValue 
     */
    static setAuthorization(tokenValue: string): void {
        const cookies = useCookies();
        cookies.set(AppConsts.tokenKey, tokenValue, {
            path: "/"
        });
    }

    /**
     * 获取授权码
     * @returns 
     */
    static getAuthorization(): string {
        const cookies = useCookies();
        return cookies.get<string>(AppConsts.tokenKey);
    }

    /**
     * 移除授权码
     * @returns 
     */
    static removeAuthorization(): boolean {
        const cookies = useCookies();
        cookies.remove(AppConsts.tokenKey);
        return true;
    }

    /**
     * 检查页面地址白名单
     * @param fullPath 
     * @returns 
     */
    static checkPageWhiteList(fullPath: string): boolean {
        return AppConsts.pageWhiteList.indexOf(fullPath) > -1;
    }

    /**
     * 生成树形
     * @param tree 
     * @param pId 
     * @returns 
     */
    static genTreeData(tree: any[], pId: string | null = null) {
        let resultTree: any = [];
        let allkeys: string[] = [];
        tree.forEach((item) => {
            if (item.parentId == pId) {
                let children = Tools.genTreeData(tree, item.id);
                if (children && children.length > 0) {
                    item.children = children;
                } else {
                    item.children = null;
                }
                resultTree.push(item);
            }
            allkeys.push(item.id);
        })
        return resultTree
    }

    /**
     * 获取 uuid guid
     */
    // static newUUID(): string {
    //     return uuid();
    // }

    /**
     * 拷贝数据
     */
    static copyData(oldData: any, newData: any) {
        for (var item in newData) {
            oldData[item] = newData[item];
        }
        return oldData;
    }

}

export default Tools;