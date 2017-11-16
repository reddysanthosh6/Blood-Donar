package com.c2n.blooddonar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.DBConnection;


@WebServlet("/deleteAction")
public class deleteAction extends HttpServlet {
		
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		System.out.println(username);
		Connection connection=DBConnection.getConnection();
		try {
		
			boolean st=connection.createStatement().execute("update profile set requeststatus='1' where username='"+username+"'");
			response.sendRedirect("userHome.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		try{
			
			boolean deleteUser=connection.createStatement().execute("delete  from profile where username='"+request.getParameter("delete_user_name")+"'");
response.sendRedirect("adminHome.jsp");		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

}
