<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="head.jsp"/>

<%--地区选择style--%>
<style>
    dl, dt, dd {
        list-style: none;
        float: left;
    }

    .thRelative {
        position: relative;
        left: 0;
        top: 0;
    }

    .lineSearch {
        width: auto;
        position: relative;
    }

    .lineSearch .boxSearch, .lineSearch .boxSearchHover {
        position: relative;
        width: 300px;
        padding-left: 7px;
        color: #777;
        height: 31px;
        border: 1px solid #dbdbdb;
        margin-right: 8px;
        line-height: 31px;
        cursor: pointer;
    }

    .search_form_suggest {
        border: 1px solid #FBD8A1;
        position: absolute;
        left: 0;
        z-index: 978;
        width: 308px;
        background: #fff;
    }

    .search_form_suggest h3 {
        font-size: 12px;
        font-weight: normal;
        height: 20px;
        line-height: 20px;
        padding: 0 0 5px 10px;
        color: #ff6f00;
        border-bottom: 1px solid #e6e6e6;
        margin-bottom: 4px;
    }

    .clear {
        clear: both;
    }

    .select_city_box {
        background: #FBFBFB;
        border-top: 1px solid #E5E5E5;
        border-bottom: 1px solid #E5E5E5;
        padding: 13px 3px;
    }

    .thLeft {
        float: left;
    }

    .tab_select dl {
        padding: 5px 0;
    }

    .tab_select dt {
        width: 46px;
        background: #FE984F;
        font: bold 12px/22px Tahoma, Geneva, sans-serif;
        color: #fff;
        text-align: center;
        margin-left: 5px;
    }

    .tab_select dd {
        line-height: 22px;
        width: 317px;
        _width: 310px;
    }

    .ico {
        background: url(${pageContext.request.contextPath}/img/house.png) no-repeat;
    }

    a:link, a:visited {
        color: #0fa7ff;
        text-decoration: none;
        outline: none;
        cursor: pointer;
    }

    .tab_select dd a {
        color: #888;
        margin-left: 10px;
        display: inline-block;
    }

    .select_city_box span {
        padding: 0 17px;
        color: #888;
    }

    button, input {
        background: #fff;
        border: none;
    }

    .select_city_box .input_city {
        width: 180px;
        border: 1px solid #C1C1C1;
        background: #FFF;
        padding: 5px 8px;
        font: 12px/14px Arial, Helvetica, sans-serif;
        vertical-align: middle;
    }

    .search_city_result {
        line-height: 24px;
        margin: 10px 0 -5px 108px;
        height: 24px;
    }

    .search_hotList dd {
        line-height: 25px;
        padding-bottom: 2px;
    }

    .search_hotList dd a {
        color: #777;
        margin-right: 12px;
        word-break: break-all;
        white-space: nowrap;
        display: inline-block;
    }

    .thRight {
        float: right;
    }

    .btn_close {
        cursor: pointer;
        background-position: 0 -1px;
        width: 16px;
        height: 16px;
        text-indent: -9999px;
        overflow: hidden;
        _text-indent: 0;
        _font-size: 0;
        _line-height: 0;
    }

    .boxSearch .key_word {
        position: absolute;
        top: 5px;
        line-height: 22px;
        color: #777;
    }

    .boxSearch .ico_shBlue {
        margin-top: 7px;
        width: 12px;
        height: 17px;
        display: inline-block;
        background-position: left -165px;
    }

    .boxSearch .btn_search, .boxSearch .btn_search_current {
        border-left: 1px solid #dbdbdb;
        width: 30px;
        text-align: center;
        font-family: sans-serif
    }

    .size_14 {
        font-size: 14px;
    }
</style>

