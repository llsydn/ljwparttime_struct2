(function ($) {
    var methods = {
        init: function (callback) {
            return this.each(function () {

                var self = this;//该元素本身
                var $this = $(self);//JQ对象

                function appear(event) {
                    var win = $(window);
                    var scrollTop = win.scrollTop();
                    var clientHeight = win.height();
                    var offect = $this.offset();
                    if (scrollTop + clientHeight > offect.top) {
                        //$this.trigger("onAppear", 1000, 20);
                        callback(event);
                        $(window).off("scroll", appear);
                        //if (!one) {
                        //    one = true;
                        //}
                    }
                }

                if($this.offset().top<$(window).height()){
                	//直接显示
                	callback();
                }else{
                	//说明可能有滚动条，注册滚动事件
                	$(window).on("scroll", {}, appear);
                }

            });
        },
        settings: function (settings) {
            //var pager=this.data('pager');
        }
    };

    $.fn.onAppear = function () {
        //arguments[0]是传进来的第一个参数
        var first_arg = arguments[0];
        var method;

        if (!first_arg || typeof(first_arg) == 'function') {
            method = methods.init;
        } else if (methods[first_arg]) {
            method = methods[first_arg];
            arguments = Array.prototype.slice.call(arguments, 1);
        } else {
            $.error('方法 ' + first_arg + ' 并不存在于插件中！');
            return this;
        }

        //调用method方法，用this和arguments
        return method.apply(this, arguments);
    };

})(jQuery);
