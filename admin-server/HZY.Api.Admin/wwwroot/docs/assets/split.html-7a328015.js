import{_ as i}from"./split-1-1db7d146.js";import{_ as c,r as t,o as l,c as o,b as n,d as s,e as p,a}from"./app-4f4af2d5.js";const d={},r=a('<h1 id="前后端分离" tabindex="-1"><a class="header-anchor" href="#前后端分离" aria-hidden="true">#</a> 前后端分离</h1><div class="custom-container tip"><p class="custom-container-title">提示</p><p>项目采用的是前后端分离的模式开发，前端一般采用 nginx 部署 vue 代码</p></div><h2 id="_1、首先确认前端代码-打包基础目录是否正确" tabindex="-1"><a class="header-anchor" href="#_1、首先确认前端代码-打包基础目录是否正确" aria-hidden="true">#</a> 1、首先确认前端代码 打包基础目录是否正确</h2><blockquote><p>下图中 /client/ 代表打包后代码文件必须在一个 client 目录下</p></blockquote><p><img src="'+i+`" alt="配置打包路径"></p><h2 id="_2、打包前端代码" tabindex="-1"><a class="header-anchor" href="#_2、打包前端代码" aria-hidden="true">#</a> 2、打包前端代码</h2><blockquote><p>打包后的前端代码，位于 dist 文件夹中</p></blockquote><div class="language-bash line-numbers-mode" data-ext="sh"><pre class="language-bash"><code><span class="token function">npm</span> run build
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div><h2 id="_3、将打包后的代码放到-nginx-的-html-目录下" tabindex="-1"><a class="header-anchor" href="#_3、将打包后的代码放到-nginx-的-html-目录下" aria-hidden="true">#</a> 3、将打包后的代码放到 nginx 的 html 目录下</h2><blockquote><p>例如：/usr/local/nginx/html/client 这里的 client 目录根据你代码配置 /client/ 而定</p></blockquote><h2 id="_4、配置-nginx" tabindex="-1"><a class="header-anchor" href="#_4、配置-nginx" aria-hidden="true">#</a> 4、配置 nginx</h2><blockquote><p>下面是一个简单的 nginx 配置，如果你不会配置 nginx 请自行百度 或者 GPT</p></blockquote><div class="language-nginx line-numbers-mode" data-ext="nginx"><pre class="language-nginx"><code>    <span class="token directive"><span class="token keyword">server</span></span> <span class="token punctuation">{</span>
        <span class="token directive"><span class="token keyword">listen</span>       <span class="token number">1088</span></span><span class="token punctuation">;</span><span class="token comment">#客户端访问端口</span>
        <span class="token directive"><span class="token keyword">server_name</span>  localhost</span><span class="token punctuation">;</span><span class="token comment">#客户端访问域名  Nginx服务器的地址</span>

        <span class="token comment">#charset koi8-r;</span>

        <span class="token comment">#access_log  logs/host.access.log  main;#   </span>

        <span class="token directive"><span class="token keyword">location</span> /</span> <span class="token punctuation">{</span>
            <span class="token directive"><span class="token keyword">root</span>   html</span><span class="token punctuation">;</span>
            <span class="token directive"><span class="token keyword">index</span>  index.html index.htm</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span>


        <span class="token comment">#error_page  404              /404.html;</span>

        <span class="token comment"># redirect server error pages to the static page /50x.html</span>
        <span class="token comment">#</span>
        <span class="token directive"><span class="token keyword">error_page</span>   <span class="token number">500</span> <span class="token number">502</span> <span class="token number">503</span> <span class="token number">504</span>  /50x.html</span><span class="token punctuation">;</span>
        <span class="token directive"><span class="token keyword">location</span> = /50x.html</span> <span class="token punctuation">{</span>
            <span class="token directive"><span class="token keyword">root</span>   html</span><span class="token punctuation">;</span>
        <span class="token punctuation">}</span>

        <span class="token comment"># proxy the PHP scripts to Apache listening on 127.0.0.1:80</span>
        <span class="token comment">#</span>
        <span class="token comment">#location ~ \\.php$ {</span>
        <span class="token comment">#    proxy_pass   http://127.0.0.1;</span>
        <span class="token comment">#}</span>

        <span class="token comment"># pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000</span>
        <span class="token comment">#</span>
        <span class="token comment">#location ~ \\.php$ {</span>
        <span class="token comment">#    root           html;</span>
        <span class="token comment">#    fastcgi_pass   127.0.0.1:9000;</span>
        <span class="token comment">#    fastcgi_index  index.php;</span>
        <span class="token comment">#    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;</span>
        <span class="token comment">#    include        fastcgi_params;</span>
        <span class="token comment">#}</span>

        <span class="token comment"># deny access to .htaccess files, if Apache&#39;s document root</span>
        <span class="token comment"># concurs with nginx&#39;s one</span>
        <span class="token comment">#</span>
        <span class="token comment">#location ~ /\\.ht {</span>
        <span class="token comment">#    deny  all;</span>
        <span class="token comment">#}</span>
    <span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_5、重启-nginx" tabindex="-1"><a class="header-anchor" href="#_5、重启-nginx" aria-hidden="true">#</a> 5、重启 nginx</h2>`,14),m={href:"http://localhost:1088",target:"_blank",rel:"noopener noreferrer"},v=a(`<div class="language-bash line-numbers-mode" data-ext="sh"><pre class="language-bash"><code><span class="token function">sudo</span> <span class="token function">service</span> nginx restart
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div></div></div>`,1);function u(k,h){const e=t("ExternalLinkIcon");return l(),o("div",null,[r,n("blockquote",null,[n("p",null,[s("重启 nginx 服务，访问 "),n("a",m,[s("http://localhost:1088"),p(e)]),s(" 即可看到前端页面")])]),v])}const _=c(d,[["render",u],["__file","split.html.vue"]]);export{_ as default};
