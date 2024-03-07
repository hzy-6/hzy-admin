import{_ as n,o as s,c as a,a as t}from"./app-4f4af2d5.js";const e={},p=t(`<h1 id="获取登陆人信息" tabindex="-1"><a class="header-anchor" href="#获取登陆人信息" aria-hidden="true">#</a> 获取登陆人信息</h1><blockquote><p>1、构造注入 IAccountService 接口服务</p></blockquote><blockquote><p>2、var accountInfo = _accountService.GetAccountContext(); 获取账户信息</p></blockquote><blockquote><p>示例：</p></blockquote><div class="language-csharp line-numbers-mode" data-ext="cs"><pre class="language-csharp"><code><span class="token keyword">namespace</span> <span class="token namespace">HZY<span class="token punctuation">.</span>Api<span class="token punctuation">.</span>Admin<span class="token punctuation">.</span>ApplicationServices<span class="token punctuation">.</span>Bases</span><span class="token punctuation">;</span>

<span class="token doc-comment comment">/// <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>summary</span><span class="token punctuation">&gt;</span></span></span>
<span class="token doc-comment comment">/// 会员服务</span>
<span class="token doc-comment comment">/// <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>summary</span><span class="token punctuation">&gt;</span></span></span>
<span class="token keyword">public</span> <span class="token keyword">class</span> <span class="token class-name">MemberService</span> <span class="token punctuation">:</span> <span class="token type-list"><span class="token class-name">ApplicationService<span class="token punctuation">&lt;</span>IRepository<span class="token punctuation">&lt;</span>Member<span class="token punctuation">&gt;</span><span class="token punctuation">&gt;</span></span></span>
<span class="token punctuation">{</span>
    <span class="token keyword">private</span> <span class="token keyword">readonly</span> <span class="token class-name">IAccountService</span> _accountService<span class="token punctuation">;</span>

    <span class="token keyword">public</span> <span class="token function">MemberService</span><span class="token punctuation">(</span><span class="token class-name">IRepository<span class="token punctuation">&lt;</span>Member<span class="token punctuation">&gt;</span></span> defaultRepository<span class="token punctuation">,</span> <span class="token class-name">IAccountService</span> accountService<span class="token punctuation">)</span><span class="token punctuation">:</span> <span class="token keyword">base</span><span class="token punctuation">(</span>defaultRepository<span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        _accountService <span class="token operator">=</span> accountService<span class="token punctuation">;</span>
    <span class="token punctuation">}</span>

    <span class="token doc-comment comment">/// <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>summary</span><span class="token punctuation">&gt;</span></span></span>
    <span class="token doc-comment comment">/// 获取列表数据</span>
    <span class="token doc-comment comment">/// <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>summary</span><span class="token punctuation">&gt;</span></span></span>
    <span class="token doc-comment comment">/// <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>param</span> <span class="token attr-name">name</span><span class="token attr-value"><span class="token punctuation attr-equals">=</span><span class="token punctuation">&quot;</span>pagingSearchInput<span class="token punctuation">&quot;</span></span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>param</span><span class="token punctuation">&gt;</span></span></span>
    <span class="token doc-comment comment">/// <span class="token tag"><span class="token tag"><span class="token punctuation">&lt;</span>returns</span><span class="token punctuation">&gt;</span></span><span class="token tag"><span class="token tag"><span class="token punctuation">&lt;/</span>returns</span><span class="token punctuation">&gt;</span></span></span>
    <span class="token keyword">public</span> <span class="token keyword">async</span> <span class="token return-type class-name">Task<span class="token punctuation">&lt;</span>PagingView<span class="token punctuation">&gt;</span></span> <span class="token function">FindListAsync</span><span class="token punctuation">(</span><span class="token class-name">PagingSearchInput<span class="token punctuation">&lt;</span>Member<span class="token punctuation">&gt;</span></span> pagingSearchInput<span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token class-name"><span class="token keyword">var</span></span> accountInfo <span class="token operator">=</span> _accountService<span class="token punctuation">.</span><span class="token function">GetAccountContext</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span> <span class="token comment">// 获取当前登录人信息</span>

        <span class="token keyword">return</span> <span class="token keyword">null</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div>`,5),c=[p];function o(l,u){return s(),a("div",null,c)}const k=n(e,[["render",o],["__file","user-info.html.vue"]]);export{k as default};