<%@ page errorPage="ShowError.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,cn.yiban.ub.po.*,cn.yiban.ub.main.*"%>
<%@ page import="cn.yiban.open.Authorize,java.io.*,javax.servlet.*,java.util.Map,net.sf.json.JSONArray,net.sf.json.JSONObject,java.util.HashMap,util.Stream" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
            
			//判断易班网薪是否支付成功
// 			String trade_wx_str = request.getParameter("trade_wx");
// 			JSONObject   trade_wx= JSONObject.fromObject(trade_wx_str);//解析  trade_wx 的 json 表达式
// 	        String trade_wx_json = trade_wx.toString();// trade_wx 的总json表达式；
// 	        String trade_wx_status = trade_wx.getString("status"); //将 trade_wx 的总json表达式 中的 status 解析出来；
// 	        if(trade_wx_status.equals("success")||trade_wx_status=="success"){
		        
// 	        }
// 	        else{
// 	        	response.sendRedirect("payUnsuccessfully.jsp?userid="+useridstr);
// 	        }
			int result;
			String useridstr="";
			String hrefuser="";
			User user = new User();
			String sum="";
			String itemid_paying = "";
			if(request.getParameter("merge")!=""&&request.getParameter("merge")!=null){//从易班收银台回来
				String[] merge = request.getParameter("merge").split("A");	
				useridstr = merge[0];
		        sum =merge[1];//已支付的总金额；
		        hrefuser="?userid="+useridstr;
		        user=Login.testCheckUser(Long.parseLong(useridstr));
			    result=0; 
			}
			else {
				String[] itemid =request.getParameterValues("itemid");//获取所有成功支付的itemid
				itemid_paying = itemid[0];
				useridstr=request.getParameter("userid");
		        user=Login.testCheckUser(Long.parseLong(useridstr));
		        hrefuser="?userid="+user.getUserid();
				 sum = request.getParameter("sum");
				  result=CheckData.payitem(useridstr, itemid, sum); //扣钱
			}
				

			
		
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet"  type="text/css" href="./JSP/AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="./JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="./JSP/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="JSP/css/personal.css" rel="stylesheet" type="text/css">
<link href="./JSP/css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="./JSP/basic/js/jquery-1.7.min.js"></script>

</head>

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

<div class="take-delivery">

<% if(result==0){
String YIbanpayURL= "YIBANpay.jsp?sum="+sum+"&userid="+useridstr+"&itemid="+itemid_paying;
if(request.getParameter("trade_end")==""||request.getParameter("trade_end")==null){
	response.sendRedirect(YIbanpayURL);// 调用易班支付接口
}
else{
%>
 <div class="status">
   <h2>您已成功付款</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额:￥<em><%=sum %></em></li>
       <div class="user-info">
         <p>收货人：<%=user.getUsername() %></p>
         <p>联系电话：<%=user.getPhonenumber() %></p>
         <p>QQ号码：<%=user.getQq() %></p>
         <p>收货地址：<%=user.getAdress() %></p>
       </div>
             请认真核对您的收货信息，如有错误请联系客服
                               
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="order.jsp<%=hrefuser %>" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
     </div>
    </div>
    <%}}else if(result==1){ %>
    <div class="status">
   <h2 ><font color="#FF0000">此商品已告罄，请另选</font>></h2>
   <div class="successInfo">
     <ul>
      
                               
     </ul>
     
    </div><%}else if(result==2){ %>
    <div class="status">
   <h2 ><font color="#FF0000">不允许买自己的商品</font></h2>
   <div class="successInfo">
     
     <div class="option">
       <span class="info">您可以</span>
        <a href="sellinfo.jsp<%=hrefuser %>" class="J_MakePoint">查看<span>自己的商品</span></a>
     </div>
    </div>
    <%}else if(result==3){ %>
    <div class="status">
   <h2 ><font color="#FF0000">资金不足</font>></h2>
   <div class="successInfo">
     <ul>
       <li>须付款金额:￥<em><%=sum %></em></li>
       <li>你的虚拟币:￥<em><%=user.getMoney() %></em></li>
             请认真核对您的信息，如有错误请联系客服
                               
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="order.jsp<%=hrefuser %>" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
     </div>
    </div>
    
    <%} %>
  </div>
</div>


			<div class="footer ">
			<div class="footer-bd">
				<p><center><em>© 2015-2025 SCAU_Used_Book 版权所有. </em></center></p>
			</div>
		</div>


</body>
</html>