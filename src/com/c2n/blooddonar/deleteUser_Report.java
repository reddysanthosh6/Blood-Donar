package com.c2n.blooddonar;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dbconnection.DBConnection;

@WebServlet("/deleteUser_Report")
public class deleteUser_Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      Connection connection=DBConnection.getConnection();

		try{
			
			boolean deleteUser=connection.createStatement().execute("delete  from profile where username='"+request.getParameter("delete_user_name")+"'");
			boolean deleteUser_Report=connection.createStatement().execute("delete from user_report where username='"+request.getParameter("delete_user_name")+"'" );
response.sendRedirect("adminHome.jsp");		
		}
		catch(Exception e){
			e.printStackTrace();
		}	
	
	}

	

}
