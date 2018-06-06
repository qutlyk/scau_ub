<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,cn.yiban.ub.main.*,cn.yiban.ub.mapper.*,cn.yiban.ub.po.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<body>
<%
String userid1 = request.getParameter("user");
String password = request.getParameter("passwd");
String username = new String(request.getParameter("username").getBytes("ISO8859-1"), "UTF-8");
String qq = request.getParameter("qq");
long userid = Long.parseLong(userid1);
User user = new User();
user.setUserid(userid);
user.setPassword(password);
user.setUsername(username);
user.setQq(qq);
Login.testRegisterUser(user);
response.sendRedirect("login.jsp");

%>
</body>
</html>