package com.c2n.blooddonar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.DBConnection;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		String cpassword=request.getParameter("cpassword");
		int userid=Integer.parseInt(request.getParameter("userid"));
	System.out.println(userid);
	 String	password=null;
	 PreparedStatement ps=null;
	
	Connection connection=DBConnection.getConnection();
	try{
		Statement st=connection.createStatement();
		String sql="select password from profile where user_id='"+userid+"'";
		System.out.println(sql);
		
ResultSet 	rs =st.executeQuery(sql);
		while(rs.next()){
			 password=rs.getString("password");
			 System.out.println("while loop"+password);
		}
		
		if (password.equals(oldpassword)&&newpassword.equals(cpassword)){

			
			ps=connection.prepareStatement("update profile set password='"+newpassword+"' where user_id='"+userid+"'");
			int i=ps.executeUpdate();
			if(i>0){
				response.sendRedirect("userHome.jsp?Update=SUCCESS");
		
		}	}else{
			response.sendRedirect("userHome.jsp?Update=FAIl");

		
		}	
		
	
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	}
}
