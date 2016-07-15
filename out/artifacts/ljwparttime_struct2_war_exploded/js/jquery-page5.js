/**
 * 分页插件
 */

(function ($) {
    var isdebug = true;

    var methods = {
        init: function (settings) {
            var opts = $.extend({}, $.fn.paging.defaults, settings); //使用jQuery.extend 覆盖插件默认参数
            return this.each(function () {

                var self = this;//该元素本身
                var $this = $(self).empty();//JQ对象

                //分页条实体
                var pagenationer = function (opts) {
                    this.page_cur = opts.page_current;//一开始的页面，从1开始
                    this.page_total = opts.page_total;//总共的页数
                    this.page_step = opts.page_step;//步长
                    this.buttonClickCallback = opts.buttonClickCallback;//回调方法
                    this.code = '';//内部的html代码
                };
                //定义pagenationer的方法
                pagenationer.prototype = {
                    //获取导航条的变量
                    getvariable: function (variable) {
                        switch (variable) {
                            case 'page_cur':
                                return this.page_cur;
                                break;
                            case 'page_total':
                                return this.page_total;
                                break;
                            default:
                                return null;
                        }
                    },
                    //更新变量
                    updateVariable: function (opts) {
                        if (opts.page_current)this.page_cur = opts.page_current;//现在的页面
                        if (opts.page_total)this.page_total = opts.page_total;//总共的页数
                        if (opts.page_step)this.page_step = opts.page_step;//步长
                        if (opts.buttonClickCallback)this.buttonClickCallback = opts.buttonClickCallback;//回调方法
                        this.code = '';//内部的html代码
                        this.Start();
                    },
                    //回调函数
                    clickCallback: function (page) {
                        this.buttonClickCallback && this.buttonClickCallback(page, $this);
                    },
                    //构建页码，从s到f-1页
                    Add: function (s, f) {
                        for (var i = s; i < f; i++) {
                            this.code += '<a>' + i + '</a>';
                        }
                    },

                    //添加末尾
                    Last: function () {
                        this.code += '<i>...</i><a>' + this.page_total + '</a>';
                    },

                    //添加开头
                    First: function () {
                        this.code += '<a>1</a><i>...</i>';
                    },

                    //上一页按钮被点击
                    PreClick: function () {
                        this.page_cur--;
                        if (this.page_cur < 1) {
                            //这种情况正好是第1页，按上一页无动于衷
                            this.page_cur = 1;
                        }else
                        {
                            this.Start();
                            this.clickCallback(this.page_cur);
                            this.debugresult('' + this.page_cur);
                        }
                    },

                    //下一页按钮被点击
                    NextClick: function () {
                        this.page_cur++;
                        if (this.page_cur > this.page_total) {
                            //这种情况正好是最后一页，按下一页无动于衷
                            this.page_cur = this.page_total;
                        }else{
                            this.Start();
                            this.clickCallback(this.page_cur);
                            this.debugresult('' + this.page_cur);
                        }
                    },

                    //为按钮绑定事件
                    Bind: function () {
                        var curpage = this.page_cur;
                        container.find('a').each(function () {
                            var that = this;
                            if (that.innerHTML == curpage)
                                that.className = 'current';
                            $(that).click(Click);
                        });
                    },
                    //写入分页条
                    Finish: function () {
                        container.empty();
                        container.html(this.code);
                        this.code = '';
                        this.Bind();
                    },

                    //开始函数,更新函数
                    Start: function () {
                        var page_total = this.page_total;
                        var page_step = this.page_step;
                        var page_cur = this.page_cur;
                        if (page_total < page_step * 2 + 6) {//能全部显示的情况
                            this.Add(1, page_total + 1);
                        }
                        else if (page_cur < page_step * 2 + 1) {//拉到最前头的情况
                            this.Add(1, page_step * 2 + 4);
                            this.Last();
                        }
                        else if (page_cur > page_total - page_step * 2) {//拉到最后头的情况
                            this.First();
                            this.Add(page_total - page_step * 2 - 2, page_total + 1);
                        }
                        else {//当前页数在中间的情况
                            this.First();
                            this.Add(page_cur - page_step, page_cur + page_step + 1);
                            this.Last();
                        }
                        this.Finish();
                    },

                    //输出调试信息
                    debugresult: function (str) {
                        if (isdebug) {
                            debugdiv.html(str);
                        }
                    }
                };
                //新建对象
                var myPagenationer = new pagenationer(opts);

                //上一页按钮被点击
                var PreClick = function () {
                    myPagenationer.PreClick.apply(myPagenationer);
                };

                //下一页按钮被点击
                var NextClick = function () {
                    myPagenationer.NextClick.apply(myPagenationer);
                };

                //分页被点击
                var Click = function () {
                    //this代表的是被点击的元素
                    myPagenationer.page_cur = +this.innerHTML;
                    myPagenationer.Start();
                    myPagenationer.clickCallback(myPagenationer.page_cur);
                    myPagenationer.debugresult('' + myPagenationer.page_cur);
                };

                //添加基本的内容物
                var button_pre = $('<a>上一页</a>');
                var button_next = $('<a>下一页</a>');
                var container = $('<span>asdasd</span>');
                $this.append(button_pre);
                $this.append(container);
                $this.append(button_next);

                //为上一页和下一页按钮添加点击事件
                button_pre.click(PreClick);
                button_next.click(NextClick);
                myPagenationer.Start();

                //处于debug模式就把结果显示在div上
                if (isdebug) {
                    var debugdiv = $("<div></div>");
                    $this.append(debugdiv);
                }
                //绑定数据
                $this.data("pager", myPagenationer);
            });
        },
        /**
         * 重新设置某些参数
         * @param settings
         */
        settings: function (settings) {
            var pager = this.data('pager');
            pager.updateVariable(settings);
        },
        /**
         * 获得某option的值
         * @param variable option的名字
         */
        getvar: function (variable) {
            var pager = this.data('pager');
            pager.getvariable(variable);
        },
        /**
         * 主动点击某一页
         */
        click: function (page) {
            var pager = this.data('pager');
            pager.clickCallback(page);
        },
        /**
         * 重新点击当前页
         */
        refresh: function () {
            var pager = this.data('pager');
            pager.clickCallback(pager.page_cur);
        }
    };

    $.fn.paging = function () {
        //arguments[0]是传进来的第一个参数
        var method = arguments[0];

        if (methods[method]) {
            method = methods[method];
            arguments = Array.prototype.slice.call(arguments, 1);
        } else if (typeof(method) == 'object' || !method) {
            method = methods.init;
        } else {
            $.error('方法 ' + method + ' 并不存在于插件中！');
            return this;
        }

        //调用method方法，用this和arguments
        return method.apply(this, arguments);
    };

    //默认参数
    $.fn.paging.defaults = {
        page_total: 10,//总页数
        page_current: 1,//开始页面
        page_step: 3//步长
    };

})(jQuery);
