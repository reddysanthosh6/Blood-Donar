<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try{
if(!session.getAttribute("username").equals("null")){
	session.invalidate();
	response.sendRedirect("index.jsp?message=logout");
}else{%>
	<h1>session is not invalid</h1><%
	
}
}catch(Exception e){
	System.out.println("Session is not invalid");
	response.sendRedirect("index.jsp");
}

%>

</body>
</html>