<%@ page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>藏书夹</title>
    <link href="../../JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="../../JSP/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="../../JSP/css/cartstyle.css" rel="stylesheet" type="text/css"/>
    <link href="../../JSP/css/personal.css" rel="stylesheet" type="text/css">
    <link href="../../JSP/css/optstyle.css" rel="stylesheet" type="text/css"/>
    <script src="../../JSP/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script type="text/javascript">
        function selectAll() {//全选函数
            var checklist = document.getElementsByName("itemid");
            if (document.getElementById("J_SelectAllCbx2").checked) {
                for (var i = 0; i < checklist.length; i++) {
                    checklist[i].checked = 1;
                }
            }
            else {
                for (var i = 0; i < checklist.length; i++) {
                    checklist[i].checked = 0;
                }
            }
            //全选情况下的计算已选数以及总金额
            var sum = 0;
            var num_selected = 0;
            num_selected = parseInt(num_selected);
            sum = parseInt(sum);
            var checkbox = document.getElementsByName("itemid");
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked) {
                    sum += parseInt(checkbox[i].title);
                    num_selected++;
                }
                document.getElementById("J_Total").innerHTML = sum;
                document.getElementById("J_SelectedItemsCount").innerHTML = num_selected;
            }

        }

        function submit() {
            var checked = 0;					//记录复选框已选的数量
            var checklist = document.getElementsByName("itemid");//把所有的复选框弄出来；
            for (var i = 0; i < checklist.length; i++) {//遍历所有的复选框
                if (checklist[i].checked)	//如果复选框已选
                    checked++;				//已选加一
            }
            if (checked == 0) {
                alert("请选择要结算的书籍");//提醒选择要结算的书籍
            }
            else
                document.getElementById("form_shopcart").submit();//如果有选，就允许提交
        }

        function count() {		//统计已选数目以及总金额
            var sum = 0;
            var num_selected = 0;
            num_selected = parseInt(num_selected);
            sum = parseInt(sum);
            var checkbox = document.getElementsByName("itemid");
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked) {
                    sum += parseInt(checkbox[i].title);
                    num_selected++;
                }
                document.getElementById("J_Total").innerHTML = sum;
                document.getElementById("J_SelectedItemsCount").innerHTML = num_selected;
            }
        }

        function DeleteAll() {
            window.location.href = "deleteallshopcart.do";
        }

        $(document).ready(function () {
            $('.anniu.deletebook').click(function () {

                var theitemid = $(this).attr("value");
                var result = confirm('确定把该商品从藏书夹移除吗？');
                if (result) {
                    $.ajax({
                        type: "POST",
                        url: "deleteshopcart.do",
                        data: {
                            "itemid": theitemid,
                        },
                        success: function (msg) {
                            if(msg.flag==200)
                                $("#" + theitemid + "").remove();
                            else
                                alert("下架商品失败，请等待服务器响应或者稍候重试");
                        },
                        error: function (e) {
                            alert('数据连接失败', e);
                        }
                    });

                }
            });


            $('.anniu.buybook').click(function () {
                var buyitemid = $(this).attr("value");
                window.location.href = "preparePay.do?itemid=" + buyitemid;
            });
        })
    </script>


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

<!--藏书夹 -->
<div class="concent">
    <form action="preparePay.do" id="form_shopcart" method="POST">
        <div id="cartTable">
            <div class="cart-table-th">
                <div class="wp">
                    <div class="th th-chk">
                        <div id="J_SelectAll1" class="select-all J_SelectAll">

                        </div>
                    </div>
                    <div class="th th-item">
                        <div class="td-inner">商品信息</div>
                    </div>
                    <div class="th th-price">
                        <div class="td-inner">单价</div>
                    </div>
                    <div class="th th-amount">
                        <div class="td-inner">数量</div>
                    </div>
                    <div class="th th-sum">
                        <div class="td-inner">购买</div>
                    </div>
                    <div class="th th-op">
                        <div class="td-inner">移除</div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <c:forEach items="${itemList}" var="item">
                <tr class="item-list">
                    <div class="bundle  bundle-last " id="${item.getItemid()}">
                        <div class="bundle-hd">
                            <div class="bd-promos">
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="bundle-main">
                            <ul class="item-content clearfix">
                                <li class="td td-chk">
                                    <div class="cart-checkbox ">
                                        <input class="check" id="J_CheckBox_170037950254" name="itemid"
                                               title="${item.getPrice() }" value=${item.getItemid()}  type="checkbox"
                                               onclick="count()">
                                        <label for="J_CheckBox_170037950254"></label>
                                    </div>
                                </li>
                                <li class="td td-item">
                                    <div class="item-pic">
                                        <a href="introduction?itemid=${item.getItemid()}" target="_blank"
                                           data-title="picture_item" class="J_MakePoint" data-point="tbcart.8.12">
                                            <img src="upload/${item.getImages() }" class="itempic J_ItemImg" height="80"
                                                 width="80"></a>
                                    </div>
                                    <div class="item-info">
                                        <div class="item-basic-info">
                                            <a href="introduction?itemid=${item.getItemid()}"
                                               target="_blank" title="name_item" class="item-title J_MakePoint"
                                               data-point="tbcart.8.11">${item.getBookname() }
                                            </a>
                                            <br>
                                            <c:if test="${item.getStatus() !=0 }">
                                                <font color="#FF0000">此商品已失效，请移除</font>
                                            </c:if>
                                        </div>
                                    </div>
                                </li>
                                <li class="td td-info">
                                    <div class="item-props">
                                        <span class="sku-line">出版社：</span>
                                        <span class="sku-line">${item.getPress()}</span>
                                    </div>
                                </li>
                                <li class="td td-price">
                                    <div class="item-price price-promo-promo">
                                        <div class="price-content">
                                            <div class="price-line">
                                                <em class="J_Price price-now" tabindex="0">${item.getPrice() }
                                                </em>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="td td-amount">
                                    <div class="amount-wrapper ">
                                        <div class="item-amount ">
                                            <div class="sl">
                                                <em class="J_Price price-now" tabindex="0">1</em>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li class="td td-sum">
                                    <div value="${item.getItemid()}"
                                         class="am-btn am-btn-danger anniu buybook">购买
                                    </div>
                                </li>
                                <li class="td td-op">
                                    <div value="${item.getItemid()}"
                                         class="am-btn am-btn-danger anniu deletebook">移除
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </tr>
            </c:forEach>
        </div>
        <div class="clear"></div>

        <div class="float-bar-wrapper">
            <div id="J_SelectAll2" class="select-all J_SelectAll">
                <div class="cart-checkbox">
                    <input class="check-all check" id="J_SelectAllCbx2" name="select-all" type="checkbox"
                           onclick="selectAll()">
                    <label for="J_SelectAllCbx2"></label>
                </div>
                <span>全选</span>
            </div>
            <div class="operations">
                <a href="#" hidefocus="true" class="deleteAll">删除</a>
            </div>

            <div class="btn-area">
                <a onclick="DeleteAll()" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
                    <span>清空藏书夹</span></a>
            </div>
            <div class="float-bar-right">
                <div class="amount-sum">
                    <span class="txt">已选商品</span>
                    <em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
                    <div class="arrow-box">
                        <span class="selected-items-arrow"></span>
                        <span class="arrow"></span>
                    </div>
                </div>
                <div class="price-sum">
                    <span class="txt">合计:</span>
                    <strong class="price">¥<em id="J_Total">0.00</em></strong>
                </div>
                 <div class="btn-area">
                    <a onclick="submit()" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
                        <span>结&nbsp;算</span></a>
                </div>


            </div>
        </div>
    </form>
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