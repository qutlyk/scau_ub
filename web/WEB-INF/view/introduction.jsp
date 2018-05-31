<%@ page errorPage="ShowError.jsp" %>
<%@page import="cn.yiban.ub.main.*"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="cn.yiban.ub.po.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String blank="";
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品页面</title>

		<link href="JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="JSP/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="JSP/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="JSP/css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="JSP/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="JSP/basic/js/quick_links.js"></script>

		<script type="text/javascript" src="JSP/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="JSP/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="JSP/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="JSP/js/list.js"></script>
	</head>
	
<%
    String useridstr= request.getParameter("userid");
    String itemidstr= request.getParameter("itemid");
    
    User user=Login.testCheckUser(Long.parseLong(useridstr));
    Item item=CheckData.getitem(Integer.parseInt(itemidstr));
    
	
	//Item item=Login.
	String hrefuser="?userid="+user.getUserid();
	

 %>
	<body>


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
								<div class="menu-hd"><a id="mc-menu-hd" href="shopcart.jsp<%=hrefuser %>" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>藏书夹</span></a></div>
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
				<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="书名/出版社" autocomplete="on"> 
				<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit" >
				</form>
					</div>
				</div>
                <div class="clear"></div>
			
            <b class="line"></b>
			<div class="listMain">

				<!--分类-->
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">书籍分类</span></div>
					   <div class="nav-cont">
							<ul>
				<li class="index"><a href="home1.jsp<%=hrefuser%>">商城首页</a></li>
				<li class="qc"><a href="search.jsp<%=hrefuser %>&index_none_header_sysc=<%=blank%> ">旧书列表</a></li>
				<li class="qc"><a href="information.jsp<%=hrefuser%>">个人中心</a></li>
				<li class="qc"><a href="shopcart.jsp<%=hrefuser%>">我的藏书夹</a></li>
							</ul>
						  
						</div>
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><a href="#">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>
				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
					
		function submitpay(){
			//document.getElementById("form_shopcart").submit();//如果有选，就允许提交
				window.location.href = "pay.jsp?userid="+$("#theuserid").val()+"&itemid="+$("#bookid").val();
		}
		
		function submitadd(){
			
			$.ajax({
				type : "POST",
				url : "ShopcartServlet",
				data : {
				//2表示加入藏书夹
				    "typekind" :2,
					"userid" : $("#theuserid").val(),
					"itemid" : $("#bookid").val() 					
					},
				success : function(msg) {
					var dataObj = eval("(" + msg + ")");
					if (dataObj.length < 2) {

						alert("添加失败");
					} else {
						//alert("提交成功");
					//$('#userCue1').html("<font color='red'><b>登录页成功</b></font>");
					}
				}
			});
			
			alert("已加入藏书夹");
			window.location.href = "shopcart.jsp?userid="+$("#theuserid").val();
			
	}
				</script>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="upload/<%=URLDecoder.decode(item.getImages(), "utf-8") %>" title="pic" />
								</li>
								
							</ul>
						</div>
					</section>
				</div>

				<!--放大镜-->

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

							<div class="tb-booth tb-pic tb-s310">
								<a><img src="upload/<%=URLDecoder.decode(item.getImages(), "utf-8") %>" alt="细节展示放大镜特效" rel="upload/<%=URLDecoder.decode(item.getImages(), "utf-8") %>" class="jqzoom" /></a>
								<% System.out.println(URLDecoder.decode(item.getImages(), "utf-8"));%>
							</div>
							
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">

						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>	
				 <%=item.getBookname() %>
	          </h1>
						</div>
		<form action="pay.jsp<%=hrefuser %>" id="form_shopcart"	method="POST">
						<div class="tb-detail-list">
							<!---->
							<input  id="theuserid" name="theuserid" value="<%=user.getUserid() %>"  type="hidden" >
							<input  id="bookid" name="items[]" value="<%=item.getItemid() %>"  type="hidden" >
								<li class="price iteminfo_price">
									<dt>易班网薪</dt>
									<dd><em>¥</em><b class="sys_item_price"><%=item.getPrice() %></b>  </dd>                                 
								</li>
								
							</div>

							<div class="introduce">
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-fade am-in am-active">
									<div class="J_Brand">

										<div class="attr-list-hd tm-clear">
											<h4>书籍信息：</h4></div>
										<div class="clear"></div>
										<ul id="J_AttrUL">
										    
											<li title="">作者/主编:&nbsp;<%=item.getAuthor() %></li>
											<li title="">出版社:&nbsp;<%=item.getPress() %></li>
											<li title="">版本:&nbsp;<%=item.getOther() %></li>
											<li title="">专业:&nbsp;<%=item.getKind() %></li>
										</ul>
										<div class="clear"></div>
									</div>


								</div>


							</div>

						</div>

						<div class="clear"></div>

						
					</div>

				</div>

							
							<div class="clear"></div>

							<div class="clear"></div>
						</div>

					<div class="pay">
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a   onclick="submitpay()" id="LikBuy" title="点此按钮到下一步确认购买信息" href="#">立即购买</a>
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a onclick="submitadd()" id="LikBasket" title="加入藏书夹" >加入藏书夹</a>
								</div>
							</li>
		</form>

					</div>

					<div class="clear"></div>

				</div>

				
							
				<!-- introduce-->

			   
			</div>
			<!--菜单 -->
			<div class="footer ">
			<div class="footer-bd">
				<p><center><em>© 2015-2025 SCAU_Used_Book 版权所有. </em></center></p>
			</div>
		</div>

	</body>

</html>