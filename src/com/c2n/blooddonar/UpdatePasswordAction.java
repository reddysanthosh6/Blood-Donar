package com.c2n.blooddonar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.DBConnection;


@WebServlet("/UpdatePasswordAction")
public class UpdatePasswordAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	String password=request.getParameter("newpassword");
	String cpassword=request.getParameter("cpassword");
	String username=request.getParameter("username");
	System.out.println(username);
	
	Connection connection=DBConnection.getConnection();
	
	try {
		boolean update_password=connection.createStatement().execute("update profile set password='"+password+"',cpassword='"+cpassword+"' where username='"+username+"'");
	response.sendRedirect("index.jsp?password=update");
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	
	

	
	
	}

	
}
