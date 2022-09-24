import { Action, ElMessage, ElMessageBox, ElNotification } from 'element-plus';
import NProgress from 'nprogress';
import { useCookies } from '@vueuse/integrations/useCookies'
import AppConsts from './AppConsts';

/**
 * 消息类型
 */
export enum EMessageType {
    成功,
    警告,
    错误
}

/**
 * 工具类
 */
class Tools {

    /**
    * Guid Empty String
    */
    guidEmpty: string = '00000000-0000-0000-0000-000000000000'

    nprogressState: boolean;

    constructor() {
        this.nprogressState = false;
    }

    private static instance: Tools | null = null;
    public static getInstance(): Tools {
        this.instance = this.instance || new Tools();
        return this.instance;
    }

    /**
     * 加载效果开始
     */
    loadingStart(): void {
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
    loadingStop(): void {
        this.nprogressState = true;
    }

    /**
     * 消息提醒
     * @param text 
     * @param type 
     */
    message(text: string, type: EMessageType | null = null): void {
        switch (type) {
            case EMessageType.成功:
                ElMessage({
                    message: text,
                    type: 'success',
                });
                break;
            case EMessageType.警告:
                ElMessage({
                    message: text,
                    type: 'warning',
                });
                break;
            case EMessageType.错误:
                ElMessage({
                    message: text,
                    type: 'error',
                });
                break;
            default:
                ElMessage({
                    message: text,
                    type: 'info',
                });
                break;
        }
    }

    /**
     * alert
     * 
     * @param text 消息内容
     * @param type 消息类型
     * @param call 确定回调
     */
    alert(text: string, type: EMessageType | null = null, call?: () => void): void {
        switch (type) {
            case EMessageType.成功:
                ElMessageBox.alert(text, '提醒', {
                    type: "success",
                    confirmButtonText: '确定',
                    callback: (action: Action) => {
                        if (call) call();
                    },
                });
                break;
            case EMessageType.警告:
                ElMessageBox.alert(text, '提醒', {
                    type: "warning",
                    confirmButtonText: '确定',
                    callback: (action: Action) => {
                        if (call) call();
                    },
                });
                break;
            case EMessageType.错误:
                ElMessageBox.alert(text, '提醒', {
                    type: "error",
                    confirmButtonText: '确定',
                    callback: (action: Action) => {
                        if (call) call();
                    },
                });
                break;
            default:
                ElMessageBox.alert(text, '提醒', {
                    type: "info",
                    confirmButtonText: '确定',
                    callback: (action: Action) => {
                        if (call) call();
                    },
                });
                break;
        }
    }

    /**
     * 询问
     * 
     * @param text 
     * @param successCallBack 
     * @param cancelCallBack 
     * @param title 
     */
    confirm(text: string, successCallBack: () => void, cancelCallBack?: (() => void), title = '警告'): void {
        ElMessageBox.confirm(
            text,
            title, {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning',
        }
        ).then(() => {
            if (successCallBack) successCallBack();
        }).catch(() => {
            if (cancelCallBack) cancelCallBack()
        });
    }

    /**
     * 通知
     * 
     * @param text 
     * @param type 
     * @param title 
     */
    notice(text: string, type: EMessageType | null = null, title = "通知"): void {
        switch (type) {
            case EMessageType.成功:
                ElNotification({
                    title: title,
                    message: text,
                    type: 'success',
                });
                break;
            case EMessageType.警告:
                ElNotification({
                    title: title,
                    message: text,
                    type: 'warning',
                });
                break;
            case EMessageType.错误:
                ElNotification({
                    title: title,
                    message: text,
                    type: 'error',
                });
                break;
            default:
                ElNotification({
                    title: title,
                    message: text,
                    type: 'info',
                });
                break;
        }
    }

    /**
     * 建立一個可存取到該file的url  用于上传图片，，可通过该地址浏览图片
     * 
     * @param file 
     * @returns 
     */
    getFileUrl(file: File): string {
        let url = "";
        if (window.URL.createObjectURL) { // basic
            url = window.URL.createObjectURL(file);
        } else if (window.URL) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL) { // webkit or chrome
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
    readFile(obj: File[], callBack: (resValue: string | ArrayBuffer | null) => void): void {
        const file = obj[0];
        //判断类型是不是图片
        if (!/image\/\w+/.test(file.type)) {
            alert("请确保文件为图像类型");
            return;
        }
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function () {
            //alert(this.result); //就是base64
            if (callBack) callBack(this.result);
        }
    }

    /**
     * 存储授权码
     * @param tokenValue 
     */
    setAuthorization(tokenValue: string): void {
        const cookies = useCookies();
        cookies.set(AppConsts.tokenKey, tokenValue);
    }

    /**
     * 获取授权码
     * @returns 
     */
    getAuthorization(): string {
        const cookies = useCookies();
        return cookies.get<string>(AppConsts.tokenKey);
    }

    /**
     * 移除授权码
     * @returns 
     */
    removeAuthorization(): boolean {
        const cookies = useCookies();
        cookies.remove(AppConsts.tokenKey);
        return true;
    }

}

export default new Tools();
