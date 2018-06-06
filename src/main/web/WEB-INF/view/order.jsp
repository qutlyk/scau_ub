<%@ page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>我的订单</title>
    <link href="JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="JSP/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="JSP/css/personal.css" rel="stylesheet" type="text/css">
    <link href="JSP/css/orstyle.css" rel="stylesheet" type="text/css">
    <script src="JSP/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="JSP/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

    <script type="text/javascript">
        // function affirmGoods(Str) {//确认收货
        //
        //     var xmlhttp;
        //     xmlhttp = new XMLHttpRequest();
        //     xmlhttp.onreadystatechange = function () {
        //         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        //             window.location.reload(true);
        //             //alert("确认收货，itemid为"+Str);
        //         }
        //     }
        //     var userid = $('#useridthe').val();
        //     xmlhttp.open("GET", "confirmGoods.jsp?userid=" + userid + "&itemid=" + Str, true);
        //     xmlhttp.send();
        // }

        function affirmGoods(theitemid) {//确认收货
                var result = confirm('是否确认收货！');
                if (result) {
            $.ajax({
                type: "POST",
                url: "confirmgood.do",
                data: {
                    "itemid": theitemid,
                },
                success: function (msg) {
                   if(msg.flag ==200)
                       window.location.href = "order";
                    alert(msg.result);
                },
                error: function (e) {
                    alert('数据连接失败', e);
                }
            });
        }
        }


    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            //delete boo infomation which in the mysql
            $('.anniu.deletebook').click(function () {
                //这个就是jquer循环获取的class对象 你可以用来处理你的逻辑alert($(this).val());
                var theitemid = $(this).attr("value");
                alert("确定删除编号为  :" + theitemid + " 的商品吗？");

                $.ajax({
                    type: "POST",
                    url: "deleteorder.do",
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
            <li class="qc"><a href="search">旧书列表</a></li>
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
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的订单</strong> /
                        <small>Orders</small>
                    </div>
                </div>
                <hr/>

                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

                    <ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
                        <li><a href="#tab5">已付款</a></li>
                        <li><a href="#tab4">已收货</a></li>
                    </ul>

                    <div class="am-tabs-bd">

                        <!--已发货订单-->

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
                            <div class="th th-amount">
                                <td class="td-inner">卖家信息</td>
                            </div>
                            <div class="th th-operation">
                                <td class="td-inner">易班网薪</td>
                            </div>
                            <div class="th th-status">
                                <td class="td-inner">交易状态</td>
                            </div>
                            <div class="th th-change">
                                <td class="td-inner">交易操作</td>
                            </div>
                        </div>
                        <div class="am-tab-panel am-fade" id="tab5">
                            <div class="order-main">
                                <div class="order-list">
                                    <c:forEach items="${sellitemList1}" var="si">
                                        <c:set var="item" value="${si.getItem()}"></c:set>
                                        <c:set var="seller" value="${si.getSeller()}"></c:set>

                                        <div class="order-status3">
                                            <div class="order-title">
                                                <div class="dd-num">订单编号：<a href="javascript:;">${item.getItemid() }
                                                </a></div>
                                            </div>
                                            <div class="order-content">
                                                <div class="order-left">
                                                    <ul class="item-list">
                                                        <li class="td td-item">
                                                            <div class="item-pic">
                                                                <a href="introduction?${item.getItemid() }"
                                                                   class="J_MakePoint">
                                                                    <img src="upload/${item.getImages()}"
                                                                         class="itempic J_ItemImg">
                                                                </a>
                                                            </div>
                                                            <div class="item-info">
                                                                <div class="item-basic-info">

                                                                    <a href="introduction?itemid=${item.getItemid()}">
                                                                        <p>${item.getBookname() }
                                                                        </p></a>
                                                                    <p class="info-little">出版社：
                                                                            ${item.getPress()}
                                                                    </p>
                                                                    <p class="info-little">作者/主编：
                                                                            ${item.getAuthor()}
                                                                    </p>

                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="td td-price">
                                                            <div class="item-price">
                                                                ¥${item.getPrice() }
                                                            </div>
                                                        </li>
                                                        <li class="td td-number">
                                                            <div class="item-number">
                                                                <span>×</span>1
                                                            </div>
                                                        </li>
                                                        <li class="td td-operation">
                                                            <div class="item-operation">
                                                                <div align="left">卖家：${seller.getUsername()}
                                                                </div>
                                                                <div align="left">手机：${seller.getPhonenumber()}
                                                                </div>
                                                                <div align="left">qq号 :${seller.getQq()}
                                                                </div>
                                                                <div align="left">宿舍：${seller.getAdress()}
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div class="order-right">
                                                    <li class="td td-amount">
                                                        <div class="item-amount">
                                                            合计：¥${item.getPrice() }
                                                        </div>
                                                    </li>
                                                    <c:if test="${item.getStatus() ==1}">
                                                        <div class="move-right">
                                                            <li class="td td-status">
                                                                <div class="item-status">
                                                                    <p class="Mystatus">卖家已发货</p>
                                                                </div>
                                                            </li>
                                                            <li class="td td-change" onclick="affirmGoods(this.id)"
                                                                id="${item.getItemid() }">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    确认收货
                                                                </div>
                                                            </li>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${item.getStatus() ==2}">
                                                        <div class="move-right">
                                                            <li class="td td-status">
                                                                <div class="item-status">
                                                                    <p class="Mystatus">交易成功</p>
                                                                </div>
                                                            </li>
                                                            <li class="td td-change">
                                                            <li class="td td-change">
                                                                <div value="${item.getItemid()}"
                                                                     class="am-btn am-btn-danger anniu deletebook">删除记录
                                                                </div>
                                                            </li>
                                                            </li>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>



                        <div class="am-tab-panel am-fade" id="tab6">
                            <div class="order-main">
                                <div class="order-list">
                                    <c:forEach items="${sellitemList2}" var="si">
                                        <c:set var="item" value="${si.getItem()}"></c:set>
                                        <c:set var="seller" value="${si.getSeller()}"></c:set>

                                        <div class="order-status3">
                                            <div class="order-title">
                                                <div class="dd-num">订单编号：<a href="javascript:;">${item.getItemid() }
                                                </a></div>
                                            </div>
                                            <div class="order-content">
                                                <div class="order-left">
                                                    <ul class="item-list">
                                                        <li class="td td-item">
                                                            <div class="item-pic">
                                                                <a href="introduction?${item.getItemid() }"
                                                                   class="J_MakePoint">
                                                                    <img src="upload/${item.getImages()}"
                                                                         class="itempic J_ItemImg">
                                                                </a>
                                                            </div>
                                                            <div class="item-info">
                                                                <div class="item-basic-info">

                                                                    <a href="introduction?itemid=${item.getItemid()}">
                                                                        <p>${item.getBookname() }
                                                                        </p></a>
                                                                    <p class="info-little">出版社：
                                                                            ${item.getPress()}
                                                                    </p>
                                                                    <p class="info-little">作者/主编：
                                                                            ${item.getAuthor()}
                                                                    </p>

                                                                </div>
                                                            </div>
                                                        </li>
                                                        <li class="td td-price">
                                                            <div class="item-price">
                                                                ¥${item.getPrice() }
                                                            </div>
                                                        </li>
                                                        <li class="td td-number">
                                                            <div class="item-number">
                                                                <span>×</span>1
                                                            </div>
                                                        </li>
                                                        <li class="td td-operation">
                                                            <div class="item-operation">
                                                                <div align="left">卖家：${seller.getUsername()}
                                                                </div>
                                                                <div align="left">手机：${seller.getPhonenumber()}
                                                                </div>
                                                                <div align="left">qq号 :${seller.getQq()}
                                                                </div>
                                                                <div align="left">宿舍：${seller.getAdress()}
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div class="order-right">
                                                    <li class="td td-amount">
                                                        <div class="item-amount">
                                                            合计：¥${item.getPrice() }
                                                        </div>
                                                    </li>
                                                    <c:if test="${item.getStatus() ==1}">
                                                        <div class="move-right">
                                                            <li class="td td-status">
                                                                <div class="item-status">
                                                                    <p class="Mystatus">卖家已发货</p>
                                                                </div>
                                                            </li>
                                                            <li class="td td-change" onclick="affirmGoods(this.id)"
                                                                id="${item.getItemid() }">
                                                                <div class="am-btn am-btn-danger anniu">
                                                                    确认收货
                                                                </div>
                                                            </li>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${item.getStatus() ==2}">
                                                        <div class="move-right">
                                                            <li class="td td-status">
                                                                <div class="item-status">
                                                                    <p class="Mystatus">交易成功</p>
                                                                </div>
                                                            </li>
                                                            <li class="td td-change">
                                                            <li class="td td-change">
                                                                <div value="${item.getItemid()}"
                                                                     class="am-btn am-btn-danger anniu deletebook">删除记录
                                                                </div>
                                                            </li>
                                                            </li>
                                                        </div>
                                                    </c:if>
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