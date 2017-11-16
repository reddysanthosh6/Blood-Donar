<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
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
<% 
String donatedate=request.getParameter("donatedate");
	 String patientname=request.getParameter("patientname");
	 String location=request.getParameter("location");
	 String hospitalname=request.getParameter("hospitalname");
	 String bloodtype=request.getParameter("bloodtype");
	 
	 
	 Connection connection=DBConnection.getConnection();
	 Statement statement=null;int id=0;
		statement = connection.createStatement();

	  ResultSet res = statement.executeQuery("select max(id) from donateblooddetails");

		while (res.next()) {
			if (res.getInt(1) == 0) {
				id = 1;
			} else {
				id = res.getInt(1) + 1;
			}
		}
	  
	 try {
		PreparedStatement pstatement=connection.prepareStatement("insert into donateblooddetails values(?,?,?,?,?,?,?)");
		pstatement.setInt(1,id);
		pstatement.setString(2,donatedate);
		pstatement.setString(3,patientname);
		pstatement.setString(4,location);
		pstatement.setString(5,hospitalname);
		pstatement.setString(6,bloodtype);
		pstatement.setString(7, (String)session.getAttribute("username"));
		
	int	success = pstatement.executeUpdate();
		
		response.sendRedirect("userHome.jsp?register=sucess");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 %>
	 
	 


</body>
</html>