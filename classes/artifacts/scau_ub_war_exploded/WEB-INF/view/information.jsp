<%@ page errorPage="ShowError.jsp" %>
<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8" %>
<%@ page import="model.Model" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人资料</title>

    <link href="../../JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
          type="text/css">
    <link href="../../JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
          type="text/css">
    <link href="../../JSP/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="../../JSP/css/personal.css" rel="stylesheet" type="text/css">

    <link href="../../JSP/css/infstyle.css" rel="stylesheet" type="text/css">

    <link href="../../JSP/css/addstyle.css" rel="stylesheet" type="text/css">
    <script src="../../JSP/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../JSP/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
    <%
        String userhead="../../JSP/images/getAvatar.do.jpg";
    %>
    <%----%>


    <script type="text/javascript">
        $(document).ready(function () {
            $('#personinfobtn').click(function () {


                //alert("开始提交");
                // alert($("#book-name").val()+$("#book-price").val()+$("#book-version").val()+$("#book-author").val()
                // +$("#book-kind").val()+$("#book-remarks").val()+$("#user-phone").val()+$("#user-qq").val()+$("#user-address").val());
                if ($("#book-name").val() == "" || $("#book-price").val() == "" || $("#book-version").val() == "" || $("#book-author").val() == "" || $("#book-remarks").val() == "" || $("#user-phone").val() == "" || $("#user-qq").val() == "") {
                    alert("请填完所有信息");
                } else {


                    $.ajax({
                        type: "POST",
                        url: "updateuser.do",
                        data: {
                            "userid": $("#userid").val(),
                            "username": $("#user-name2").val(),
                            "adress": $("#user-addressdd").val(),
                            "phonenumber": $("#user-phone").val(),
                            "qq": $("#user-qq").val()
                        },
                        success: function (msg) {
                            var dataObj = eval("(" + msg + ")");
                            if (dataObj.length < 2) {

                                alert("保存个人信息失败，请等待服务器信息");


                            } else {
                                alert("保存个人信息成功");
                                //$('#userCue1').html("<font color='red'><b>登录页成功</b></font>");
                            }
                        },
                        error: function (e) {
                            alert('数据连接失败', e);
                        }
                    });

                }
            });
        });
    </script>
</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header">
                <ul class="message-l">
                    <div class="topMessage">
                        <div class="menu-hd">
                            <a href="information.do" target="_top" class="h"
                               style="color:#000000">欢迎你&nbsp${sessionScope.user.getUsername() }&nbsp,</a>
                            &nbsp
                            <a href="index" target="_top" class="h" style="color:#0033ff" text-decoration="underline">退出登录</a>
                        </div>
                    </div>
                </ul>
                <ul class="message-r">
                    <div class="topMessage home">
                        <div class="menu-hd">
                            <a href="home" target="_top" class="h"><i
                                    class="am-icon-home am-icon-fw"></i>商城首页</a>
                        </div>
                    </div>
                    <div class="topMessage my-shangcheng">
                        <div class="menu-hd MyShangcheng">
                            <a href="information" target="_top"><i
                                    class="am-icon-user am-icon-fw"></i>个人中心</a>
                        </div>
                    </div>
                    <div class="topMessage mini-cart">
                        <div class="menu-hd">
                            <a id="mc-menu-hd" href="shopcart" target="_top"><i
                                    class="am-icon-shopping-cart  am-icon-fw"></i><span>藏书夹</span></a>
                        </div>
                    </div>
                    <div class="topMessage favorite">
                        <div class="menu-hd">
                            <a href="sellinfo" target="_top"><i
                                    class="am-icon-book am-icon-fw"></i><span>旧书交易</span></a>
                        </div>
                    </div>
                </ul>
            </div>

            <!--悬浮搜索框-->

            <div class="nav white">
                <div class="logo"><img src="../../JSP/images/logo.png"/></div>
                <div class="logoBig">
                    <li><img src="../../JSP/images/logobig.png"/></li>
                </div>


                <div class="search-bar pr">
                    <a name="index_none_header_sysc" href="#"></a>
                    <form action="search.do">
                        <input value="${ keyword }" id="searchInput" name="keyword" type="text" placeholder="书名/出版社"
                               autocomplete="on">
                        <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                    </form>
                </div>
            </div>

            <div class="clear"></div>
        </div>
        </div>
    </article>
