<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*,p1.Main1,java.io.*" %>
<%
    String userid = request.getParameter("id");
    String firstField = request.getParameter("box1");  
	String secondField = request.getParameter("box2");
	String thirdField = request.getParameter("box3");
	String fourthField = request.getParameter("box4");
	String fifthField = request.getParameter("box5");
	
	String pwd="#ff0000"+firstField+"#0000ff"+secondField+"#ffa500"+thirdField+"#008000"+fourthField+"#ffff00"+fifthField;

    Connection conn = p1.Main1.getCon();
    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from  SECONDLEVEL where ID='" + userid + "' and SECONDPASS='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("id", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("welcome1.jsp");
    } else {
        out.println("Invalid password <a href='signin.jsp'>try again</a>");
    }
%>
