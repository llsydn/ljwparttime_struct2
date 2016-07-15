/**
 * 供显示评论页面的js
 */

/**
 * 文本框插入信息的插件
 */
(function ($) {
    $.fn.insertContent = function (myValue, t) {

        var $t = $(this)[0];

        if (document.selection) { //ie
            this.focus();
            var sel = document.selection.createRange();
            sel.text = myValue;
            this.focus();
            sel.moveStart('character', -l);
            var wee = sel.text.length;
            if (arguments.length == 2) {
                var l = $t.value.length;
                sel.moveEnd("character", wee + t);
                t <= 0 ? sel.moveStart("character", wee - 2 * t - myValue.length) : sel.moveStart("character", wee - t - myValue.length);

                sel.select();
            }
        } else if ($t.selectionStart || $t.selectionStart == '0') {
            var startPos = $t.selectionStart;

            var endPos = $t.selectionEnd;
            var scrollTop = $t.scrollTop;
            $t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
            this.focus();
            $t.selectionStart = startPos + myValue.length;
            $t.selectionEnd = startPos + myValue.length;
            $t.scrollTop = scrollTop;
            if (arguments.length == 2) {

                $t.setSelectionRange(startPos - t, $t.selectionEnd + t);
                this.focus();
            }
        }
        else {
            this.value += myValue;
            this.focus();
        }
    };
})(jQuery);