</header>
<div class="nav-table">
    <div class="long-title">
        <span class="all-goods">全部分类</span>
    </div>
    <div class="nav-cont">
        <ul>
            <li class="index"><a href="home">商城首页</a></li>
            <li class="qc"><a href="information">个人中心</a></li>
            <li class="qc"><a href="shopcart">我的藏书夹</a></li>
        </ul>

    </div>
</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-info">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf">
                        <strong class="am-text-danger am-text-lg">个人信息</strong> /
                        <small>Personal&nbsp;information</small>
                    </div>
                </div>
                <hr/>

                <!--头像 -->
                <div class="user-infoPic">

                    <div class="filePic">
                        <img class="am-circle am-img-thumbnail" src=<%=userhead%> alt=""/>
                    </div>

                    <p class="am-form-help">头像</p>

                    <div class="info-m">
                        <div>
                            <b>用户名：<i>${sessionScope.user.getUsername() }</i></b>
                        </div>
                        <div class="u-level">
								<span class="rank r2"> <s class="vip1"></s><font
                                        class="classes" color="#0000FF">易班网薪: ${sessionScope.user.getMoney() }</font>
								</span>
                        </div>
                    </div>
                </div>

                <!--个人信息 -->
                <div class="info-main">
                    <form class="am-form am-form-horizontal">


                        <div class="am-form-group">
                            <label for="user-name" class="am-form-label">姓名</label>
                            <div class="am-form-content">
                                <input type="text" id="user-name2"
                                       value="${sessionScope.user.getUsername() }" placeholder="name">

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">性别</label>
                            <div class="am-form-content sex">
                                <label class="am-radio-inline"> <input type="radio"
                                                                       name="radio10" value="male" data-am-ucheck> 男
                                </label> <label class="am-radio-inline"> <input type="radio"
                                                                                name="radio10" value="female"
                                                                                data-am-ucheck> 女
                            </label> <label class="am-radio-inline"> <input type="radio"
                                                                            name="radio10" value="secret"
                                                                            data-am-ucheck> 保密
                            </label>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="book-kind" class="am-form-label">专业类别</label>
                            <div class="am-form-content address">
                                <select id="book-kind" data-am-selected>
                                    <%
                                        for (String kind : Model.bookkindlist) {
                                    %>
                                    <option value="<%=kind%>" selected><%=kind%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" value="${sessionScope.user.getUserid() }%>" id="user-id">
                        <div class="am-form-group">
                            <label for="user-addressdd" class="am-form-label">宿舍地址</label>
                            <div class="am-form-content">
                                <input value="${sessionScope.user.getAdress() }" id="user-addressdd"
                                       placeholder="例:泰山区7栋624" type="tel">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-phone" class="am-form-label">电话</label>
                            <div class="am-form-content">
                                <input value="${sessionScope.user.getPhonenumber()}" id="user-phone"
                                       placeholder="phonenumber" maxlength="11">

                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-qq" class="am-form-label">QQ号码</label>
                            <div class="am-form-content">
                                <input value="${sessionScope.user.getQq()}" id="user-qq"
                                       placeholder="QQnumber" maxlength="10">

                            </div>
                        </div>
                        <div class="info-btn">
                            <div id="personinfobtn" class="am-btn am-btn-danger">保存修改</div>
                        </div>

                    </form>
                </div>

            </div>

        </div>
        <!--底部-->
        <div class="footer ">
            <div class="footer-bd">
                <p>
                <center><em>© 2015-2025 SCAU_Used_Book 版权所有. </em></center>
                </p>
            </div>
        </div>
    </div>

    <aside class="menu">
        <ul>
            <li class="person">个人中心</li>
            <li class="person">&lt;个人资料 >
                <ul>
                    <li><a href="information">个人信息</a></li>
                    <!-- 					<li><a href="modifyPwd.jsp">密码修改</a></li> -->
                </ul>
            </li>
            <li class="person">&lt;我的订单 >
                <ul>
                    <li><a href="order">订单详情</a></li>
                </ul>
            </li>
            <li class="person">&lt;旧书交易 >
                <ul>
                    <li><a href="bookinfo">旧书上架</a></li>
                    <li><a href="sellinfo">出售详情</a></li>
                </ul>
            </li>


        </ul>

    </aside>
</div>

</body>

</html>