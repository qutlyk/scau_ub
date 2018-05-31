<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Refresh Time</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"8123",secure:"8124"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-0" data-genuitec-path="/ScauUBMarket/WebContent/JSP/Hello.jsp">
<%
response.setIntHeader("Refresh", 5);
response.setContentType("text/html;charset=UTF-8");
Calendar cale = Calendar.getInstance();  
Date tasktime=cale.getTime();  
SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
String nowTime = df.format(tasktime);
String title = "自动刷新 Header 设置 - ";
%>
<center data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-0" data-genuitec-path="/ScauUBMarket/WebContent/JSP/Hello.jsp"><h1><%=title %></h1></center>
<p><%=nowTime %></p>

</body>
</html>