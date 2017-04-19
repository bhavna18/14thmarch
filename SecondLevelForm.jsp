<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.util.*,java.sql.*,p1.Main1"%>
<HTML>
<head>
<%@include file="header.html"%>
<%@include file = "horizontal.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<br><br><br>
<link rel= "stylesheet" href="css/styles.css"/>
<style>
.button{
background-color: #fed136;
border: none;
border-radius: 3px;
color: white;
padding: 15px 32px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 16px;
margin: 4px 2px;
cursor: pointer;
}
.button:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
    }
#text{
width: 50%;
height: 10%;
}
table{
margin-top: 5%;
border-style: none;
border-collapse: collapse;}
th, td {
    padding: 15px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}
</style>
</head>
<center>
<FORM ACTION="checkSecondLevel.jsp" METHOD=POST name="checkForm">
<div id="main-container">
<%-- <%
try
{
	Connection con=Main1.getCon();
 	PreparedStatement ps=con.prepareStatement("select id, from USERS where ID=?");
 	ps.setString(1, (String)session.getAttribute("id"));
 	ResultSet rs=ps.executeQuery();
 	if(rs.next());
 	{
 		
 	out.println(" ");
 	%> --%>
 	<label> User Id: </label>
  <input type="text"  id="id" name="id" <%-- value='<%= rs.getString(1) %>' --%> >	<br><br> 
<table border="2">
  <tr>
    <td class="box5"><center>Yellow</center></td>
    <td class="box1"><center>Red</center></td>
    <td class="box3"><center>Orange</center></td>
    <td class="box2"><center>Blue</center></td>
    <td class="box4"><center>Green</center></td>
  </tr>
  <tr>
    <td><center><input type="number" minlength='1' maxlength='100' name="box5" id="box5" style="width:35%"></center></td>
    <td><center><input type="number" minlength='1' maxlength='100' name="box1" id="box1" style="width:35%"></center></td>
    <td><center><input type="number" minlength='1' maxlength='100' name="box3" id="box3" style="width:35%"></center></td>
    <td><center><input type="number" minlength='1' maxlength='100' name="box2" id="box2" style="width:35%"></center></td>
    <td><center><input type="number" minlength='1' maxlength='100' name="box4" id="box4" style="width:35%"></center></td>
  </tr>
</table>
<br><br>
<button class="button" type="submit">Login</button>
</div>
<%-- <%} 
}
 catch(Exception e)
 {
	 System.out.println(e);
 }
%> --%>
</FORM>
</center>
<%@include file = "footer.html" %>
</HTML>


