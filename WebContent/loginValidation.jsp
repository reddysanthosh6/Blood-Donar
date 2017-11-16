
<%@page import="dbconnection.DBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LoginValidationPage</title>
</head>
<body>
	<%
		String username, password;
		username = request.getParameter("name");
		password = request.getParameter("password");

		System.out.println("username is:" + username + " \n password value is :" + password);

		if ((username != "null") && (password != "null")) {
			if (username.equals("admin") && password.equals("admin")) {
				session.setAttribute("username", username);
			
				response.sendRedirect("adminHome.jsp");
				}
			else {
				Connection connection = null;
				PreparedStatement pStatement = null;
				ResultSet resultSet = null;

				connection =DBConnection.getConnection();
				pStatement = connection.prepareStatement(
						"select * from profile where  username='" + username + "'AND password='" + password + "'");
				resultSet = pStatement.executeQuery();

				if (resultSet.next()) {

					session.setAttribute("username", username);
					
				response.sendRedirect("userHome.jsp?login=success");
					
					
				} else {
					System.out.println("Login failure");
					response.sendRedirect("index.jsp?values=notValidA");
				
				}
				/* All Conneciton are closed  */
				connection.close();
				pStatement.close();
				resultSet.close();

			}
		} else {
			System.out.println("Username and password values doesnot empty");
			response.sendRedirect("index.jsp?values=notValidA");
		}
		
		
		
		
	%>
</body>
</html>