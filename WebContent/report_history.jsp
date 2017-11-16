<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
Connection connection=DBConnection.getConnection();
 ResultSet report_history =   connection.createStatement().executeQuery("select phone ,report_information from user_report where username='"+request.getParameter("username")+"'");
%>
<table class='table table-condensed'>
<tr><th>PHONE</th><th>Infromation</th></tr>
<% 
while(report_history.next()){
%>
<tr><td><%=report_history.getString(1) %></td><td><%=report_history.getString(2) %></td></tr>

<%

}
%>

</table>
</body>
</html>