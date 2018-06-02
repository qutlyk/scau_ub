
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="model.Model" %>

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

<title>旧书信息填写</title>

<link href="../../JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../../JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../../JSP/css/personal.css" rel="stylesheet" type="text/css">
<link href="../../JSP/css/addstyle.css" rel="stylesheet" type="text/css">

<script src="../../JSP/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="../../JSP/AmazeUI-2.4.2/assets/js/amazeui.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#submitbookbtn').click(function() {



			//alert("开始提交");
			// alert($("#book-name").val()+$("#book-price").val()+$("#book-version").val()+$("#book-author").val()
			// +$("#book-kind").val()+$("#book-remarks").val()+$("#user-phone").val()+$("#user-qq").val()+$("#user-address").val());
			if ($("#book-name").val() == "" || $("#book-price").val() == "" || $("#book-version").val() == "" || $("#book-author").val() == "" || $("#book-remarks").val() == "" || $("#user-phone").val() == "" || $("#user-qq").val() == "") {
				alert("请填完所有信息");
			} else {
				var result = confirm('是否上架');
				if (result) {
					$.ajax({
						type : "POST",
						url : "BookServlet",
						data : {
							"bookname" : $("#book-name").val(),
							"price" : $("#book-price").val(),
							"press" : $("#book-press").val(),
							"book-version" : $("#book-version").val(),
							"book-author" : $("#book-author").val(),
							"kind" : $("#book-kind").val(),
							"other" : $("#book-remarks").val(),
							"images" : $("#up_img").val(),
							"sellerid" : $("#user-id").val(),
							"phone" : $("#user-phone").val(),
							"qq" : $("#user-qq").val(),
							"address" : $("#user-addressdd").val()
						},
						success : function(msg) {
							var dataObj = eval("(" + msg + ")");
							if (dataObj.length < 2) {

								alert("提交失败");


							} else {
								alert("提交成功");
							//$('#userCue1').html("<font color='red'><b>登录页成功</b></font>");
							}
						}
					});
				}
			document.upload.submit();
			}

		});

		$('#savebookbtn').click(function() {
			alert("已保存，下次登录可继续编辑");
		});

	});
	
	
</script>
<script type="text/javascript">
function tip(){
	var a1 = document.getElementById("user-addressdd").value;
	var a2 = document.getElementById("user-phone").value;
		if(a1==""||a2==""){
			alert("请先前往'个人信息'处完善个人信息");
		}
}
</script>

</head>

