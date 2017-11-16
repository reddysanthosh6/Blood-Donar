package com.c2n.blooddonar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.DBConnection;

/**
 * Servlet implementation class SendmailAction
 */
@WebServlet("/SendmailAction")
public class SendmailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String username=request.getParameter("username");
    System.out.println(username);



    	try {
    		Connection connection=DBConnection.getConnection();
    		Statement st=connection.createStatement();
    		ResultSet result=st.executeQuery("select email from profile where username='"+username+"'");
    		
    		boolean mailFlag=false;
    		if(result.next()){
    			
    			String Maillink="http://localhost:8080/BloodDonar/password_Update.jsp?username="+username;
    			
    			
    		    
    		
    			
    			 SendMail.Sendmail(result.getString("email"),Maillink);
    		mailFlag=true;
    			/*  out.print("<h1>verification sent through maill..</h1>");  */
    			
    			//out.println("<h1>message sent sucessfully</h1>");
    			System.out.println("correct UserName");
    			  response.sendRedirect("index.jsp?mailFlag=true");
    			
    		}else{
    			mailFlag=false;
    			System.out.println("invalid UserName");
    			
    			  response.sendRedirect("forgot_password.jsp?mailFlag=false");
    		}
    	} catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}

    
    }

	
	
}
