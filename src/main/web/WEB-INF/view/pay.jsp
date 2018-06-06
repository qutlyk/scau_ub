<%@ page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport"
      content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>结算页面</title>

    <link href="JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>

    <link href="JSP/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link href="JSP/css/cartstyle.css" rel="stylesheet" type="text/css"/>
    <link href="JSP/css/jsstyle.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="JSP/js/address.js"></script>
    <script type="text/javascript">
        function typeOfTransmit(Str) {
            var transmits = document.getElementsByName("transmit");
            for (var i = 0; i < transmits.length; i++) {
                transmits[i].innerHTML = Str;
            }
            var count;
            //alert(document.getElementById("a1").value);
            if (document.getElementById("a1").value == "")
                count = 0;
            else
                count = parseInt(document.getElementById("a1").value);
            count += 1;
            document.getElementById("a1").value = count;
        }

        function submit() {
            var a1 = document.getElementById("a1").value;
            var a2 = document.getElementById("a2").value;
            if (a1 == "")
                a1 = 0;
            else
                a1 = parseInt(a1);
            if (a2 == "")
                a2 = 0;
            else
                a2 = parseInt(a2);
            if (a1 % 2 == 0) {
                alert("请选择交易方式");
            }
            else if (a2 % 2 == 0) {
                alert("请选择支付方式");
            }
            else {
                document.getElementById("form_payOrders").submit();
            }
        }

        function judge2() {
            var count;
            //alert(document.getElementById("a2").value);
            if (document.getElementById("a2").value == "")
                count = 0;
            else
                count = parseInt(document.getElementById("a2").value);
            count += 1;
            document.getElementById("a2").value = count;
        }
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
<div class="concent">
    <!--地址 -->
    <div class="paycont">
        <div class="address">
            <h3>确认收货地址 </h3>
            <div class="clear"></div>
            <ul>
                <div class="per-border"></div>
                <li class="user-addresslist defaultAddr">

                    <div class="address-left">
                        <div class="user DefaultAddr">


                            <span class="buy-line-title">收货人：</span>${user.getUsername()}
                            <span class="buy-address-detail">
                                                 <br>
												<span class="buy-phone">手机：</span>${user.getPhonenumber()}
												<br>
										        <span class="street">地址：${user.getAdress() }</span>
										</span>
                        </div>
                        <ins class="deftip">默认地址</ins>
                    </div>
                    <div class="address-right">
                        <a href="../person/address.html">
                            <span class="am-icon-angle-right am-icon-lg"></span></a>
                    </div>
                    <div class="clear"></div>
                </li>
                <div class="per-border"></div>
            </ul>

            <div class="clear"></div>
        </div>
        <!--物流 -->
        <div class="logistics">
            <h3>选择交易方式</h3>
            <ul class="op_express_delivery_hot">
                <li class="pay taobao" onclick="typeOfTransmit(this.id)"><img src="JSP/images/facetoface.jpg"/>当面交易<span></span>
                </li>
            </ul>
        </div>
        <div class="clear"></div>

        <!--支付方式-->
        <div class="logistics">
            <h3>选择支付方式</h3>
            <ul class="pay-list">
                <li class="pay taobao" onclick="judge2()"><img src="JSP/images/moneysmall.jpg"/>虚拟书币<span></span>
                </li>
            </ul>
        </div>
        <div class="clear"></div>

        <!--订单 -->
        <div class="concent">
            <div id="payTable">
                <h3>确认订单信息</h3>
                <div class="cart-table-th">
                    <div class="wp">

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
                            <div class="td-inner">金额</div>
                        </div>
                        <div class="th th-oplist">
                            <div class="td-inner">配送方式</div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <form action="pay.do" method="post" id="form_payOrders">
                    <c:forEach items="${itemlist}" var="it">
                        <tr class="item-list">
                            <div class="bundle  bundle-last">

                                <div class="bundle-main">
                                    <ul class="item-content clearfix">
                                        <div class="pay-phone">
                                            <li class="td td-item">
                                                <div class="item-pic">
                                                    <a href="#" class="J_MakePoint">
                                                        <img src="upload/${it.getImages() }" class="itempic J_ItemImg"
                                                             height="80" width="80"></a>
                                                </div>
                                                <div class="item-info">
                                                    <div class="item-basic-info">
                                                        <a href="#" class="item-title J_MakePoint"
                                                           data-point="tbcart.8.11">${it.getBookname() }
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="td td-info">
                                                <div class="item-props">
                                                    <span class="sku-line">出版社：</span>
                                                    <span class="sku-line">${it.getPress() }</span>
                                                </div>
                                            </li>
                                            <li class="td td-price">
                                                <div class="item-price price-promo-promo">
                                                    <div class="price-content">
                                                        <em class="J_Price price-now">${it.getPrice() }
                                                        </em>
                                                    </div>
                                                </div>
                                            </li>
                                        </div>
                                        <li class="td td-amount">
                                            <div class="amount-wrapper ">
                                                <div class="item-amount ">
                                                    <span class="phone-title">购买数量</span>
                                                    <div class="sl">
                                                        <em>1</em>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="td td-sum">
                                            <div class="td-inner">
                                                <em tabindex="0" class="J_ItemSum number">${it.getPrice() }
                                                </em>
                                            </div>
                                        </li>
                                        <!--  <li class="td td-oplist">
                                            <div class="td-inner">
                                                <span class="phone-title" >配送方式</span>
                                                <em name="transmit">请选择配送方式</em>
                                            </div>
                                        </li>-->

                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </tr>
                        <div class="clear"></div>
                        <input type="text" name="itemidlist" hidden="hidden" value="${it.getItemid()}">
                    </c:forEach>
                </form>
                <div class="clear"></div>
                <div class="pay-total">
                    <!--留言-->
                    <div class="order-extra">
                        <div class="order-user-info">
                            <div id="holyshit257" class="memo">
                                <label>买家留言：</label>
                                <input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明"
                                       class="memo-input J_MakePoint c2c-text-default memo-close">
                                <div class="msg hidden J-msg">
                                    <p class="error">最多输入500个字符</p>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="clear"></div>
                </div>
                <!--含运费小计 -->
                <div class="buy-point-discharge ">
                    <p class="price g_price ">
                        合计（含运费） <span>¥</span><em class="pay-sum">${sum }
                    </em>
                    </p>
                </div>

                <!--信息 -->
                <div class="order-go clearfix">
                    <div class="pay-confirm clearfix">
                        <div class="box">
                            <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                                <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">${sum}</em>
											</span>
                            </div>

                            <div id="holyshit268" class="pay-address">

                                <p class="buy-footer-address">
                                    <span class="buy-line-title buy-line-title-type">寄送至：</span>
                                    <span class="buy--address-detail">
													<span class="street">${user.getAdress() }</span>
												</span>
                                </p>
                                <p class="buy-footer-address">
                                    <span class="buy-line-title">收货人：</span>${user.getUsername()}
                                    <span class="buy-address-detail">
                                         
												<span class="buy-phone">手机：</span>${user.getPhonenumber()}
												</span>
                                </p>
                            </div>
                        </div>

                        <div id="holyshit269" class="submitOrder">
                            <div class="go-btn-wrap">
                                <a id="J_Go" onclick="submit()" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
                            </div>
                            <input type="hidden" id="a1">
                            <input type="hidden" id="a2">
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="clear"></div>
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
<div class="theme-popover-mask"></div>


