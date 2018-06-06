<%@ page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款成功页面</title>
    <link rel="stylesheet" type="text/css" href="JSP/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="JSP/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="JSP/css/personal.css" rel="stylesheet" type="text/css">
    <link href="JSP/css/sustyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="JSP/basic/js/jquery-1.7.min.js"></script>

</head>

<body>
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
    <div class="logo"><img src="JSP/images/logo.png"/></div>
    <div class="logoBig">
        <li><img src="JSP/images/logobig.png"/></li>
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

<div class="take-delivery">


    <div class="status">
        <c:if test="${statusCode.getState() ==200}">
            <h2 style="color:#FF0000">您已成功付款</h2>
            <div class="successInfo">
                <ul>
                    <li>付款金额:￥<em>${sum }</em></li>
                    <div class="user-info">
                        <p>收货人：${user.getUsername() }</p>
                        <p>联系电话：${user.getPhonenumber() }</p>
                        <p>QQ号码：${user.getQq() }</p>
                        <p>收货地址：${user.getAdress() }</p>
                    </div>
                    请认真核对您的收货信息，如有错误请联系客服

                </ul>
                <div class="option">
                    <span class="info">您可以</span>
                    <a href="order" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
                </div>
            </div>
        </c:if>
        <c:if test="${statusCode.getState() != 200}">
            <h2><font style="color:#FF0000">${statusCode.getStateInfo()}</font>></h2>
            <div class="successInfo">

                <div class="option">
                    <span class="info">您可以</span>
                    <a href="sellinfo" class="J_MakePoint">查看<span>自己的商品</span></a>
                </div>
            </div>
            <c:if test="${statusCode.getState() == 508}">
                <div class="successInfo">
                    <ul>
                        <li>须付款金额:￥<em>${sum}
                        </em></li>
                        <li>你的虚拟币:￥<em>${buyer.getMoney()}
                        </em></li>
                        请认真核对您的信息，如有错误请联系客服
                    </ul>
                </div>
            </c:if>

        </c:if>
    </div>
    <div class="footer ">
        <div class="footer-bd">
            <p>
            <center><em>© 2015-2025 SCAU_Used_Book 版权所有. </em></center>
            </p>
        </div>
    </div>

</div>
</body>
</html>