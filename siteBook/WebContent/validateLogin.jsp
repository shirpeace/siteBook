<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>

<%
	String userid = request.getParameter("userName");
	String pass = request.getParameter("pass");
	
	if (userid.equals("Admin") && pass.equals("Admin")) {
		session.setAttribute("userid", userid);
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("login.jsp"); //and add an alert
		
	}
%>