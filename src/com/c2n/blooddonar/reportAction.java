package com.c2n.blooddonar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.DBConnection;


@WebServlet("/reportAction")
public class reportAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Username=request.getParameter("username");
	    String Phone=request.getParameter("phone");
	    String report_information=request.getParameter("report");
	    
	    Connection connection=DBConnection.getConnection();
	    try {
			PreparedStatement request_report=connection.prepareStatement("insert into user_report values(?,?,?)");
			request_report.setString(1, Username);
			request_report.setString(2, Phone);
			request_report.setString(3,report_information);
			
			request_report.executeUpdate();
			
			response.sendRedirect("report_Information.jsp");
			
		} 
	    
	    catch (Exception e) {
			
			e.printStackTrace();
		}
	    
	    		}

	
}
