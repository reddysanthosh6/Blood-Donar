<%@page import="dbconnection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RegistrationPage</title>
</head>
<body>
	<%
String fullname,bloodgroup,gender,dob,state,district,city,address,availablity,conformation;
		String username, password, cpassword, email,phonenumber;
		fullname=request.getParameter("fullname");
		bloodgroup=request.getParameter("bloodgroup");
		gender=request.getParameter("gender");
		dob=request.getParameter("dob");
		state=request.getParameter("state");
		district=request.getParameter("district");
		city=request.getParameter("city");
		address=request.getParameter("address");
		availablity=request.getParameter("AvailUnAvailable");
		conformation=request.getParameter("declaration");
		int requeststatus=0;
		if(conformation==null){
		conformation="1";	
		}
		
		username = request.getParameter("username");
		password = request.getParameter("passwd");
		cpassword = request.getParameter("cpasswd");
	    email = request.getParameter("email");
		phonenumber = request.getParameter("mobilenumber");
		

		Connection connection = null;
		PreparedStatement pStatement = null;
		int success, id = 0;
		connection = DBConnection.getConnection();
		Statement statement = connection.createStatement();
		ResultSet res = statement.executeQuery("select max(user_id) from profile");

		while (res.next()) {
			if (res.getInt(1) == 0) {
				id = 1;
			} else {
				id = res.getInt(1) + 1;
			}
		}
		String userid=request.getParameter("userid");
		
		if(session.getAttribute("username")!=null){
			
			boolean status=connection.createStatement().execute("update profile set fullname='"+fullname+"',BloodGroup='"+bloodgroup+"',Gender='"+gender+"',DateofBirth='"+dob+"',mobilenumber='"+phonenumber+"',state='"+state+"',district='"+district+"',city='"+city+"',email='"+email+"',address='"+address+"',username='"+username+"',password='"+password+"',cpassword='"+cpassword+"',availbility='"+availablity+"' ");
			response.sendRedirect("userHome.jsp?Update=updated");
		}else{
			
		

		pStatement = connection.prepareStatement("insert into profile values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		
		pStatement.setInt(1, id);
		pStatement.setString(2,fullname);
		pStatement.setString(3,bloodgroup);
	    pStatement.setString(4, gender);
		pStatement.setString(5, dob);
		pStatement.setString(6, phonenumber);
		pStatement.setString(7, state);
		pStatement.setString(8, district);
		pStatement.setString(9, city);
		pStatement.setString(10, email);
		pStatement.setString(11, address);
		pStatement.setString(12, username);
		pStatement.setString(13, password);
		pStatement.setString(14, cpassword);
		pStatement.setString(15, availablity);
		pStatement.setString(16, conformation);
		pStatement.setInt(17,requeststatus);
		
		success = pStatement.executeUpdate();

		if (success == 0) {
			System.out.println("Registration is Fail");
			response.sendRedirect("index.jsp?registration=fail");

		} else {
			System.out.println("Registration is Success");
			response.sendRedirect("index.jsp?registration=success");
		}}
	%>

</body>
</html>