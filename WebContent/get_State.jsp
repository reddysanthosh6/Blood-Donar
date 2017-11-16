<%@page import="dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%Connection connection=DBConnection.getConnection();
String State=request.getParameter("State");
System.out.println(State);
ResultSet rs = connection.createStatement().executeQuery("select State District from State_District_City where State='"+State+"'");

while(rs.next()){
	
	

 out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
 
 
 }%>
