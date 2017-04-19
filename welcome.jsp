<%@page import="p1.Main1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="nl.captcha.Captcha"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%@include file = "header.html" %>
<div id ="main-container">
<br>
<%
                    	String uname=request.getParameter("fullname");
                        String id = request.getParameter("id");
                    	String pass=request.getParameter("pass");
                    	
                    	
                    	try{
                    		Connection conn=Main1.getCon();
                    		String sql="select * from USERS where id=? and pass=?";
                    		
                    		PreparedStatement pst=conn.prepareStatement(sql);
                    		pst.setString(1, uname);
                    		pst.setString(2, pass);
                    		
                    		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);

                    		request.setCharacterEncoding("UTF-8");

                    		String answer = request.getParameter("answer");
                    		
                    		ResultSet rs=pst.executeQuery();
                    		
                    		if(rs.next() && (captcha.isCorrect(answer))){
                    			
                    			String user=rs.getString("uname");
                    			session.setAttribute("u", user);
                    			%>
                    			<jsp:forward page="welcome1.jsp"></jsp:forward>
                    			<%
                    			
                    		}else
                    		{
                    			%>
                    			<jsp:forward page="signin.jsp"></jsp:forward>
                    			<%
                    		}
                    		
                    		
                    	}catch(Exception e){
                    		System.out.println(e);
                    		%>
                    		<jsp:forward page="signin.jsp"></jsp:forward>
                    		<%
                    	}
                    %>
                    </div>
</body>
<%@include file = "footer.html" %>
</html>