<!--标题
<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
</div>
<hr/>
<!--添加新地址的弹框
<div class="am-u-md-12">
    <form class="am-form am-form-horizontal">

        <div class="am-form-group">
            <label for="user-name" class="am-form-label">收货人</label>
            <div class="am-form-content">
                <input type="text" id="user-name" placeholder="收货人">
            </div>
        </div>

        <div class="am-form-group">
            <label for="user-phone" class="am-form-label">手机号码</label>
            <div class="am-form-content">
                <input id="user-phone" placeholder="手机号必填" type="email">
            </div>
        </div>

        <div class="am-form-group">
            <label for="user-phone" class="am-form-label">所在地</label>
            <div class="am-form-content address">
                <select data-am-selected>
                    <option value="a">浙江省</option>
                    <option value="b">湖北省</option>
                </select>
                <select data-am-selected>
                    <option value="a">温州市</option>
                    <option value="b">武汉市</option>
                </select>
                <select data-am-selected>
                    <option value="a">瑞安区</option>
                    <option value="b">洪山区</option>
                </select>
            </div>
        </div>

        <div class="am-form-group">
            <label for="user-intro" class="am-form-label">详细地址</label>
            <div class="am-form-content">
                <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
                <small>100字以内写出你的详细地址...</small>
            </div>
        </div>

        <div class="am-form-group theme-poptit">
            <div class="am-u-sm-9 am-u-sm-push-3">
                <div class="am-btn am-btn-danger">保存</div>
                <div class="am-btn am-btn-danger close">取消</div>
            </div>
        </div>
    </form>
</div>
</div>
<div class="clear"></div>
-->
</body>

</html>