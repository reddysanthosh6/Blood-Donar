<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 


String name=request.getParameter("username");

Connection connection=DBConnection.getConnection();
 ResultSet rs =  connection.createStatement().executeQuery("select username from profile where username like '%"+name+"%'");

if(rs.next()){
%>	
<span style='color:red'> username not Avalible</span>
<input type='hidden' name='availablity_status' value='0'>
<%
}else{
	%>	
	
	<span style='color:green'> username Avalible</span>
	<input type='hidden' name='availablity_status' value='1'>
	<%
}
%>
