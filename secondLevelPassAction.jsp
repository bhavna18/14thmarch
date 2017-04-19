<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.util.*,java.sql.*,p1.Main1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>secondLevel</title>
</head>
<body>
<%@include file="header.html"%>
<%@include file = "horizontal.jsp" %>
<% 
try
{
	Connection con=p1.Main1.getCon();
	PreparedStatement pst=null;
	String sql="insert into SECONDLEVEL (ID,SECONDPASS) values(?,?)";
	pst=con.prepareStatement(sql);
	//pst = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS); 		
	pst.setString(1, request.getParameter("id"));
	String b1 = request.getParameter("box1");
	String i1 = String.valueOf(b1);
	
	String b2 = request.getParameter("box2");
	String i2 = String.valueOf(b2);
	
	String b3 = request.getParameter("box3");
	String i3 = String.valueOf(b3);
	
	String b4 = request.getParameter("box4");
	String i4 = String.valueOf(b4);
	
	String b5 = request.getParameter("box5");
	String i5 = String.valueOf(b5);
	
	String combinedPass = "#ff0000"+i1+"#0000ff"+i2+"#ffa500"+i3+"#008000"+i4+"#ffff00"+i5;
	pst.setString(2, combinedPass); 
	int x=pst.executeUpdate();		
	if(x>0)
	{
		response.sendRedirect("success.jsp");
	}else
	{
		response.sendRedirect("secondLevel.jsp");
	}
	
	
	
}catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("secondLevel.jsp");
	
}
%>
%>
</body>
</html>