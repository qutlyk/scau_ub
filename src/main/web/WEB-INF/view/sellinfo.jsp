<%@ page errorPage="ShowError.jsp" %>
<%@page import="java.net.URLDecoder" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>旧书出售详情</title>

    <link href="JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="JSP/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="JSP/css/personal.css" rel="stylesheet" type="text/css">
    <link href="JSP/css/orstyle.css" rel="stylesheet" type="text/css">

    <script src="JSP/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="JSP/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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

            <div class="user-order">

                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的商品</strong> /
                            <small>MyGoods</small>
                        </div>
                    </div>
                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active"><a href="#tab1">出售中</a></li>
                        <li><a href="#tab2">待交货</a></li>
                        <li><a href="#tab3">已成交</a></li>
                    </ul>

                    <div class="am-tabs-bd">
                        <div class="order-top">
                            <div class="th th-item">
                                <td class="td-inner">商品</td>
                            </div>
                            <div class="th th-price">
                                <td class="td-inner">单价</td>
                            </div>
                            <div class="th th-number">
                                <td class="td-inner">数量</td>
                            </div>
                            <div class="th th-operation">
                                <td class="td-inner">商品备注</td>
                            </div>
                            <div class="th th-amount">
                                <td class="td-inner">易班网薪</td>
                            </div>
                            <div class="th th-status">
                                <td class="td-inner">商品状态</td>
                            </div>
                            <div class="th th-change">
                                <td class="td-inner">商品操作</td>
                            </div>
                        </div>


                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">

                            <div class="order-main">
                                <c:forEach items="${buyeritemList0}" var="bi">
                                    <c:set var="i1" value="${bi.getItem()}"></c:set>
                                    <c:set var="buyer" value="${bi.getBuyer()}"></c:set>
                                    <div id="${i1.getItemid()}" class="order-list">

                                        <!--交易成功-->
                                        <div class="order-status5">
                                            <div class="order-title">
                                                <div class="dd-num">
                                                    旧书编号：<a href="javascript:;">${i1.getItemid()}</a>
                                                </div>

                                                <!--    <em>店铺：小桔灯</em>-->
                                            </div>
                                            <div class="order-content">
                                                <div class="order-left">
                                                    <ul class="item-list">
                                                        <li class="td td-item">
                                                            <div class="item-pic">
                                                                <a
                                                                        href="introduction?itemid=${i1.getItemid()}"
                                                                        class="J_MakePoint">
                                                                    <img
                                                                            src="upload/${i1.getImages()}"
                                                                            class="itempic J_ItemImg">
                                                                </a>
                                                            </div>
                                                            <div class="item-info">
                                                                <div class="item-basic-info">
                                                                    <a href="introduction?itemid=${i1.getItemid()}">
                                                                        <p>${i1.getBookname()}</p>
                                                                        <p class="info-little">
                                                                            主编/作者:${i1.getAuthor()}
                                                                            <br/>版本：${i1.getVersion()}<br/>出版社：${i1.getPress()}
                                                                        </p>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="td td-price">
                                                            <div class="item-price">
                                                                    ${i1.getPrice()}
                                                            </div>
                                                        </li>
                                                        <li class="td td-number">
                                                            <div class="item-number">
                                                                <span>×</span>1
                                                            </div>
                                                        </li>
                                                        <c:if test="${it.getStatus() ==0}">
                                                        <li class="td td-operation">
                                                            <div class="item-operation"></div>
                                                        </li>
                                                        </c:if>
                                                        <c:if test="${it.getStatus() !=0}">
                                                        <li class="td td-operation">
                                                            <div class="item-operation">
                                                                <div align="left">买家：${buyer.getUsername()}</div>
                                                                <div align="left">qq：${buyer.getQq()}</div>
                                                                <div align="left">手机：${buyer.getPhonenumber()}</div>
                                                                <div align="left">地址：${ buyer.getAddress() }</div>
                                                            </div>
                                                        </li>
                                                        </c:if>
                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：${i1.getPrice()}
                                                                </div>
                                                            </li>
                                                            <c:if test="${it.getStatus() ==0}">
                                                                <div class="move-right">
                                                                    <li class="td td-change">未找到买家</li>
                                                                    <li class="td td-change">
                                                                        <div value="${i1.getItemid()}"
                                                                             class="am-btn am-btn-danger anniu deletebook">
                                                                            下架旧书
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${it.getStatus() ==1}">

                                                                <div class="move-right">
                                                                    <li class="td td-change">买家未确认收货</li>
                                                                    <li class="td td-change">
                                                                        <div>如果未送达，请您尽快送达买家</div>
                                                                    </li>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${it.getStatus() ==2}">
                                                                <div class="move-right">
                                                                    <li class="td td-change">
                                                                        <p>交易成功</p>
                                                                    </li>
                                                                    <li class="td td-change">
                                                                        <div value="${i1.getItemid()}"
                                                                             class="am-btn am-btn-danger anniu deletebook">
                                                                            删除记录
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="am-tab-panel am-fade am-in am-active" id="tab2">

                            <div class="order-main">
                                <c:forEach items="${buyeritemList1}" var="bi">
                                    <c:set var="i1" value="${bi.getItem()}"></c:set>
                                    <c:set var="buyer" value="${bi.getBuyer()}"></c:set>
                                    <div id="${i1.getItemid()}" class="order-list">

                                        <!--交易成功-->
                                        <div class="order-status5">
                                            <div class="order-title">
                                                <div class="dd-num">
                                                    旧书编号：<a href="javascript:;">${i1.getItemid()}</a>
                                                </div>

                                                <!--    <em>店铺：小桔灯</em>-->
                                            </div>
                                            <div class="order-content">
                                                <div class="order-left">
                                                    <ul class="item-list">
                                                        <li class="td td-item">
                                                            <div class="item-pic">
                                                                <a
                                                                        href="introduction?itemid=${i1.getItemid()}"
                                                                        class="J_MakePoint">
                                                                    <img
                                                                            src="upload/${i1.getImages()}"
                                                                            class="itempic J_ItemImg">
                                                                </a>
                                                            </div>
                                                            <div class="item-info">
                                                                <div class="item-basic-info">
                                                                    <a href="introduction?itemid=${i1.getItemid()}">
                                                                        <p>${i1.getBookname()}</p>
                                                                        <p class="info-little">
                                                                            主编/作者:${i1.getAuthor()}
                                                                            <br/>版本：${i1.getVersion()}<br/>出版社：${i1.getPress()}
                                                                        </p>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="td td-price">
                                                            <div class="item-price">
                                                                    ${i1.getPrice()}
                                                            </div>
                                                        </li>
                                                        <li class="td td-number">
                                                            <div class="item-number">
                                                                <span>×</span>1
                                                            </div>
                                                        </li>
                                                        <c:if test="${it.getStatus() ==0}">
                                                            <li class="td td-operation">
                                                                <div class="item-operation"></div>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${it.getStatus() !=0}">
                                                            <li class="td td-operation">
                                                                <div class="item-operation">
                                                                    <div align="left">买家：${buyer.getUsername()}</div>
                                                                    <div align="left">qq：${buyer.getQq()}</div>
                                                                    <div align="left">手机：${buyer.getPhonenumber()}</div>
                                                                    <div align="left">地址：${ buyer.getAddress() }</div>
                                                                </div>
                                                            </li>
                                                        </c:if>

                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：${i1.getPrice()}
                                                                </div>
                                                            </li>
                                                            <c:if test="${it.getStatus() ==0}">
                                                                <div class="move-right">
                                                                    <li class="td td-change">未找到买家</li>
                                                                    <li class="td td-change">
                                                                        <div value="${i1.getItemid()}"
                                                                             class="am-btn am-btn-danger anniu deletebook">
                                                                            下架旧书
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${it.getStatus() ==1}">
                                                                <div class="move-right">
                                                                    <li class="td td-change">买家未确认收货</li>
                                                                    <li class="td td-change">
                                                                        <div>如果未送达，请您尽快送达买家</div>
                                                                    </li>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${it.getStatus() ==2}">
                                                                <div class="move-right">
                                                                    <li class="td td-change">
                                                                        <p>交易成功</p>
                                                                    </li>
                                                                    <li class="td td-change">
                                                                        <div value="${i1.getItemid()}"
                                                                             class="am-btn am-btn-danger anniu deletebook">
                                                                            删除记录
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="am-tab-panel am-fade am-in am-active" id="tab3">

                            <div class="order-main">
                                <c:forEach items="${buyeritemList2}" var="bi">
                                    <c:set var="i1" value="${bi.getItem()}"></c:set>
                                    <c:set var="buyer" value="${bi.getBuyer()}"></c:set>

                                    <div id="${i1.getItemid()}" class="order-list">

                                        <!--交易成功-->
                                        <div class="order-status5">
                                            <div class="order-title">
                                                <div class="dd-num">
                                                    旧书编号：<a href="javascript:;">${i1.getItemid()}</a>
                                                </div>

                                                <!--    <em>店铺：小桔灯</em>-->
                                            </div>
                                            <div class="order-content">
                                                <div class="order-left">
                                                    <ul class="item-list">
                                                        <li class="td td-item">
                                                            <div class="item-pic">
                                                                <a
                                                                        href="introduction?itemid=${i1.getItemid()}"
                                                                        class="J_MakePoint">
                                                                    <img
                                                                            src="upload/${i1.getImages()}"
                                                                            class="itempic J_ItemImg">
                                                                </a>
                                                            </div>
                                                            <div class="item-info">
                                                                <div class="item-basic-info">
                                                                    <a href="introduction?itemid=${i1.getItemid()}">
                                                                        <p>${i1.getBookname()}</p>
                                                                        <p class="info-little">
                                                                            主编/作者:${i1.getAuthor()}
                                                                            <br/>版本：${i1.getVersion()}<br/>出版社：${i1.getPress()}
                                                                        </p>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="td td-price">
                                                            <div class="item-price">
                                                                    ${i1.getPrice()}
                                                            </div>
                                                        </li>
                                                        <li class="td td-number">
                                                            <div class="item-number">
                                                                <span>×</span>1
                                                            </div>
                                                        </li>
                                                        <c:if test="${it.getStatus() ==0}">
                                                            <li class="td td-operation">
                                                                <div class="item-operation"></div>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${it.getStatus() !=0}">
                                                            <li class="td td-operation">
                                                                <div class="item-operation">
                                                                    <div align="left">买家：${buyer.getUsername()}</div>
                                                                    <div align="left">qq：${buyer.getQq()}</div>
                                                                    <div align="left">手机：${buyer.getPhonenumber()}</div>
                                                                    <div align="left">地址：${ buyer.getAddress() }</div>
                                                                </div>
                                                            </li>
                                                        </c:if>

                                                        <div class="order-right">
                                                            <li class="td td-amount">
                                                                <div class="item-amount">
                                                                    合计：${i1.getPrice()}
                                                                </div>
                                                            </li>
                                                            <c:if test="${it.getStatus() ==0}">
                                                                <div class="move-right">
                                                                    <li class="td td-change">未找到买家</li>
                                                                    <li class="td td-change">
                                                                        <div value="${i1.getItemid()}"
                                                                             class="am-btn am-btn-danger anniu deletebook">
                                                                            下架旧书
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${it.getStatus() ==1}">
                                                                <div class="move-right">
                                                                    <li class="td td-change">买家未确认收货</li>
                                                                    <li class="td td-change">
                                                                        <div>如果未送达，请您尽快送达买家</div>
                                                                    </li>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${it.getStatus() ==2}">
                                                                <div class="move-right">
                                                                    <li class="td td-change">
                                                                        <p>交易成功</p>
                                                                    </li>
                                                                    <li class="td td-change">
                                                                        <div value="${i1.getItemid()}"
                                                                             class="am-btn am-btn-danger anniu deletebook">
                                                                            删除记录
                                                                        </div>
                                                                    </li>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>



                    </div>
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
<script type="text/javascript">
    $(document).ready(function () {
        //delete boo infomation which in the mysql
        $('.anniu.deletebook').click(function () {
            var result = confirm('是否删除！');
            if (result) {


                var theitemid = $(this).attr("value");
                alert("确定删除编号为  :" + theitemid + " 的商品吗？");


                $.ajax({
                    type: "POST",
                    url: "deletesellitem.do",
                    data: {
                        "itemid": theitemid,
                    },
                    success: function (msg) {
                        if (data.flag == 200)
                            $("#" + theitemid + "").remove();

                        alert(data.result);
                    },
                    error: function (e) {
                        alert('数据连接失败', e);
                    }
                });

            }

        });


    });
</script>
</html>