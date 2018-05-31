<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,cn.yiban.ub.main.*,cn.yiban.ub.mapper.*,cn.yiban.ub.po.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证用户信息的正确性</title>
</head>
<body>
<%
String userid1 = request.getParameter("userid");
String password = request.getParameter("p");
long userid = Long.parseLong(userid1);
User user = Login.testCheckUser(userid);
if(user.getPassword().equals(password)){
	response.sendRedirect("home1.jsp");
}
else {
	response.sendRedirect("login.jsp");
}
%>
<%=user.getMoney() %>
<%=password %>
</body>
</html>