import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'path'
import AppConsts from "./src/infrastructure/scripts/AppConsts";
import { createHtmlPlugin } from "vite-plugin-html";

//这个配置 为了在html中使用 环境变量
// const getViteEnv = (mode, target) => {
//   return loadEnv(mode, process.cwd())[target];
// };

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue(), createHtmlPlugin({
    inject: {
      data: {
        //将环境变量 VITE_APP_TITLE 赋值给 title 方便 html页面使用 title 获取系统标题
        title: AppConsts.appTitle // getViteEnv(mode, "VITE_APP_TITLE"),
      },
    },
  })
  ],
  base: AppConsts.packDirectoryPrefix,
  server: {
    port: 5858
    // proxy: {
    //     '/admin': {
    //         target: 'http://localhost:6789/admin',
    //         ws: false,
    //         changeOrigin: true
    //     }
    // }

    // 设置 https 代理
    // proxy: {
    //   '/api': {
    //     target: 'your https address',
    //     changeOrigin: true,
    //     rewrite: (path: string) => path.replace(/^\/api/, '')
    //   }
    // }
  },
  resolve: {
    extensions: ['.js', '.ts', '.json', '.vue', '.scss', '.css', '.less'],
    alias: {
      '@/': resolve('src') + '/',
    }
  },
  // CSS 预处理器
  css: {
    preprocessorOptions: {
      less: {
        javascriptEnabled: true
      }
    },
    // postcss: {
    //   plugins: [
    //     require('autoprefixer')
    //   ]
    // }
  },
  build: {
    assetsDir: 'static/img',
    rollupOptions: {
      output: {
        chunkFileNames: "static/js/[name]-[hash].js",
        entryFileNames: "static/js/[name]-[hash].js",
        assetFileNames: "static/[ext]/[name]-[hash].[ext]"
      }
    }
  }
})
