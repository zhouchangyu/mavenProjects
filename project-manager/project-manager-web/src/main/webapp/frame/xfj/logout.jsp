<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/header/header.jsp" %>
	<%
		session.invalidate();
		out.println("<script language='javascript'>alert('确定要注销吗？');"+"window.top.location.href='../login/login.jsp';</script>");
	%>
</head>
<body onload="doInit()" >


</body>

</html>
