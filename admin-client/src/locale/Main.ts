import {createI18n} from 'vue-i18n';
import zhCn from '@/locale/zh-CN.js';
import enUS from "@/locale/en-US.js";

const i18n = createI18n({
    // something vue-i18n options here ...
    locale: 'zh-CN',
    messages: {
        'zh-CN': zhCn,
        'en-US': enUS
    },
})

export default i18n