<%--主要style--%>
<style>
    /*总div*/
    .modify {
        margin: 0 auto;
        width: 700px;
    }

    /*输入框*/
    .modify input {
        border: 1px solid;
        text-align: left;
        color: rgb(0, 0, 0);
        line-height: 22px;
        font-size: 19px;
        font-family: \u9ED1\u4F53, sans-serif;
        border-radius: 5px;
        padding: 0;
        margin: 10px;
        outline:medium;
    }
    /*label*/
    .modify label {
        display: inline-block;
        width: 100px;
    }

    .line {
        border: 1px solid #abcdef;
        width: auto;
        height: 1px
    }

    /*按钮*/
    .modify .abutton {
        border: 2px solid rgb(168, 214, 0);
        font-family: \u9ED1\u4F53, sans-serif;
        font-size: 18px;
        line-height: 48px;
        -webkit-text-stroke-width: 0px;
        -webkit-box-shadow: rgba(0, 0, 0, 0) 0 0 0 0;
        -moz-box-shadow: rgba(0, 0, 0, 0) 0 0 0 0;
        box-shadow: rgba(0, 0, 0, 0) 0 0 0 0;
        -webkit-border-radius: 9px;
        -moz-border-radius: 9px;
        border-radius: 9px;
        margin: 0;
        padding: 4px 13px;
        background-color: rgb(204, 197, 143);
    }

    /*错误显示*/
    .modify .error {
        display: none;
        font-family: \u9ED1\u4F53, sans-serif;
        font-size: 18px;
        line-height: 41px;
        color: rgb(182, 114, 237);
        background: url(${pageContext.request.contextPath}/img/error.png) no-repeat 0 44%;
        padding: 0 0 0 30px;
    }
</style>


