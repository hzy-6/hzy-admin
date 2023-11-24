import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import { resolve } from "path";
import vueJsx from "@vitejs/plugin-vue-jsx";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    vueJsx({
      // https://github.com/vitejs/vite-plugin-vue/tree/main/packages/plugin-vue-jsx
      // options are passed on to @vue/babel-plugin-jsx
    }),
  ],
  /**
   * 打包给目录的前缀
   * 生产环境默认：client 文件夹包起来
   * 开发环境默认：/
   */
  base: process.env.NODE_ENV == "production" ? "/client/" : "/",
  server: {
    port: 5501,
    proxy: {
      "/api/v1": {
        target: "http://localhost:5500/",
        ws: false,
        changeOrigin: true,
      },
    },

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
    extensions: [".js", ".json", ".scss", ".css", ".less", ".tsx", ".ts", ".vue"],
    alias: {
      "@/": resolve("src") + "/",
    },
  },
  // pages: {
  //     index: {
  //         // page 的入口
  //         entry: 'src/main.ts',
  //         // 模板来源
  //         template: 'public/index.html',
  //         // 在 dist/index.html 的输出
  //         filename: 'index.html',
  //         // 当使用 title 选项时，
  //         // template 中的 title 标签需要是 <title><%= htmlWebpackPlugin.options.title %></title>
  //         title: 'hzy-admin-ui-ts',
  //     },
  // },
  // CSS 预处理器
  css: {
    preprocessorOptions: {
      less: {
        javascriptEnabled: true,
      },
    },
    // postcss: {
    //   plugins: [
    //     require('autoprefixer')
    //   ]
    // }
  },
  build: {
    assetsDir: "static/img",
    rollupOptions: {
      output: {
        chunkFileNames: "static/js/[name]-[hash].js",
        entryFileNames: "static/js/[name]-[hash].js",
        assetFileNames: "static/[ext]/[name]-[hash].[ext]",
      },
    },
  },
});
