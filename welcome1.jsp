<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%@include file="header.html"%>
<%@include file = "horizontal.jsp" %>
<div id="main-container">
<h1 style="color: red;">Welcome: <%=session.getAttribute("id") %></h1>
<div style="border-bottom:3px solid black;"></div>
<br><br><br>
<%@include file="myprofile.jsp" %>
</div>
<%@include file="footer.html" %>
</body>
</html>