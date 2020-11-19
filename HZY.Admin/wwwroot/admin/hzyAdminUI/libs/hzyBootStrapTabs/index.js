/*
 * *******************************************************
 * 
 * 作者：hzy
 * 
 * 开源地址：https://gitee.com/hzy6
 * 
 * *******************************************************
 */
var hzyBootStrapTabs = {
    el: '',
    //选项卡激活回调事件
    callChangeTab: null,
    //选项卡动画移动延迟
    moveSpeed: 0,
    //选项卡智能定位动画延迟
    locationMoveSpeed: 0,
    //是否自动适应高度
    isIframeHeight: false,
    lodingStart: null, //加载转圈开始
    lodingClose: null, //加载转圈结束
    //tabArray=[{ id:'1' , title:'名称' , href:'www.baidu.com',active:false,isClose=false }]
    init: function (el, tabArray = [], _callChangeTab, _lodingStart = null, _lodingClose = null, _moveSpeed = 1000, _locationMoveSpeed = 200, _isIframeHeight = false) {
        var _this = this;
        _this.el = el;
        $(_this.el).empty().html(_this.getTemp(tabArray));
        //
        _this.callChangeTab = _callChangeTab;
        _this.moveSpeed = _moveSpeed;
        _this.locationMoveSpeed = _locationMoveSpeed;
        _this.isIframeHeight = _isIframeHeight;
        _this.lodingStart = _lodingStart;
        _this.lodingClose = _lodingClose;
        //
        $(window).resize(function () { //当浏览器大小变化时
            //alert($(window).height());          //浏览器时下窗口可视区域高度
            //alert($(document).height());        //浏览器时下窗口文档的高度
            //alert($(document.body).height());   //浏览器时下窗口文档body的高度
            //alert($(document.body).outerHeight(true)); //浏览器时下窗口文档body的总高度 包括border padding margin

            //定位
            _this.location();
        });

        if (_this.isIframeHeight) {
            setInterval(function () {
                //定时检测 iframe 高度
                var iframe = $(el).find('iframe');
                for (var i = 0; i < iframe.length; i++) {
                    var item = iframe[i];
                    _this.iframeSetHeight(item);
                }
            }, 200);
        }

        //检查是否存有选项卡信息
        var tabinfo = window.localStorage.getItem("lastActiveTab");
        if (tabinfo) {
            tabinfo = JSON.parse(tabinfo);
            _this.addTab(tabinfo.id, tabinfo.title, tabinfo.href, tabinfo.active, tabinfo.isClose);
        }
    },
    getTemp: function (tabArray) {

        var tempTab = '';

        var tempIframe = '';

        for (var i = 0; i < tabArray.length; i++) {
            var item = tabArray[i];
            var id = item.id;
            var title = item.title;
            var href = item.href;
            var active = item.active;
            var isClose = item.isClose;

            tempTab += this.getTempTab(id, title, href, active, isClose);

            tempIframe += this.getTempIframe(id, title, href, active, isClose);
        }

        // for (let index = 0; index < 150; index++) {
        //     tempTab += this.getTempTab(index, 'page' + index, 'https://www.baidu.com');
        // }

        var temp = `

<div class="hzytabs-content">
    <div class="hzytabs-tablist shadow-sm">
        <div class="hzytabs-tablist-left" onclick="hzyBootStrapTabs.moveLeft()">
            <svg class="bi bi-chevron-compact-left" width="2em" height="2em" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M11.224 3.553a.5.5 0 01.223.67L8.56 10l2.888 5.776a.5.5 0 11-.894.448l-3-6a.5.5 0 010-.448l3-6a.5.5 0 01.67-.223z" clip-rule="evenodd"></path>
            </svg>
        </div>
        <div class="hzytabs-tablist-center">
            <ul class="nav nav-pills" role="tablist">
                ` + tempTab + `
            </ul>
        </div>
        <div class="hzytabs-tablist-right">
            <div class="hzytabs-tablist-right-btn" onclick="hzyBootStrapTabs.moveRight()">
                <svg class="bi bi-chevron-compact-right" width="2em" height="2em" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M8.776 3.553a.5.5 0 01.671.223l3 6a.5.5 0 010 .448l-3 6a.5.5 0 11-.894-.448L11.44 10 8.553 4.224a.5.5 0 01.223-.671z" clip-rule="evenodd"></path>
                </svg>
            </div>
            <div class="hzytabs-tablist-right-select">
                <div class="dropdown dropleft">
                    <button class="btn btn-link dropdown-toggle" type="button" id="hzyAdminTabsTools" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    </button>
                    <div class="dropdown-menu" aria-labelledby="hzyAdminTabsTools">
                        <a class="dropdown-item" href="javascript:;" onclick="hzyBootStrapTabs.removeThisTab()">关闭当前</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:;" onclick="hzyBootStrapTabs.removeOtherTab()">关闭其他</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:;" onclick="hzyBootStrapTabs.removeAllTab()">关闭所有</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:;" onclick="hzyBootStrapTabs.loadCurrentPage()">刷新当前</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-content">
        <div class="tab-loading">
            <div class="spinner-grow text-danger" style="width: 5rem; height: 5rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>        
        ` + tempIframe + `
    </div>
</div>

`;

        return temp;

    },
    getTempTab: function (id, title, href, active = false, isClose = true) {
        //alert(isClose);
        var closeTemp = `<i class="fas fa-times" onclick="hzyBootStrapTabs.removeTab('` + id + `')"></i>`;
        //closeTemp = '';

        return `

<li class="nav-item" hzy-id="` + id + `" hzy-title="` + title + `" hzy-href="` + href + `" hzy-active="` + active + `" hzy-isClose="` + isClose + `" ondblclick="hzyBootStrapTabs.removeThisTab()">
    <a class="nav-link` + (active ? ' active' : '') + `" id="` + id + `-tab" data-toggle="pill" href="#` + id + `" role="tab" aria-controls="` + id + `" aria-selected="` + active + `" isClose="` + isClose + `">` + title + `</a>
    ` + (isClose ? closeTemp : '') + `
</li>

`;

    },
    getTempIframe: function (id, title, href, active = false, isClose = true) {

        return `

<div class="tab-pane fade` + (active ? ' show active' : '') + `" id="` + id + `" role="tabpanel" aria-labelledby="` + id + `-tab">
    <iframe frameborder="0" scrolling="auto" src="` + href + `" name="` + id + `-iframe" loading="lazy" onload="hzyBootStrapTabs.iframeLoadingClose()"></iframe>
</div>

`;
        // onload="hzyBootStrapTabs.iframeSetHeight(this)"
    },
    //设置 iframe 高度
    iframeSetHeight: function (e) {
        //console.log('e', e.contentWindow.document.body);
        var src = $(e).attr('src');
        if (src.indexOf('http') == 0) return;
        if (!this.isIframeHeight) return;
        setTimeout(function () {
            //$(e).height($(e.contentWindow.document.body).height() + 50);
            $(e).height($(e.contentDocument.body).height() + 50);
        }, 200);
    },
    //
    iframeLoadingStart: function () {
        // $(this.el).find('.tab-loading').show();
        if (this.lodingStart) this.lodingStart();
    },
    iframeLoadingClose: function () {
        // $(this.el).find('.tab-loading').hide();
        if (this.lodingClose) this.lodingClose();
    },
    //监听iframe 对象加载完成
    iframeLoadSuccess: function (iframe, callBack) {
        if (iframe.attachEvent) {
            //todo something
            if (callBack) callBack();
        } else {
            iframe.onload = function () {
                //todo something
                if (callBack) callBack();
            }
        }
    },
    //加载当前页面
    loadCurrentPage: function () {
        var _this = this;
        _this.iframeLoadingStart();
        var iframe = $(this.el).find('.tab-content .tab-pane.active iframe');
        var src = iframe.attr('src');
        iframe.attr('src', src);
        this.iframeLoadSuccess(iframe[0], function () {
            console.log('iframe 加载完成!');
            _this.iframeLoadingClose();
        });
    },
    //左移动
    moveLeft: function () {
        var _moveLen = $(this.el).find('.hzytabs-tablist-center').width();
        var ul = $(this.el).find('.hzytabs-tablist-center ul');

        var lis = ul.find('li');
        var liWidth = 0;
        for (var i = 0; i < lis.length; i++) {
            var item = $(lis[i]);
            liWidth += item.width();
        }

        var endValue = liWidth - _moveLen;

        if (Math.abs(ul.position().left) + _moveLen >= endValue) {
            ul.css({ 'left': '-' + endValue + 'px' });
            return;
        }

        this.animateTab(ul, { left: '-=' + _moveLen + 'px' }, function () {
            if (Math.abs(ul.position().left) >= endValue) {
                ul.css({ 'left': '-' + endValue + 'px' });
            }
        });
    },
    //右移动
    moveRight: function () {
        var _moveLen = $(this.el).find('.hzytabs-tablist-center').width();
        var ul = $(this.el).find('.hzytabs-tablist-center ul');

        if (ul.position().left + _moveLen >= 0) {
            ul.css({ 'left': '0px' });
            return;
        }

        this.animateTab(ul, { left: '+=' + _moveLen + 'px' }, function () {
            if (ul.position().left > 0) {
                ul.css({ 'left': '0px' });
            }
        });
    },
    //移动动画
    animateTab: function (dom, obj, callCheckEnd, newMoveSpeed = 0) {
        dom.stop().animate(obj, newMoveSpeed > 0 ? newMoveSpeed : this.moveSpeed, callCheckEnd);
    },
    //激活选项卡
    activeTab: function (id) {
        //先取消所有激活
        $(this.el).find('.hzytabs-tablist-center li a.nav-link').removeClass('active');
        $(this.el).find('.hzytabs-tablist-center li a.nav-link').attr('aria-selected', false);
        //
        $(this.el).find('.tab-content .tab-pane').removeClass('show active');
        //
        var tab = $(this.el).find('.hzytabs-tablist-center a[id=' + id + '-tab]'); //.tab('show')
        tab.addClass('active');
        tab.attr('aria-selected', true);
        $(this.el).find('.tab-content .tab-pane[id=' + id + ']').addClass('show active');
        //收集信息
        var title = tab.parent().attr('hzy-title');
        var href = tab.parent().attr('hzy-href');
        var active = tab.parent().attr('hzy-active');
        var isClose = tab.parent().attr('hzy-isClose');
        //记录最后保存的按钮
        window.localStorage.setItem('lastActiveTab', JSON.stringify({
            id: id,
            title: title,
            href: href,
            active: true,
            isClose: isClose
        }));
        if (this.callChangeTab) {
            //触发选项卡激活回调
            this.callChangeTab({
                id: id,
                title: title,
                href: href,
                active: (active ? JSON.parse(active) : true),
                isClose: JSON.parse(isClose),
            });
        }
        //定位
        this.location();
    },
    //选项卡智能定位 tab
    location: function () {
        var lookArea = $(this.el).find('.hzytabs-tablist-center');

        var ul = lookArea.find('ul');
        var tabListOffsetLeft = lookArea.offset().left;
        var tab = lookArea.find('a.active');
        var offsetLeft = tab.parent('li').offset().left;

        //判断是否需要定位
        if (offsetLeft < tabListOffsetLeft) {
            this.animateTab(ul, { 'left': '-' + tab.position().left + 'px' }, function () {
                ul = lookArea.find('ul');
                if (ul.position().left > 0) {
                    ul.css({ 'left': '0px' });
                }
            }, this.locationMoveSpeed);
        }

        var _otherArea = ($(this.el).width() - lookArea.width()) + tab.width();
        if (offsetLeft > (lookArea.width() + tabListOffsetLeft) - _otherArea) {
            var len = tab.position().left - lookArea.width() + _otherArea;
            this.animateTab(ul, { 'left': '-' + len + 'px' }, function () {
                ul = lookArea.find('ul');
                var lis = ul.find('li');
                var liWidth = 0;
                for (var i = 0; i < lis.length; i++) {
                    var item = $(lis[i]);
                    liWidth += item.width();
                }

                var _moveLen = lookArea.width();

                var endValue = liWidth - _moveLen;
                if (Math.abs(ul.position().left) >= endValue) {
                    ul.css({ 'left': '-' + endValue + 'px' });
                }
            }, this.locationMoveSpeed);
        }
    },
    //添加 tab
    addTab: function (id, title, href, active = true, isClose = true) {
        var _this = this;
        var ul = $(this.el).find('.hzytabs-tablist-center ul');
        //检查 id 是否存在
        var tab = $(this.el).find('.hzytabs-tablist-center a[id=' + id + '-tab]');
        if (tab && tab.length > 0) {
            this.activeTab(id);
            return;
        }
        _this.iframeLoadingStart();
        //不存在添加 dom
        var tempTab = this.getTempTab(id, title, href, active, isClose);
        var tempIframe = this.getTempIframe(id, title, href, active, isClose);
        ul.append(tempTab);
        $(this.el).find('.tab-content').append(tempIframe);
        //iframe 加载完成监听
        var iframe = $(this.el).find('.tab-content .tab-pane.active iframe');
        this.iframeLoadSuccess(iframe[0], function () {
            console.log('iframe 加载完成!');
            _this.iframeLoadingClose();
        });
        //激活选项卡
        this.activeTab(id);
    },
    //移除当前 选项卡
    removeThisTab: function () {
        var tab = $(this.el).find('.hzytabs-tablist-center li a.nav-link.active');
        var isClose = tab.parent().attr('hzy-isClose');
        if (!JSON.parse(isClose)) return;
        if (confirm('确定关闭当前选项卡吗？')) {
            var id = tab.attr('aria-controls');
            this.removeTab(id);
        }
    },
    //移除选项卡
    removeTab: function (id) {
        var tab = $(this.el).find('.hzytabs-tablist-center a[id=' + id + '-tab]').parent();
        var content = $(this.el).find('.tab-content .tab-pane[id=' + id + ']');
        //判断能否移除
        if (tab.find('a').attr('isClose') && !JSON.parse(tab.find('a').attr('isClose'))) return;
        //兄弟节点上一个
        var prevId = tab.prev().find('a').attr('aria-controls');
        tab.remove();
        content.remove();
        //
        this.activeTab(prevId);
    },
    //移除所有
    removeAllTab: function () {
        var tabs = $(this.el).find('.hzytabs-tablist-center li a.nav-link');
        for (var i = 0; i < tabs.length; i++) {
            var item = $(tabs[i]);
            var id = item.attr('aria-controls');
            this.removeTab(id);
        }
        //然后激活第一个
        var tab = $(this.el).find('.hzytabs-tablist-center li a.nav-link:first');
        var id = tab.attr('aria-controls');
        //
        this.activeTab(id);
    },
    //移除其他选项卡
    removeOtherTab: function () {
        var tab = $(this.el).find('.hzytabs-tablist-center li a.nav-link.active');
        var idActive = tab.attr('aria-controls');

        var tabs = $(this.el).find('.hzytabs-tablist-center li a.nav-link');
        for (var i = 0; i < tabs.length; i++) {
            var item = $(tabs[i]);
            var id = item.attr('aria-controls');
            if (id === idActive) continue;
            this.removeTab(id);
        }
    }
};