<div id="mainDiv" class="modify">
    <%--part1--%>
    <div>
        <div>
            <label for="company">
                	商家名称：
            </label>
            <input type="text" id="company" name="company" value="${business.name}">
        </div>
        <div>
            <label for="phone">
               	 电话：
            </label>
            <input type="text" id="phone" name="phone" value="${business.phone}">
        </div>
        <div>
            <label for="email">
                	邮箱：
            </label>
            <input type="text" id="email" name="email" value="${business.email}">
        </div>
        <div>
            <label>
                	地址：
            </label>
            <%--地区选择--%>
            <div class="lineSearch">
                <div class="boxSearch">
          <span class="key_word">
           		 广东省中山市
               <b id="city_name" class="size_14">${business.address}</b>
          </span>
                    <a id="city_dropdown" class="thRight ico btn_search" href="javascript:void(0)">︾</a>
                </div>

                <div id="city_droplist" class="search_form_suggest" style="display: none;">
                    <h3>热门地区</h3>
                    <dl class="search_hotList">
                        <dd class="clr_after">
                            <a href="#city_name">中山港街道</a>
                            <a href="#city_name">中区街道</a>
                            <a href="#city_name">东区街道</a>
                            <a href="#city_name">南区街道</a>
                            <a href="#city_name">西区街道</a>
                            <a href="#city_name">郊区街道</a>
                            <a href="#city_name">环城区街道</a>
                            <a href="#city_name">岐江区街道</a>
                            <a href="#city_name">莲峰区街道</a>
                            <a href="#city_name">三乡镇</a>
                            <a href="#city_name">烟墩区街道</a>
                            <a href="#city_name">三角镇</a>
                            <a href="#city_name">大涌镇</a>
                            <a href="#city_name">小榄镇</a>
                            <a href="#city_name">五桂山镇</a>
                            <a href="#city_name">古镇镇</a>
                            <a href="#city_name">东凤镇</a>
                            <a href="#city_name">东升镇</a>
                            <a href="#city_name">民众镇</a>
                            <a href="#city_name">沙朗镇</a>
                            <a href="#city_name">沙溪镇</a>
                            <a href="#city_name">坦洲镇</a>
                            <a href="#city_name">坦背镇</a>
                            <a href="#city_name">板芙镇</a>
                            <a href="#city_name">阜沙镇</a>
                            <a href="#city_name">神湾镇</a>
                            <a href="#city_name">南头镇</a>
                            <a href="#city_name">南朗镇</a>
                            <a href="#city_name">浪网镇</a>
                            <a href="#city_name">黄圃镇</a>
                            <a href="#city_name">港口镇</a>
                            <a href="#city_name">翠亨村镇</a>
                            <a href="#city_name">横门镇</a>
                            <a href="#city_name">横栏镇</a>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
        <div><a class="abutton" id="saveSettings">保存设置</a></div>
    </div>
    <hr class="line"/>

    <%--part2--%>
    <div>
        <label for="description">简介</label>
        <textarea id="description" style="height: 120px;width: 550px">${business.description}</textarea>
    </div>
    <div><a class="abutton" id="submit_description">保存简介</a></div>
    <hr class="line"/>

    <%--part3--%>
    <div>
        <div>
            <label for="pwd">
               	 原密码：
            </label>
            <input type="password" id="pwd" name="pwd">
        </div>
        <div>
            <label for="newpwd">
              	  新密码：
            </label>
            <input type="password" id="newpwd" name="newpwd">
        </div>
        <div>
            <label for="newpwd2">
                	确认密码：
            </label>
            <input type="password" id="newpwd2" name="newpwd2">
        </div>
        <div><a class="abutton" id="resetPassword">重设密码</a><a class="abutton" id="forgetPassword">忘记密码？</a></div>
    </div>
    <hr class="line"/>

    <%--part4--%>
    <input type="file" id="upload-file" name="file" value="选择图片" accept=".jpg,.jpeg,.png">
    <input type="button" id="uploadbtn" value="上传">
    <div id="divProgressbar"></div>

    <%--头像裁剪部分--%>
    <div class="portrait_left">
        <div id="picture"
             style="border: 1px solid #000000;overflow: hidden;position: relative;height: auto;width: 280px;margin: 0 auto;">
            <s:if test='#session.business.pic!=""'>
                <img id="avatar" style="width: 280px;" alt="请上传logo"
                     src="${pageContext.request.contextPath}/upload/business/<s:property value="#session.business.pic" />">
            </s:if>
            <s:else>
                <img id="avatar" style="width: 280px;" alt="请上传logo"
                     src="${pageContext.request.contextPath}/img/house.png">
            </s:else>
        </div>
        <div class="portrait_revolve">
            <div class="revolve_left"></div>
            <a href="javascript:;" class="revol_left_txt" onClick="avatarrotateleft();">向左旋转</a>
            <a href="javascript:;" class="revol_right_txt" onClick="avatarrotateright();">向右旋转</a>
            <div class="revolve_right"></div>
        </div>
        <div class="setup_but">
            <button class="baseinf_but1" id="saveLogo">保存</button>
        </div>
    </div>

    <div class="portrait_right">
        <p class="portrait_right_txt">您上传的头像会自动生成小尺寸头像，请注意小尺寸的头像是否清晰</p>
        <div class="portrait_right_bottom">
            <div class="portrait1">
                <div id="img_big_preview" class="img_preview">

                    <s:if test='#session.business.pic!=""'>
                        <img id="avatar1" alt="头像预览"
                             src="${pageContext.request.contextPath}/upload/business/${business.pic}"
                             style="width: 360px; height: 360px; margin-left: -117px; margin-top: -44px;">
                    </s:if>
                    <s:else>
                        <img id="avatar1" alt="头像预览" src="${pageContext.request.contextPath}/img/house.png"
                             style="width: 360px; height: 360px; margin-left: -117px; margin-top: -44px;">
                    </s:else>

                </div>
                <p>大尺寸头像，180×180</p>
            </div>
        </div>
        <div class="portrait2">
            <div id="img_small_preview" class="img_preview">

                <s:if test='#session.business.pic!=""'>
                    <img id="avatar2" alt="预览" src="${pageContext.request.contextPath}/upload/business/${business.pic}"
                         style="width: 98px; height: 98px; margin-left: -32px; margin-top: -12px;">
                </s:if>
                <s:else>
                    <img id="avatar2" alt="预览" src="${pageContext.request.contextPath}/img/house.png"
                         style="width: 98px; height: 98px; margin-left: -32px; margin-top: -12px;">
                </s:else>

            </div>
            <p>中尺寸头像</p>
            <p>50×50</p>
        </div>
    </div>
</div>

<%--<img src="${pageContext.request.contextPath}/img/house.png" alt="商家logo" id="logo"--%>
<%--style="width: 180px;height: 180px;">--%>


<%--页面的主要js代码--%>
<script type="text/javascript">
    //全局的一些信息
    var _init_phone = "${business.phone}";//初始电话
    var _init_email = '${business.email}';//初始邮件
    var _init_company = '${business.name}';//初始名字
