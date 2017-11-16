<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Connection connection=DBConnection.getConnection();
String District=request.getParameter("District");
ResultSet rs = connection.createStatement().executeQuery("select Distinct City from State_District_City where District='"+District+"'");
while(rs.next()){
	
	
	
 out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
 
 
 } %>

</body>
</html>