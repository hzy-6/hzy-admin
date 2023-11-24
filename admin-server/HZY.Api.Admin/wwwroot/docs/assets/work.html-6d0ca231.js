import{_ as n,o as s,c as a,a as e}from"./app-4f4af2d5.js";const t={},p=e(`<h1 id="事务-延迟提交" tabindex="-1"><a class="header-anchor" href="#事务-延迟提交" aria-hidden="true">#</a> 事务，延迟提交</h1><h2 id="_1、事务特性" tabindex="-1"><a class="header-anchor" href="#_1、事务特性" aria-hidden="true">#</a> 1、事务特性</h2><div class="custom-container tip"><p class="custom-container-title">注意</p><p>1、函数必须是 virtual 事务特性才能起作用。</p><p>2、[Transactional] 特性默认读取 AdminDbContext 如何其他 DbContext 请指定 DbContextType。</p></div><div class="language-csharp line-numbers-mode" data-ext="cs"><pre class="language-csharp"><code><span class="token punctuation">[</span><span class="token attribute"><span class="token class-name">Transactional</span></span><span class="token punctuation">]</span>
<span class="token keyword">public</span> <span class="token keyword">virtual</span> <span class="token keyword">async</span> <span class="token return-type class-name">Task</span> <span class="token function">SaveFormAsync</span><span class="token punctuation">(</span><span class="token class-name">SysUserFormDto</span> form<span class="token punctuation">)</span>
<span class="token punctuation">{</span>
    <span class="token comment">// 你的业务逻辑 CRUD ...</span>
<span class="token punctuation">}</span>

<span class="token punctuation">[</span><span class="token attribute"><span class="token class-name">Transactional</span><span class="token attribute-arguments"><span class="token punctuation">(</span><span class="token keyword">typeof</span><span class="token punctuation">(</span><span class="token type-expression class-name">AdminDbContext</span><span class="token punctuation">)</span><span class="token punctuation">,</span><span class="token range operator">..</span><span class="token punctuation">.</span><span class="token punctuation">)</span></span></span><span class="token punctuation">]</span>
<span class="token keyword">public</span> <span class="token keyword">virtual</span> <span class="token keyword">async</span> <span class="token return-type class-name">Task</span> <span class="token function">SaveFormAsync</span><span class="token punctuation">(</span><span class="token class-name">SysUserFormDto</span> form<span class="token punctuation">)</span>
<span class="token punctuation">{</span>
    <span class="token comment">// 你的业务逻辑 CRUD ...</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_2、提交事务" tabindex="-1"><a class="header-anchor" href="#_2、提交事务" aria-hidden="true">#</a> 2、提交事务</h2><div class="language-csharp line-numbers-mode" data-ext="cs"><pre class="language-csharp"><code><span class="token keyword">public</span> <span class="token keyword">async</span> <span class="token return-type class-name">Task</span> <span class="token function">SaveFormAsync</span><span class="token punctuation">(</span><span class="token class-name">SysUserFormDto</span> form<span class="token punctuation">)</span>
<span class="token punctuation">{</span>
    <span class="token comment">// 创建事务对象</span>
    <span class="token keyword">using</span> <span class="token class-name"><span class="token keyword">var</span></span> tr <span class="token operator">=</span> <span class="token keyword">await</span> _defaultRepository<span class="token punctuation">.</span>UnitOfWork<span class="token punctuation">.</span><span class="token function">BeginTransactionAsync</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

    <span class="token keyword">try</span>
    <span class="token punctuation">{</span>
        <span class="token comment">// 你的业务逻辑 CRUD ...</span>
    <span class="token punctuation">}</span>
    <span class="token keyword">catch</span> <span class="token punctuation">(</span><span class="token class-name">Exception</span><span class="token punctuation">)</span>
    <span class="token punctuation">{</span>
        <span class="token comment">// 回滚事务</span>
        <span class="token keyword">await</span> tr<span class="token punctuation">.</span><span class="token function">RollbackAsync</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
        <span class="token keyword">throw</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
    <span class="token keyword">finally</span>
    <span class="token punctuation">{</span>
        <span class="token comment">// 提交事务</span>
        <span class="token keyword">await</span> tr<span class="token punctuation">.</span><span class="token function">CommitAsync</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>
    <span class="token punctuation">}</span>
<span class="token punctuation">}</span>
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div><h2 id="_3、延迟提交" tabindex="-1"><a class="header-anchor" href="#_3、延迟提交" aria-hidden="true">#</a> 3、延迟提交</h2><div class="language-csharp line-numbers-mode" data-ext="cs"><pre class="language-csharp"><code><span class="token comment">// 开启延迟提交</span>
_defaultRepository<span class="token punctuation">.</span>UnitOfWork<span class="token punctuation">.</span><span class="token function">CommitDelayStart</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>

<span class="token comment">// 你的业务逻辑 CRUD ...</span>

<span class="token comment">// 结束延迟提交</span>
_defaultRepository<span class="token punctuation">.</span>UnitOfWork<span class="token punctuation">.</span><span class="token function">CommitDelayEnd</span><span class="token punctuation">(</span><span class="token punctuation">)</span><span class="token punctuation">;</span>    
</code></pre><div class="line-numbers" aria-hidden="true"><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div><div class="line-number"></div></div></div>`,8),c=[p];function o(i,l){return s(),a("div",null,c)}const r=n(t,[["render",o],["__file","work.html.vue"]]);export{r as default};
