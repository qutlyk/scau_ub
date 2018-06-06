<%@ page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head lang="en">
		<meta charset="UTF-8">
		<title>修改密码</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
<script type="text/javascript" src="JSP/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="JSP/js/login.js"></script>
<link rel="stylesheet" href="JSP/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="JSP/css/dlstyle.css" rel="stylesheet" type="text/css">
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"8123",secure:"8124"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body>

		<div class="login-boxtitle">
			<a href="index.html"><img alt="" src="JSP/images/logobig.png" /></a>
		</div>

		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="JSP/images/bg.png" /></div>
				<div class="login-box">

						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
								<li class="am-active"><a href="">修改密码</a></li>
								<!-- <li><a href="">手机号注册</a></li> //第二个标签 -->
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
								<div id="userCue" class="cue"></div>
									<form name="form2" id="regUser" accept-charset="utf-8"  action="modifyPwd2.jsp" method="post" >
										<input type="hidden" name="to" value="reg"/>
		      		       				<input type="hidden" name="did" value="0"/>
		      		       				
		      		       			<div class="user-email">	
										<label for="user"><i class="am-icon-user"></i></label>
										<input type="text" id="userid" name="userid" maxlength="16" class="inputstyle2" placeholder="请输入您的学号">
              						</div>
               						 <div class="user-email">
										<label for="user"><i class="am-icon-phone"></i></label>
										<input  type="text" id="phonenum" name="phonenum" maxlength="16" class="inputstyle2" placeholder="请输入您的手机号码">
               						 </div>										
                 					 <div class="user-email">
										<label for="email"><i class="am-icon-qq"></i></label>
										<input  type="text" id="qq" name="qq" maxlength="10"  placeholder="请输入QQ号码">
                 					</div>	
                 					 <div class="user-pass">
							 			<label for="password"><i class="am-icon-lock"></i></label>
										<input type="password" id="passwd"  name="passwd" maxlength="16"  placeholder="输入新的密码">
                 					</div>										
                 					<div class="user-pass">
										<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
										<input type="password" name="passwd2" id="passwd2" maxlength="16" placeholder="确认密码">
                 					</div>	
                 					</form>
                 
								 
										<div class="am-cf">
											<input type="button"  id="changepw"  name="" value="确认修改" class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>

								</div>

								<!-- <div class="am-tab-panel">
									<form method="post">
                 <div class="user-phone">
								    <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
								    <input type="tel" name="" id="phone" placeholder="请输入手机号">
                 </div>																			
										<div class="verification">
											<label for="code"><i class="am-icon-code-fork"></i></label>
											<input type="tel" name="" id="code" placeholder="请输入验证码">
											<a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
												<span id="dyMobileButton">获取</span></a>
										</div>
                 <div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="" id="password" placeholder="设置密码">
                 </div>										
                 <div class="user-pass">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="password" name="" id="passwordRepeat" placeholder="确认密码">
                 </div>	
									</form>
								 <div class="login-links">
										<label for="reader-me">
											<input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
										</label>
							  	</div>
										<div class="am-cf">
											<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>
								
									<hr>
								</div> -->

								<!-- <script>
									$(function() {
									    $('#doc-my-tabs').tabs();//打开分页标签的
									  })
								</script> -->

							</div>
						</div>
				</div>
			</div>
			
			<div class="footer ">
				<div class="footer-hd ">
					<p><a href="index.html">商城首页</a></p>
				</div>
				<div class="footer-bd">
					<p><center><em>© 2015-2025 SCAU_Used_Book 版权所有. </em></center></p>
				</div>
			</div>
	</body>
</html>