<%@ page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,cn.yiban.ub.po.*,cn.yiban.ub.main.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>我的订单</title>
		<link href="./JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="./JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="./JSP/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="./JSP/css/personal.css" rel="stylesheet" type="text/css">
		<link href="./JSP/css/orstyle.css" rel="stylesheet" type="text/css">
		<script src="./JSP/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="./JSP/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript">
		function affirmGoods(Str){//确认收货
		
			var xmlhttp;
			xmlhttp=new XMLHttpRequest();
			xmlhttp.onreadystatechange=function(){
				if(xmlhttp.readyState==4 && xmlhttp.status==200){
					window.location.reload(true);
					//alert("确认收货，itemid为"+Str);
				}
			}
			var userid=$('#useridthe').val();
			xmlhttp.open("GET","confirmGoods.jsp?userid="+userid+"&itemid="+Str,true);
			xmlhttp.send();
		}

		

		
		</script>
		
<script type="text/javascript">
	$(document).ready(function() {
	//delete boo infomation which in the mysql
	$('.anniu.deletebook').click(function() {
			//这个就是jquer循环获取的class对象 你可以用来处理你的逻辑alert($(this).val());
			var theitemid = $(this).attr("value");
			alert("确定删除编号为  :" + theitemid + " 的商品吗？");
			$("#" + theitemid + "").remove();

			 $.ajax({
				type : "POST",
				url : "OrderinfoServlet",
				data : {
					"operakind" : 1,
					"Itemid" : theitemid,
				},
				success : function(msg) {
					var dataObj = eval("(" + msg + ")");
					if (dataObj.length < 2) {

						alert("下架商品失败，请等待服务器信息");


					} else {
						alert("下架商品成功");
					//$('#userCue1').html("<font color='red'><b>登录页成功</b></font>");
					}
				},
				error : function(e) {
					alert('数据连接失败', e);
				}
			}); 
		});
		});

		</script>
	</head>
	<body>
	<%
	        String useridstr= request.getParameter("userid");
	   	 	User user=Login.testCheckUser(Long.parseLong(useridstr));
	    	String hrefuser="?userid="+user.getUserid();
	        
			ArrayList<Item> orders_hadSended = new ArrayList<Item>();
			ArrayList<Item> orders_hadReceived = new ArrayList<Item>();
			ArrayList<Item> orders_all = CheckData.getOrderItem(user);
			
			
			for(Item it:orders_all){
			if(it.getStatus()==1){
			orders_hadSended.add(it);
			}else if(it.getStatus()==2){
			orders_hadReceived.add(it);
			}
			}
			
			Collections.reverse(orders_hadSended); //实现倒序
			Collections.reverse(orders_hadReceived);//实现倒序
			/* 
			Item item1=new Item();
			Item item2=new Item();
			item1.setBookname("高等数学");
			item2.setBookname("大学英语");
			item1.setPrice(12);
			item2.setPrice(14);
			item1.setPress("高等教育出版社");
			item2.setPress("外语出版社");
			item1.setStatus(1);
			item2.setStatus(2);
			item1.setItemid(1513156);
			item2.setItemid(1561564);
			orders_hadSended.add(item1);
			orders_hadReceived.add(item2);
			orders_all.add(item1);
			orders_all.add(item2); */
			String blank = "";
 	%>  
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
					<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="information.jsp<%=hrefuser%>" target="_top" class="h" style="color:#000000" >欢迎你&nbsp<%=user.getUsername() %>&nbsp,</a>
						&nbsp
						<a href="index.html" target="_top" class="h"  style="color:#0033ff" text-decoration="underline">退出登录</a>
					</div>
				</div>
			</ul>
				<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="home1.jsp<%=hrefuser %>" target="_top" class="h"><i class="am-icon-home am-icon-fw" ></i>商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="information.jsp<%=hrefuser %>" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="shopcart.jsp<%=hrefuser %>" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>藏书夹</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="exchange.jsp<%=hrefuser %>" target="_top"><i class="am-icon-book am-icon-fw"></i><span>旧书交易</span></a></div>
						</ul>
				</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logo"><img src="JSP/images/logo.png" /></div>
				<div class="logoBig">
					<li><img src="JSP/images/logobig.png" /></li>
				</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form action="search.jsp">
				<input type="hidden" value="<%=user.getUserid()%>" id="userid" name="userid">
				<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="on"> 
				<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit" >
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
				<li class="index"><a href="home1.jsp<%=hrefuser%>">商城首页</a></li>
				<li class="qc"><a href="search.jsp<%=hrefuser %>&index_none_header_sysc=<%=blank%> ">旧书列表</a></li>			
				<li class="qc"><a href="information.jsp<%=hrefuser%>">个人中心</a></li>
				<li class="qc"><a href="shopcart.jsp<%=hrefuser%>">我的藏书夹</a></li>
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
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的订单</strong> / <small>Orders</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li><a href="#tab5">已付款</a></li>
								<li><a href="#tab4">已收货</a></li>
							</ul>

							<div class="am-tabs-bd">
									
								<!--已发货订单-->
								<div class="am-tab-panel am-fade" id="tab5">
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
<% 			
			for(int i =0 ;i<orders_hadSended.size();i++){
					Item item = new Item();
					item = orders_hadSended.get(i);
%>
									<div class="order-main">
										<div class="order-list">
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><%=item.getItemid() %></a></div>
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="introduction.jsp<%=hrefuser+"&itemid="+item.getItemid() %>" class="J_MakePoint">
																		<img src="upload/<%= item.getImages() %>" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		
																			<a href="introduction.jsp<%=hrefuser+"&itemid="+item.getItemid() %>"><p><%=item.getBookname() %></p></a>
																			<p class="info-little">出版社：
																				<%=item.getPress() %> </p>
																				<p class="info-little">作者/主编：
																				<%=item.getAuthor()%></p>
																		
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	¥<%=item.getPrice() %>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>1
																</div>
															</li>
															<li class="td td-operation">
															<div class="item-operation">
															<%
																	User seller=Login.testCheckUser((item.getSellerid()));
																%>	
																
																<div align="left">卖家：<%=seller.getUsername()%></div>
																<div align="left">手机：<%=
																		seller.getPhonenumber()
																 %></div>
																<div align="left">qq号 :<%=
																		seller.getQq()
																  %></div>
																<div align="left">宿舍：<%=
																		seller.getAdress()
																 %></div>
															</div>
														</li>
														</ul>
													</div>

													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：¥<%=item.getPrice() %>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																</div>
															</li>
															<li class="td td-change" onclick="affirmGoods(this.id)" id="<%=item.getItemid() %>">
																<div class="am-btn am-btn-danger anniu" >
																	确认收货</div>
															</li>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
<%} %>
								</div>
								<!--买家已收货订单-->
								<div class="am-tab-panel am-fade" id="tab4">
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
<%
			for(int i =0 ;i<orders_hadReceived.size();i++){
					Item item = new Item();
					item = orders_hadReceived.get(i);
%>
									<div id="<%=item.getItemid() %>" class="order-main">
										<div class="order-list">
											<!--可以删除的订单	-->
											<div class="order-status4">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;"><%=item.getItemid() %></a></div>
												</div>
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="introduction.jsp<%=hrefuser+"&itemid="+item.getItemid() %>" class="J_MakePoint">
																		<img src="upload/<%=item.getImages() %>" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="introduction.jsp<%=hrefuser+"&itemid="+item.getItemid() %>">
																			<p><%=item.getBookname() %></p></a>
																			<p class="info-little">出版社：
																				<%=item.getPress() %> </p>
																				<p class="info-little">作者/主编：
																				<%=item.getAuthor()%></p>
																		
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	¥<%=item.getPrice() %>
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>1
																</div>
															</li>
															
															<li class="td td-operation">
															<div class="item-operation">
															<%
																	User seller=Login.testCheckUser((item.getSellerid()));
																%>	
																
																<div align="left">卖家：<%=seller.getUsername()%></div>
																<div align="left">手机：<%=
																		seller.getPhonenumber()
																 %></div>
																<div align="left">qq号 :<%=
																		seller.getQq()
																  %></div>
																<div align="left">地址：<%=
																		seller.getAdress()
																 %></div>
															</div>
														</li>
														</ul>

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：¥<%=item.getPrice() %>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																</div>
															</li>
															<li class="td td-change" >
																<li class="td td-change">
																	<div value="<%=item.getItemid()%>"
																		class="am-btn am-btn-danger anniu deletebook">删除记录</div>
																</li>
															</li>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
<%} %>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!--底部-->
				<div class="footer ">
			<div class="footer-bd">
				<p><center><em>© 2015-2025 SCAU_Used_Book 版权所有. </em></center></p>
			</div>
		</div>
		</div>

		<aside class="menu">
		<ul>
			<li class="person">个人中心</li>
			<li class="person">&lt;个人资料 >
				<ul>
					<li ><a href="information.jsp<%=hrefuser%>">个人信息</a></li>
<!-- 					<li><a href="modifyPwd.jsp">密码修改</a></li> -->
				</ul></li>
			<li class="person">&lt;我的订单 >
				<ul>
					<li><a href="order.jsp<%=hrefuser%>">订单详情</a></li>
				</ul></li>
			<li class="person">&lt;旧书交易 >
				<ul>
					<li><a href="bookinfo.jsp<%=hrefuser%>">旧书上架</a></li>
					<li><a href="sellinfo.jsp<%=hrefuser%>">出售详情</a></li>
				</ul></li>


		</ul>

		</aside>
		</div>

	</body>

</html>