<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>

<%
	if(session.getAttribute("userid")!=null)
		session.removeAttribute("userid");
		response.sendRedirect("login.jsp"); //choose between this line or the html part
%>

<html>
<HEAD><TITLE>Logout Page</TITLE></HEAD>
  <BODY>
    You have been logged out. <br>
    <a href= "login.jsp"> Back to login page. </a>    
  </BODY>
</html>