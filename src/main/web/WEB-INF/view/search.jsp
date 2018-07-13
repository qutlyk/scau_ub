<%@ page errorPage="ShowError.jsp" %>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>搜索页面</title>

    <link href="JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>

    <link href="JSP/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="JSP/css/seastyle.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="JSP/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="JSP/js/script.js"></script>
</head>

<script type="text/javascript">
</script>
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
<b class="line"></b>
<div class="search">
    <div class="search-list">
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="home">商城首页</a></li>
                <li class="qc"><a href="search">旧书列表</a></li>
                <li class="qc"><a href="information">个人中心</a></li>
                <li class="qc"><a href="shopcart">我的藏书夹</a></li>
            </ul>

        </div>


        <div class="am-g am-g-fixed">
            <div class="am-u-sm-12 am-u-md-12">
                <div class="theme-popover">

                    <ul class="select">
                        <p class="title font-normal">
                            <span class="fl" style="color:#ff5325"> ${keyword}</span>

                            <span class="total fl">搜索到<strong class="num"
                                                              style="color:#ff5325"> ${booklist.size()} </strong>件相关商品</span>
                        </p>
                        <div class="clear"></div>
                        <li class="select-result">
                            <dl>
                                <dt>已选</dt>
                                <dd class="select-no"></dd>
                                <p class="eliminateCriteria">清除</p>
                            </dl>
                        </li>
                        <div class="clear"></div>

                    </ul>
                    <div class="clear"></div>
                </div>
                <div class="search-content">
                    <div class="sort">
                        <li><a title="暂时默认上架时间排序" href="search.do?keyword=${keyword}">按综合排序</a></li>
                        <c:if test="${empty nextsort}">
                            <li><a title="按价格排序" href="search.do?keyword=${keyword}&sort=1">按价格排序</a></li>
                        </c:if>
                        <c:if test="${not empty nextsort}">
                            <li><a title="按价格排序" href="search.do?keyword=${keyword}&sort=${nextsort}">按价格排序</a></li>
                        </c:if>
                    </div>
                    <div class="clear"></div>

                    <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                        <c:forEach items="${booklist}" var="it">
                            <li>
                                <div class="i-pic limit">
                                    <a href="introduction?itemid=${it.getItemid()}" class="J_MakePoint">
                                        <img src="upload/${it.getImages()}" height="200" width="200"/>
                                    </a>

                                    <p class="title fl">${it.getBookname()}</p>
                                    <p class="price fl">
                                        <b>¥</b>
                                        <strong>${it.getPrice()}</strong>
                                    </p>
                                    <p class="number fl">
                                        版本：${it.getVersion()}
                                    </p>
                                </div>
                            </li>

                        </c:forEach>
                    </ul>

                </div>
                <div class="clear"></div>
                <!--分页 -->
                <ul class="am-pagination am-pagination-right">
                    <c:if test="${empty start}">
                        <c:set var="start" value="1"/>
                    </c:if>
                    <c:if test="${empty sort}">
                        <c:set var="sort" value="1"/>
                    </c:if>

                    <li class="am-disabled"><a href="#">&laquo;</a></li>
                    <c:forEach var="pagei" begin="1" end="5" step="1">
                        <c:if test="${pagei eq start}">
                            <li class="am-active"><a href="search.do?keyword=${keyword}&sort=${sort}&start=${pagei}&limit=8">${pagei}</a></li>
                        </c:if>
                        <c:if test="${pagei ne start}">
                            <li><a href="search.do?keyword=${keyword}&sort=${sort}&start=${pagei}&limit=8">${pagei}</a></li>
                        </c:if>
                    </c:forEach>
                    <li><a href="#">&raquo;</a></li>


                </ul>

            </div>
        </div>

        <div class="footer ">
            <div class="footer-bd">
                <p>
                <center><em>© 2015-2025 SCAU_Used_Book 版权所有. </em></center>
                </p>
            </div>
        </div>

    </div>

    <!--菜单 -->

    <script>
        window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
    </script>
    <script type="text/javascript" src="JSP/basic/js/quick_links.js"></script>

    <div class="theme-popover-mask"></div>

</body>

</html>