</script>
<script type="text/javascript">

    //显示错误
    function showerror(ele, text) {
        var errorEle = ele.nextAll('span.error');
        errorEle.slideDown(1000);
        errorEle.text(text);
        ele.attr("error", true);
    }

    //隐藏错误提示
    function hiderror(ele) {
        ele.nextAll('span.error').slideUp(1000);
        ele.attr("error", false);//标志该字段是否通过验证
    }

    //检测账户是否存在
    function ajaxCheckAccount($ele) {
        var value = $ele.val();
        $.ajax({
            url: "businessreg",
            type: "POST",
            datatype: "json",
            timeout: 3000,
            data: {
                type: "check",
                account: value
            },
            success: function (data, textStatus) {
                if (data.success) {
                    hiderror($ele);
                } else {
                    showerror($ele, data.msg);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest + textStatus + errorThrown);
            }
        });
    }

    $(document).ready(function () {
        var maindiv = $('#mainDiv');
        //为每一个input控件创建错误提示
        maindiv.find('input').each(function () {
            $(this).after($('<span class="error">有错误</span>'));
            $(this).attr("error", false);//标志该字段是否通过验证
        });

        //设置当前激活的导航按钮
        $('#nav_modify').addClass('active');
        //一开始就触发一次离开函数，以便归位
        $('div.n-left').mouseleave();

        var $phone = $('#phone');//电话
        $phone.blur(function () {//手机验证
            var value = $phone.val();
            var tel = /^[1][358][0-9]{9}$/;
            if (value.length == 0 || !tel.test(value)) {
                showerror($phone, "请输入正确的手机号");
                return;
            } else {
                hiderror($phone);
            }
            if (value != _init_phone) {
                ajaxCheckAccount($phone);//不等于初始值就ajax判断
            }
        });

        var $email = $('#email');//邮箱加验证
        $email.blur(function () {
            var value = $email.val();
            var tel = /\w@\w*\.\w/;
            if (value.length == 0 || !tel.test(value)) {
                showerror($email, "请输入正确的邮箱");
                return;
            } else {
                hiderror($email);
            }
            if (value != _init_email) {
                ajaxCheckAccount($email);//不等于初始值就ajax判断
            }
        });
        //邮箱自动填充完整，需要jquery的ui的css
        $email.autocomplete({
            delay: 0,
            autoFocus: true,
            source: function (request, response) {
                var hosts = ['qq.com', '163.com', '263.com', 'sina.com.cn', 'gmail.com', 'hotmail.com'],
                        term = request.term,		//获取用户输入的内容
                        name = term,				//邮箱的用户名
                        host = '',					//邮箱的域名
                        ix = term.indexOf('@'),		//@的位置
                        result = [];				//最终呈现的邮箱列表
                result.push(term);
                //当有@的时候，重新分别用户名和域名
                if (ix > -1) {
                    name = term.slice(0, ix);
                    host = term.slice(ix + 1);
                }
                if (name) {
                    //如果用户已经输入@和后面的域名，
                    //那么就找到相关的域名提示，比如bnbbs@1，就提示bnbbs@163.com
                    //如果用户还没有输入@或后面的域名，
                    //那么就把所有的域名都提示出来
                    var findedHosts = (host ? $.grep(hosts, function (value, index) {
                        return value.indexOf(host) > -1
                    }) : hosts);
                    var findedResult = $.map(findedHosts, function (value, index) {
                        return name + '@' + value;
                    });
                    //数组连接
                    result = result.concat(findedResult);
                }
                response(result);
            }
        });

        var $company = $('#company');//公司名字加验证
        $company.blur(function () {
            var value = $company.val();
            var tel = /^[a-zA-Z0-9]*[\u4E00-\u9FA5\uF900-\uFA2D]+[a-zA-Z0-9]*$/;
            if (value.length == 0 || !tel.test(value)) {
                showerror($company, "请输入正确的公司名称");
                return;
            } else {
                hiderror($company);
            }
            if (value != _init_company) {
                ajaxCheckAccount($company);//不等于初始值就ajax判断
            }
        });

        //保存设置按钮
        var saveSettings = $('#saveSettings');
        saveSettings.click(function () {
            if ($email.attr("error") == "false" && $phone.attr("error") == "false" && $company.attr("error") == "false") {
                //都通过验证
                $.ajax({
                    url: "businessupdate",
                    type: "POST",
                    datatype: "json",
                    timeout: 3000,
                    data: {
                        type: "info",
                        company: $company.val(),
                        phone: $phone.val(),
                        email: $email.val(),
                        address: $city_name.text()
                    },
                    success: function (data, textStatus) {
                        if (data.success) {
                            openDialog(saveSettings, data.msg, function () {
                                //点击按钮回调
                                window.location.reload(true);//true为重新从服务器获取数据
                            });
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest + textStatus + errorThrown);
                    }
                });
            }
        });

        //密码部分以及验证
        var $pwd = $('#pwd');
        var $newpwd = $('#newpwd');
        var $newpwd2 = $('#newpwd2');
        $pwd.blur(function () {
            var value = $pwd.val();
            if (value.length < 6) {
                showerror($pwd, "密码长度小于6");
                return;
            }
            hiderror($pwd);
        });
        $newpwd.blur(function () {
            var value = $newpwd.val();
            if (value.length < 6) {
                showerror($newpwd, "密码长度小于6");
                return;
            }
            hiderror($newpwd);
        });
        $newpwd2.blur(function () {
            var value = $newpwd2.val();
            if (value.length < 6) {
                showerror($newpwd2, "密码长度小于6");
                return;
            }
            if (value != $newpwd.val()) {
                showerror($newpwd2, "两次输入的密码不一致");
                return;
            }
            hiderror($newpwd2);
        });

        //重设密码被点击
        var $resetpwd = $('#resetPassword');
        $resetpwd.click(function () {
            if ($pwd.attr("error") == "false" && $newpwd.attr("error") == "false" && $newpwd2.attr("error") == "false") {
                $.ajax({
                    url: "businessupdate",
                    type: "POST",
                    datatype: "json",
                    timeout: 3000,
                    data: {
                        type: "pwd",
                        pwd: $pwd.val(),
                        newpwd: $newpwd.val()
                    },
                    success: function (data, textStatus) {
                        //打开对话框
                        openDialog($resetpwd, data.msg, function () {//点击确定后的回调函数
                            if (data.success) {
                                //成功修改密码，就刷新本页面
                                window.location.reload(true);
                            }
                        });
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest + textStatus + errorThrown);
                    }
                })
            }
        });

        //城市选择
        var $btn_citydrop = $('#city_dropdown');//下拉按钮
        var $list_drop = $('#city_droplist');//城市下拉列表
        var $city_name = $('#city_name');//显示选中的城市名字
        $btn_citydrop.click(function () {
            $list_drop.slideToggle();
        });
        $list_drop.find('.search_hotList').find('a').click(function () {
            $city_name.text($(this).text());//地区选择后改变显示选择的地区
        });
        $list_drop.mouseleave(function () {
            $list_drop.slideUp();
        });

        //修改简介部分
        var $submit_descript = $('#submit_description');
        $submit_descript.click(function () {
            $.ajax({
                url: "businessupdate",
                type: "POST",
                datatype: "json",
                timeout: 3000,
                data: {
                    type: "descript",
                    descript: $('#description').val()
                },
                success: function (rdata, textStatus) {
                    openDialog($submit_descript, rdata.msg);
                    //var data = $.parseJSON(rdata);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        });
    });
</script>

<%--上传的代码--%>
<script type="text/javascript">
    $(document).ready(function () {
        //文件上传的url
        var url = "businesslogo";
        //文件后缀名匹配
        var extFilter = 'jpg;png;gif';
        //文件后缀名
        var extList = extFilter.toLowerCase().split(';');

        //上传进度条
        var $uploadProgressBar = $('#divProgressbar');
        $uploadProgressBar.progressbar({value: 50});
        $uploadProgressBar.hide();

        var $fileInput = $('#upload-file');
        $fileInput.on('change', function (evt) {
            //当选择文件的时候
            //evt.target是触发事件的html元素
        });

        //更新进度条
        function update_progressbar(percent) {
            $uploadProgressBar.progressbar("option", {value: percent});//更新进度条
        }

        //上传按钮
        var $uploadBtn = $('#uploadbtn');
        $uploadBtn.click(function () {
            //上传按钮被点击
            //上传的input的html元素
            var uploadele = document.getElementById("upload-file");
            if (uploadele.files[0]) {
                //已经选择了文件
                var file = uploadele.files[0];
                //检查文件扩展名
                var filename = file.name;
                //获取该文件的扩展名
                var ext = filename.toLowerCase().split('.').pop();
                if ($.inArray(ext, extList) >= 0) {
                    //显示进度条
                    $uploadProgressBar.show();
                    //如果该扩展名符合要求
                    //新建表单数据
                    var fd = new FormData();
                    //将新文件加入表单数据,第三个参数是文件名字
                    fd.append("files", file, filename);
                    //添加额外的表单数据，指定操作类型
                    fd.append("type", "upload");
                    //正式开始上传
                    $.ajax({
                        url: url,
                        type: "POST",
                        dataType: "json",
                        data: fd,
                        cache: false,
                        contentType: false,
                        processData: false,
                        forceSync: false,
                        xhr: function () {
                            //上传过程中更改进度条
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                xhrobj.upload.addEventListener('progress', function (event) {
                                    var percent = 0;
                                    var position = event.loaded || event.position;
                                    var total = event.total || event.totalSize;
                                    if (event.lengthComputable) {
                                        //上传百分比
                                        percent = Math.ceil(position / total * 100);
                                    }
                                    update_progressbar(percent);//更新UI
                                }, false);
                            }

                            return xhrobj;
                        },
                        success: function (data, message, xhr) {
                            //上传成功后做些什么
                            if (data.success) {
                                changelogo(data.logourl);
                            } else {
                                alert("上传失败了");
                            }
                        },
                        error: function (xhr, status, errMsg) {
                            alert("上传错误！");
                        },
                        complete: function (xhr, textStatus) {
                            //上传完成，成功或者失败都会执行
                        }
                    });

                } else {
                    //扩展名不符合要求
                    alert("请选择图片文件");
                }

            } else {
                alert("没有选择文件");
            }

        });

        //上传文件后做的事情
        var $logo = $('#avatar');

        //改变logo
        function changelogo(url) {
            var timeStr = "?t=" + Math.random();
            $logo.attr("src", url + timeStr);
            $('#avatar1').attr("src", url + timeStr);
            $('#avatar2').attr("src", url + timeStr);

            //显示保存logo按钮
            $('#saveLogo').slideDown();
        }
    });
</script>
<%--头像裁剪的代码--%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/business/css/imgareaselect-default.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/business/js/jquery.imgareaselect.pack.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/business/js/jQueryRotate.js"></script>
<script type="text/javascript">
    //当前旋转角度
    var rotate = 0;

    /**
     * 向左旋转
     */
    function avatarrotateleft() {
        rotate -= 90;
        $('#avatar').rotate({animateTo: rotate});
        $('#avatar1').rotate({animateTo: rotate});
        $('#avatar2').rotate({animateTo: rotate});
    }

    /**
     * 向右旋转
     */
    function avatarrotateright() {
        rotate += 90;
        $('#avatar').rotate({animateTo: rotate});
        $('#avatar1').rotate({animateTo: rotate});
        $('#avatar2').rotate({animateTo: rotate});
    }

    $(document).ready(function () {
        //当前裁剪框的坐标
        var crop_x = 0;
        var crop_y = 0;
        var crop_width = 180;
        var crop_height = 180;

        /**
         * 更新UI
         * */
        function adjust(el, selection) {
            var scaleX = $(el).width() / (selection.width || 1);
            var scaleY = $(el).height() / (selection.width || 1);
            $(el + ' img').css({
                width: Math.round(scaleX * $('#avatar').width()) + 'px',
                height: Math.round(scaleY * $('#avatar').height()) + 'px',
                marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px',
                marginTop: '-' + Math.round(scaleY * selection.y1) + 'px'
            });
        }

        /**
         * 裁剪框变动调用此方法
         * */
        function preview(img, selection) {
            adjust('#img_small_preview', selection);
            adjust('#img_big_preview', selection);
        }

        //开始截图插件
        $('img#avatar').imgAreaSelect({
            aspectRatio: "4:4",
            x1: 60,
            y1: 60,
            x2: 200,
            y2: 200,
            onSelectEnd: function (img, selection) {
                crop_x = selection.x1;
                crop_y = selection.y1;
                crop_width = selection.width;
                crop_height = selection.height;
                console.log(selection);
            },
            onSelectChange: preview
        });

        //保存按钮
        var $saveLogo = $('#saveLogo');
        $saveLogo.click(function () {
            $('#rotation').val(rotate);
            //alert('修改成功');
            $.ajax({
                url: "businesslogo",
                type: "POST",
                datatype: "json",
                data: {
                    "operateImage.rotate": rotate,
                    "operateImage.x": crop_x,
                    "operateImage.y": crop_y,
                    "operateImage.width": crop_width,
                    "operateImage.height": crop_height,
                    type: "save"
                },
                success: function (data, textStatus) {
                    console.log(data);
                    openDialog($saveLogo, data.msg);
                    $('#nav_logo').attr("src", data.logourl + "?t=" + Math.random());
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        });
    });
</script>
</body>
</html>