$(document).ready(function () {
    var comic_comment = $('.comic_comment');//评论区的总div
    var comment_list = $('#comment_list');//评论区的ul
    var movavle_PostBox = new Create_post_box("reply");//回复的评论框

    var g_comment_page = 1;//当前评论分页页码
    var g_page = {
        //每一页评论数
        pageSize: 0,
        //评论总数
        total: 0,
        //页总数
        pagaTotal: 0
    };

    //评论的分页条
    var pagination = $('#pagination');
    var pagination2 = $('#pagination2');


    //创建评论回复框
    function Create_post_box1(type) {
        //废弃
        var mainDiv = $('<div class="dcmp_content" style="margin-top: 20px;display: none">');

        var faceDiv = $(['<div class="user_face">',
            '<img class="face_avatar" src="">',
            '</div>'].join("")).appendTo(mainDiv);

        var biaoqingDiv = $(['<div class="dcmp_post">',
            '<div class="ywz-wrapper" style="position: relative;">',
            '<div class="biaoqing_box">',
            '<a>(⌒▽⌒)</a><a>（￣▽￣）</a><a>(=・ω・=)</a><a>(｀・ω・´)</a><a>(〜￣△￣)〜</a><a>(･∀･)</a><a>(°∀°)ﾉ</a><a>(￣3￣)</a><a>╮(￣▽￣)╭</a><a>(',
            '´_ゝ｀)</a><a>←_←</a><a>→_→</a><a>(&lt;_&lt;)</a><a>(&gt;_&gt;)</a><a>(;¬_¬)</a><a>("▔□▔)/</a><a>(ﾟДﾟ≡ﾟдﾟ)!?</a><a>Σ(ﾟдﾟ;)</a><a>Σ(',
            '￣□￣||)</a><a>(´；ω；`)</a><a>（/TДT)/</a><a>(^・ω・^',
            ')</a><a>(｡･ω･｡)</a><a>(●￣(ｴ)￣●)</a><a>ε=ε=(ノ≧∇≦)ノ</a><a>(´･_･`)</a><a>(-_-#)</a><a>（￣へ￣）</a><a>(￣ε(#￣)',
            'Σ</a><a>ヽ(`Д´)ﾉ</a><a>(╯°口°)╯(┴—┴</a><a>（#-_-)┯━┯</a><a>_(:3」∠)_</a><a>(笑)</a><a>(汗)</a><a>(泣)</a><a>(苦笑)</a>',
            '</div>',
            '<a class="ywz">(・ω・) 颜文字</a></div>',
            '<div class="dcmp_userinfo"></div>',
            '</div>'].join("")
        );

        var textarea_container = $(['<div id="dcmp_textarea_container" class="dcmp-textarea-container">',
            '<textarea cols="80" name="msg" rows="5" id="comment_text" placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。" class="ipt-txt"></textarea>',
            '<button type="submit" class="b-btn submit-comment">发表评论</button>',
            '</div>'].join("")).append(biaoqingDiv).appendTo(mainDiv);


    }

    function Create_post_box(type) {
        var textHtml = ['    <div class="dcmp_content" style="margin-top: 20px">',
            '        <div class="user_face">',
            '            <img class="face_avatar" src="">',
            '        </div>',
            '        <div id="dcmp_textarea_container" class="dcmp-textarea-container">',
            '            <textarea cols="80" name="msg" rows="5" id="comment_text"',
            '                      placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。"',
            '                      class="ipt-txt"></textarea>',
            '            <button type="submit" class="b-btn submit-comment">发表评论</button>',
            '            <div class="dcmp_post">',
            '                <div class="ywz-wrapper" style="position: relative;">',
            '                    <div class="biaoqing_box">',
            '                        <a>(⌒▽⌒)</a><a>（￣▽￣）</a><a>(=・ω・=)</a><a>(｀・ω・´)</a><a>(〜￣△￣)〜</a><a>(･∀･)</a><a>(°∀°)ﾉ</a><a>(￣3￣)</a><a>╮(￣▽￣)╭</a><a>(',
            '´_ゝ｀)</a><a>←_←</a><a>→_→</a><a>(&lt;_&lt;)</a><a>(&gt;_&gt;)</a><a>(;¬_¬)</a><a>("▔□▔)/</a><a>(ﾟДﾟ≡ﾟдﾟ)!?</a><a>Σ(ﾟдﾟ;)</a><a>Σ(',
            '￣□￣||)</a><a>(´；ω；`)</a><a>（/TДT)/</a><a>(^・ω・^',
            ')</a><a>(｡･ω･｡)</a><a>(●￣(ｴ)￣●)</a><a>ε=ε=(ノ≧∇≦)ノ</a><a>(´･_･`)</a><a>(-_-#)</a><a>（￣へ￣）</a><a>(￣ε(#￣)',
            'Σ</a><a>ヽ(`Д´)ﾉ</a><a>(╯°口°)╯(┴—┴</a><a>（#-_-)┯━┯</a><a>_(:3」∠)_</a><a>(笑)</a><a>(汗)</a><a>(泣)</a><a>(苦笑)</a>',
            '                    </div>',
            '                    <a class="ywz">(・ω・) 颜文字</a></div>',
            '                <div class="dcmp_userinfo"></div>',
            '            </div>',
            '            <div id="textarea_size_tester"></div>',
            '        </div>',
            '    </div>'].join("");

        var _this = this;

        var doms = $($.parseHTML(textHtml)[1]);

        //输入框
        var textarea = doms.find("textarea");

        //头像
        doms.find("img.face_avatar").attr("src", getFaceURL());

        //表情框
        var biaoqing_box = doms.find("div.biaoqing_box");
        biaoqing_box.find("a").click(function () {
            textarea.insertContent($(this).text());
            biaoqing_box.toggle();
        });

        //表情按钮
        doms.find("a.ywz").click(function () {
            biaoqing_box.toggle();
        });

        //发布按钮
        var fabu = doms.find("button.b-btn");
        fabu.attr("cid", 0);//绑定默认的评论id
        fabu.click(fabuclick);

        //点击事件
        function fabuclick() {
            if (isLogin()) {
                if (textarea.val().length < 5) {
                    openDialog(textarea,"评论字数太少了……" );
                    return;
                }
                var commentId = fabu.attr("cid");
                var data = {
                    content: $.trim(textarea.val()),
                    mid: g_message_id,//这个是全局变量
                    cid: commentId,
                    type: type
                };
                postComment(data, function (data) {//成功回调
                    textarea.val("");
                    //在被清空之前先移动到其它地方
                    movavle_PostBox.doms.hide().appendTo($('body'));
                    if (type == "reply") {
                        //如果是回复某人的情况
                        replyMoudle.getFirstPage(commentId, _this.parent);//_this.parent是这个发布评论框的现在所属的li
                        //commentMoudle.getPageComment(g_comment_page);
                    } else {
                        commentMoudle.init();
                    }
                    //getPageComment(1);//获取第一页评论
                }, function () {
                    //失败回调
                })
            }
            else {
                window.location.href = contextPath + "/index.jsp";
            }

        }

        //没有登录的情况
        if (!isLogin()) {
            //用户没有登录
            fabu.text("去登录");
            //记录登陆前页面
            $.cookie('before_login', window.location.href, {expires: 60 * 60 * 24 * 30});
            textarea.attr("placeholder", "填写评论前先登录哦");
        }

        this.textarea = textarea;
        this.doms = doms;
        this.fabu = fabu;
        //return doms;
    }

    Create_post_box.prototype.setParent = function (parent) {
        this.parent = parent;
    };


    /**
     * ajax请求评论
     * @param data
     * @param callback
     */
    function myAjax(url,data, callback) {
        $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
            timeout: 3000,
            data: data,
            success: function (data, textStatus) {
                callback(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest + textStatus + errorThrown);
            }
        });
    }

    /**
     * ajax发布评论
     * @param data
     * @param succCallback
     * @param errorCallBack
     */
    function postComment(data, succCallback, errorCallBack) {
        $.ajax({
            url: "addcomment",
            type: "POST",
            datatype: "json",
            timeout: 3000,
            data: data,
            success: function (rdata, textStatus) {
                succCallback && succCallback(rdata);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                errorCallBack && errorCallBack();
            }
        });
    }

    //翻译json显示评论和回复
    var parseMoudle = {
        /**
         * 处理回复
         */
        handleReply: function (comment_li, replys) {
            var maindiv = $('<div id="reply_main"></div>').addClass("reply").appendTo(comment_li);
            var ul = $('<ul></ul>').appendTo(maindiv);
            //遍历回复
            $.each(replys, function (n, reply) {
                //
                var li = $('<li></li>');

                //添加头像
                var faceUrl = reply.user.imageurl;
                faceUrl = faceUrl != "" ? contextPath + faceUrl : contextPath + "/img/touxiang_default.gif";
               
                var img = $('<img />').attr("src", faceUrl);
                li.append(img);

                //名字
                var name = reply.user.username;
                var content = reply.content;
                var infodiv1 = $("<div></div>");
                $("<span></span>").text(name + ":").appendTo(infodiv1);
                $("<span class='content'></span>").text(content).appendTo(infodiv1);
                li.append(infodiv1);

                //时间
                var time = reply.time;
                var infodiv2 = $("<div></div>");
                var p = $('<p></p>').appendTo(infodiv2);
                $("<span class='comment_time'></span>").text(time).appendTo(p);

                //回复按钮
                var btn_reply = $("<i class='report'><a href='javascript:;' class='huifu'>回复</a></i>").appendTo(p);
                btn_reply.click(function () {
                	replyMoudle.replyClick(comment_li, name);//调用replyClick
                });
                li.append(infodiv2);


                //
                ul.append(li);
            });

        },
        /**
         * 处理评论
         * @param comments
         * @param page
         */
        handleComments: function (comments) {
            var floor = g_page.total - g_page.pageSize * (g_comment_page - 1);//楼层号码
            comment_list.empty();//清空ul里的所有li
            $.each(comments, function (n, comment) {

                //comment代表每一个评论
                var li = $('<li></li>').addClass("main-floor");
                li.attr("cid", comment.id);

                //添加头像
                var faceUrl = comment.user.imageurl;                                     
                faceUrl = faceUrl != null ? contextPath + faceUrl : contextPath + "/img/touxiang_default.gif";
                var faceImg = $('<img />').attr("src", faceUrl);
                var faceDiv = $('<div></div>').addClass("facebox").append(faceImg);
                li.append(faceDiv);

                //名字
                var name = comment.user.username;
                $("<div><span class='uname'>" + name + "</span></div>").appendTo(li);

                //内容
                var content = comment.content;
                $("<div class='content'></div>").text(content).appendTo(li);

                //时间
                var time = comment.time;
                var info_div = $('<div class="comment_time"></div>');

                //楼层
                $('<span></span>').text("#" + floor + "      ").appendTo(info_div);
                $('<span></span>').text(time).appendTo(info_div);

                //回复按钮
                var btn_reply = $("<i class='report'><a href='javascript:;' class='huifu'>回复</a></i>").appendTo(info_div);
                btn_reply.click(function () {
                    replyMoudle.replyClick(li, name);//回复xxx被点击
                });
                li.append(info_div);

                //回复部分
                var rp = comment.replyPage;
                if (rp.total > 0) {
                    //遍历创建回复，前提是有回复
                    parseMoudle.handleReply(li, comment.replys);
                }
                //检测并检测分页条
                replyMoudle.createReplyPagination(rp, comment.id, li);

                //li正式加入总ul
                comment_list.append(li);
                //楼层数+1
                floor--;
            });
        }
    };

    var replyMoudle = {
        /**
         * 当回复xxx按钮被点击
         * @param li 评论list中的ul li
         * @param username li中用户名字
         */
        replyClick: function (li, username) {
            if (movavle_PostBox.parent && movavle_PostBox.parent == li) {//如果当前的回复位置没有变
                movavle_PostBox.doms.toggle();//隐藏显示元素
            } else {
                //移动元素到新点击的li
                movavle_PostBox.setParent(li);
                movavle_PostBox.fabu.attr("cid", li.attr("cid"));//发布按钮绑定当前评论的cid

                movavle_PostBox.doms.show();
                li.append(movavle_PostBox.doms);
                movavle_PostBox.textarea.insertContent("@" + username + " :");//添加默认文字
            }
        },
        /**
         * 创建回复的分页条,默认页为第一页
         * @param rp 分页
         * @param cid 评论id
         * @param li 装评论的li
         */
        createReplyPagination: function (rp, cid, li) {
            //分页大于1，必须要分页条
            if (rp.pagaTotal > 1) {
                var pagination = $('<div class="page"></div>').appendTo(li).paging({
                    page_total: rp.pagaTotal,// 总页数
                    page_current: 1,// 开始页面
                    page_step: 1,// 步长
                    buttonClickCallback: function (page) {
                        replyMoudle.onPageClick(page, cid, li, pagination);
                    }
                });
            }
        },
        /**
         * 获得第一页的回复，刷新用
         */
        getFirstPage: function (cid, li) {
            //评论的li
        	var url="refreshreply";
            var data =
            {
                cid: cid//评论id
            };
            myAjax(url,data, function (data) {
                //回调函数
            	li.find("#reply_main").remove();//评论中的回复清空
            	li.find(".page").remove();//评论中的回复分页条清空
            	
                parseMoudle.handleReply(li, data.replies2);//重新创建回复
                replyMoudle.createReplyPagination(data.replyPage, cid, li);//创建分页条
                movavle_PostBox.doms.show().appendTo(li);
            });
        },
        //回复的分页被点击
        onPageClick: function (page, cid, li, pagination) {
        	var url="replys";
            //评论的li
            var data =
            {
                cid: cid,//评论id
                page: page//页面
            };
            myAjax(url,data, function (data) {
                li.find("#reply_main").remove();
                //回调函数
                parseMoudle.handleReply(li, data);//重新创建回复
                li.find("#reply_main").after(pagination);//分页条放在后面
            });
        }
    };

    //评论模块
    var commentMoudle = {
        /**
         * 获得某一页的评论list
         * @param page y
         */
        getPageComment: function (page) {
        	var url="commentlist";
            var data =
            {
            	message_id: g_message_id,
                page: page
            };
            myAjax(url,data, parseMoudle.handleComments);
        },
        /**
         * 去获取总的评论页数
         */
        getComentPageCount: function (callback) {
        	var url="commentpage";
            var data =
            {
                message_id: g_message_id
            };
            myAjax(url,data, this.onPageTotalGet);
        },
        /**
         * 是否已经创建第二个发布框
         */
        haveCreateSecondBox:false,
        /**
         * 获取完成评论页数
         */
        onPageTotalGet: function (data) {
            g_page = data;
            //一共有多少页，服务器0条记录返回0页，一条记录也返回1页
            var pageTotal = g_page.pagaTotal;
            var createSecondBox = true;
            if (pageTotal > 1) {
                //分页条初始化
                var setting = {
                    page_total: pageTotal,// 总页数
                    page_current: g_comment_page,// 开始页面
                    page_step: 1,// 步长
                    buttonClickCallback: function (page, ele) {
                        var pid = ele.data("pid");
                        //分页条同步
                        if (pid == 1) {
                            pagination2.paging("settings", {page_current: page});
                        } else if (pid == 2) {
                            pagination.paging("settings", {page_current: page});
                        }
                        commentMoudle.onPageClick(page);
                    }
                };
                //两个分页条
                pagination.paging(setting).data("pid", 1);
                pagination2.paging(setting).data("pid", 2);
            } else if (pageTotal == 1) {
                //页数为1页
                if (data.total < 5) {//再判断有多少条
                	createSecondBox = false;
                }
            } else if (pageTotal == 0) {
                //一条评论都没有的情况
            	createSecondBox = false;
            }

            if (createSecondBox && !this.haveCreateSecondBox) {
                //分页条后面加个评论发布框
                pagination.after(new Create_post_box("comment").doms);
                this.haveCreateSecondBox=true;
            }

            //去请求当前页的评论
            commentMoudle.getPageComment(g_comment_page);
        },
        /**
         * 分页被点击
         * @param page
         */
        onPageClick: function (page) {
            g_comment_page = page;
            commentMoudle.getPageComment(page);
        },
        init: function () {
            //初始化
            this.getComentPageCount();
        }
    };

    /**
     * 初次显示评论区
     * 当评论区出现，先加载第一页数据
     */
    comic_comment.onAppear(function () {

        //评论区总div前加个发布评论框
        comic_comment.prepend(new Create_post_box("comment").doms);


        commentMoudle.init();
        //getPageComment(1);//获取第一页评论
    });
   
});


