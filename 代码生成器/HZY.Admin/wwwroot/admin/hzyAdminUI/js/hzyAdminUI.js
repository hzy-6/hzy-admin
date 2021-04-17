/*
 * *******************************************************
 * 
 * 作者：hzy
 * 
 * 开源地址：https://gitee.com/hzy6
 * 
 * *******************************************************
 */
var hzyAdminUI = {
    settings: {
        //页面加载后放入的节点
        menuContainer: 'main nav.hzy-menu',
        menuSessionName: 'adminMW',
        menuSkinSessionName: 'adminMenuSkin'
    },
    header: {
        keyName: 'headerSkin',
        init: function() {
            var skin = window.localStorage.getItem(hzyAdminUI.header.keyName);
            if (skin) $('.hzy-container header').removeAttr('class').addClass(skin);
        },
        setSkin: function(skin) {
            $('.hzy-container header').removeAttr('class').addClass(skin);
            window.localStorage.setItem(hzyAdminUI.header.keyName, skin);
        }
    },
    init: function() {
        hzyAdminUI.menu.domObject = $('#hzyAdminMenu').metisMenu({ toggle: true });
        hzyAdminUI.menu.init();
        hzyAdminUI.header.init();
        window.onresize = function() {
            hzyAdminUI.menu.init();
        };
        //点击菜单
        $('body').on('click', '*[hzy-id],*[hzy-href],*[hzy-title]', function() {
            var item = $(this);
            var id = item.attr('hzy-id');
            var href = item.attr('hzy-href');
            var title = item.attr('hzy-title');
            var isClose = item.attr('hzy-isClose');
            isClose = isClose ? JSON.parse(isClose) : true;
            if (!id) return;
            href = href ? href : 'https://gitee.com/hzy6';
            title = title ? title : '无标题';
            //跳转标签页
            hzyBootStrapTabs.addTab(id, title, href, true, isClose);
        });
    },
    isPc: function() {
        return window.innerWidth > 990;
    },
    //菜单管理
    menu: {
        domObject: null, //菜单初始化对象
        mMaxWidth: 'sidebar-nav-max', //菜单最大宽度
        mMinWidth: 'sidebar-nav-min', //菜单最小宽度
        mSkin: {
            //菜单皮肤
            default: 'sidebar-nav',
            white: 'sidebar-nav-white'
        },
        init: function() {
            var _menu = $(hzyAdminUI.settings.menuContainer);
            if (!hzyAdminUI.isPc()) {
                if (_menu.hasClass(hzyAdminUI.menu.mMaxWidth)) {
                    _menu.removeClass(hzyAdminUI.menu.mMaxWidth);
                    _menu.addClass(hzyAdminUI.menu.mMinWidth);
                }
            } else {
                var w = window.localStorage.getItem(hzyAdminUI.settings.menuSessionName);
                if (w) {
                    _menu.removeClass(hzyAdminUI.menu.mMaxWidth).removeClass(hzyAdminUI.menu.mMinWidth).addClass(w);
                }
                var skin = window.localStorage.getItem(hzyAdminUI.settings.menuSkinSessionName);
                if (skin) {
                    hzyAdminUI.menu.setSkin(skin);
                }
            }
        },
        //激活左侧菜单 选中状态
        active: function(id) {
            if (!hzyAdminUI.menu.domObject) return;
            hzyAdminUI.menu.domObject.find('li').removeClass('mm-active').find('a').attr('aria-expanded', false);
            var li = hzyAdminUI.menu.domObject.find('li[hzy-id=' + id + ']');
            li.addClass('mm-active').find('a').attr('aria-expanded', true);
            var w = window.localStorage.getItem(hzyAdminUI.settings.menuSessionName);
            if (w === hzyAdminUI.menu.mMinWidth) {
                li.parents('li').addClass('mm-active');
                hzyAdminUI.menu.domObject.find('ul').removeClass('mm-show');
            } else {
                if (!li.parents('li').hasClass('mm-active')) li.parents('li').find('a.has-arrow:eq(0)').click();
            }
        },
        toggle: function() {
            var _menuContainer = $(hzyAdminUI.settings.menuContainer);
            if (_menuContainer.hasClass(hzyAdminUI.menu.mMaxWidth))
                hzyAdminUI.menu.min(_menuContainer);
            else
                hzyAdminUI.menu.max(_menuContainer);
        },
        max: function(_menuContainer) {
            _menuContainer.addClass(hzyAdminUI.menu.mMaxWidth);
            _menuContainer.removeClass(hzyAdminUI.menu.mMinWidth);
            if (hzyAdminUI.isPc())
                window.localStorage.setItem(hzyAdminUI.settings.menuSessionName, hzyAdminUI.menu.mMaxWidth);
            else
                window.localStorage.removeItem(hzyAdminUI.settings.menuSessionName);
        },
        min: function(_menuContainer) {
            _menuContainer.addClass(hzyAdminUI.menu.mMinWidth);
            _menuContainer.removeClass(hzyAdminUI.menu.mMaxWidth);
            if (hzyAdminUI.isPc())
                window.localStorage.setItem(hzyAdminUI.settings.menuSessionName, hzyAdminUI.menu.mMinWidth);
            else
                window.localStorage.removeItem(hzyAdminUI.settings.menuSessionName);
        },
        setSkin: function(skin) {
            var _menu = $(hzyAdminUI.settings.menuContainer);
            _menu.removeClass(hzyAdminUI.menu.mSkin.default).removeClass(hzyAdminUI.menu.mSkin.white);
            _menu.addClass(skin);
            window.localStorage.setItem(hzyAdminUI.settings.menuSkinSessionName, skin);
        }
    },
    //全屏 类
    fullScreen: function() {
        var isFullScreen = false;
        var requestFullScreen = function() { //全屏
            var de = document.documentElement;
            if (de.requestFullscreen) {
                de.requestFullscreen();
            } else if (de.mozRequestFullScreen) {
                de.mozRequestFullScreen();
            } else if (de.webkitRequestFullScreen) {
                de.webkitRequestFullScreen();
            } else {
                alert("该浏览器不支持全屏");
            }
        };
        //退出全屏 判断浏览器种类
        var exitFull = function() {
            // 判断各种浏览器，找到正确的方法
            var exitMethod = document.exitFullscreen || //W3C
                document.mozCancelFullScreen || //Chrome等
                document.webkitExitFullscreen || //FireFox
                document.webkitExitFullscreen; //IE11
            if (exitMethod) {
                exitMethod.call(document);
            } else if (typeof window.ActiveXObject !== "undefined") { //for Internet Explorer
                var wscript = new ActiveXObject("WScript.Shell");
                if (wscript !== null) {
                    wscript.SendKeys("{F11}");
                }
            }
        };

        return {
            handleFullScreen: function($this) {
                $this = $($this);
                if (isFullScreen) {
                    exitFull();
                    isFullScreen = false;
                    $this.find("i").removeClass("fas fa-compress");
                    $this.find("i").addClass("fas fa-expand");
                } else {
                    requestFullScreen();
                    isFullScreen = true;
                    $this.find("i").removeClass("fas fa-expand");
                    $this.find("i").addClass("fas fa-compress");
                }
            },
        };

    }()
};