<body onload="tip()">
	<!--头 -->
	<header> <article>
	<div class="mt-logo">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="information" target="_top" class="h" style="color:#000000" >欢迎你&nbsp&nbsp,</a>
						&nbsp
						<a href="index" target="_top" class="h"  style="color:#0033ff" text-decoration="underline">退出登录</a>
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
							class="am-icon-shopping-cart  am-icon-fw"></i><span>藏书夹</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
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
			<!--  <div class="logo"><img src="../../JSP/images/logo.png" /></div>-->
				<div class="logoBig">
					<li><img src="../../JSP/images/logobig.png" /></li>
				</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form action="search.jsp">
					<input type="hidden" value="${sessionScope.user.getUserid() }" id="userid"
						name="userid"> <input id="searchInput"
						name="index_none_header_sysc" type="text" placeholder="搜索"
						autocomplete="on"> <input id="ai-topsearch"
						class="submit am-btn" value="搜索" index="1" type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>
	</article> </header>
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

				<div class="user-address">
					<!--标题 -->

					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">


							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">旧书信息填写</strong> / <small>Add&nbsp;usedbook&nbsp;information</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form id="upload" name="upload" method="post"
									class="am-form am-form-horizontal"
									action="UploadServlet?${sessionScope.user.getUserid() }"
									enctype="multipart/form-data">
									<!--  <form class="am-form am-form-horizontal"> -->
									<div class="am-form-group">
										<label for="book-name" class="am-form-label">书名</label>
										<div class="am-form-content">
											<input type="text" id="book-name" placeholder="书名">
										</div>
									</div>

									<div class="am-form-group">
										<label for="book-price" class="am-form-label">价格</label>
										<div class="am-form-content">
											<input type="text" id="book-price" placeholder="虚拟书币">
										</div>
									</div>
									<div class="am-form-group">
										<label for="book-press" class="am-form-label">出版社</label>
										<div class="am-form-content">
											<input type="text" id="book-press" placeholder="出版社">
										</div>
									</div>
									<div class="am-form-group">
										<label for="book-version" class="am-form-label">出版年份</label>
										<div class="am-form-content">
											<input type="text" id="book-version" placeholder="年份">
										</div>
									</div>

									<div class="am-form-group">
										<label for="book-author" class="am-form-label">作者/主编</label>
										<div class="am-form-content">
											<input type="text" id="book-author" placeholder="作者/主编">
										</div>
									</div>

									<div class="am-form-group">
										<label for="book-kind" class="am-form-label">专业类别</label>
										<div class="am-form-content address">
											<select id="book-kind" data-am-selected>
												<%
													for (String kind : Model.bookkindlist) {
												%>
												<option value="<%=kind%>" selected><%=kind%></option>
												<%
													}
												%>
											</select>
										</div>
									</div>

									<div class="am-form-group">
										<label for="book-remarks" class="am-form-label">备注</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="book-remarks"
												placeholder="100字以内写出你的旧书详细信息.."></textarea>

										</div>
									</div>




									<script src="../../JSP/js/uploadPreview.js" type="text/javascript"></script>
									<script>
										window.onload = function() {
											new uploadPreview({
												UpBtn : "up_img",
												DivShow : "imgdiv",
												ImgShow : "imgShow"
											});
											var a1 = document.getElementById("user-addressdd").value;
											var a2 = document.getElementById("user-phone").value;
											var str = document.getElementById("tool").value;
												if(a1==""||a2==""){
													alert("请先前往'个人信息'处完善个人信息");
													window.location.href = "information.jsp?userid="+str;
												}
										}
									</script>
									<div id="imgdiv">
										<img id="imgShow" width="100" height="100" />
									</div>
									<input type="file" id="up_img" name="uploadFile" /></br>
									<div ><font color="#FF0000">请上传一张清晰的旧书封面照</font></div> 
									<b class="line"></b> 

									<div class="am-cf am-padding">
										<div class="am-fl am-cf">
											<strong class="am-text-danger am-text-lg">填写你的联系方式</strong> /
												<small>your&nbsp;address&nbsp;information</small>
										</div>
									</div>

									<input type="hidden" value="<%=session.getAttribute("yb_userid") %>" id="yb_userid">
									<div class="am-form-group">
								<label for="user-addressdd" class="am-form-label">宿舍地址</label>
								<div class="am-form-content">
									<input value="${sessionScope.user.getAdress() }" id="user-addressdd"
										placeholder="请到个人信息处先完善" type="tel" >

								</div>
							</div>

									<div class="am-form-group">
									
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content" >
									
											<input value="${sessionScope.user.getPhone() }" id="user-phone"
												placeholder="请到个人信息处先完善" type="email" >
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-qq" class="am-form-label">QQ号码</label>
										<div class="am-form-content">
											<input value="${sessionScope.user.getQq() }" id="user-qq"
												placeholder="QQ号必填" type="email">
										</div>
									</div>


									<br> <br> <br>
									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<a id="submitbookbtn" class="am-btn am-btn-danger"
												>提交审核</a>
											<!--  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <a
												id="savebookbtn" class="am-close am-btn am-btn-daveer"
												data-am-modal-close>暂时保存</a>-->
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
					$(document).ready(function() {
						$(".new-option-r").click(function() {
							$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
						});
				
						var $ww = $(window).width();
						if ($ww > 640) {
							$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
						}
				
					})
				</script>

				<div class="clear"></div>

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
					<li ><a href="information">个人信息</a></li>
<!-- 					<li><a href="modifyPwd.jsp">密码修改</a></li> -->
				</ul></li>
			<li class="person">&lt;我的订单 >
				<ul>
					<li><a href="order">订单详情</a></li>
				</ul></li>
			<li class="person">&lt;旧书交易 >
				<ul>
					<li><a href="bookinfo">旧书上架</a></li>
					<li><a href="sellinfo">出售详情</a></li>
				</ul></li>


		</ul>

		</aside>
	</div>

</body>

</html>