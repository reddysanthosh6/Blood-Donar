package com.c2n.blooddonar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.DBConnection;

@WebServlet("/bloodrequest")
public class BloodRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Connection connection=DBConnection.getConnection();
	String username=request.getParameter("username");
System.out.println("user"+username);
		
	PreparedStatement pstatement=null;
	String patientname=request.getParameter("patientname");
	String bloodgroup=request.getParameter("bloodgroup");
	System.out.println(bloodgroup);
	String needdate=request.getParameter("needdate");
	String bloodunits=request.getParameter("bloodunits");

	String mobilenumber=request.getParameter("mobilenumber");
	String hspname=request.getParameter("hospitalname");
	String location=request.getParameter("location");
	String address=request.getParameter("address");
	String purpose=request.getParameter("purpose");
	String district=request.getParameter("district");
	System.out.println(district);
	 MyStringRandomGen randomcode=new MyStringRandomGen();
	String randomvalue=randomcode.generateRandomString();
	HttpSession session=request.getSession();

	try {
		
		
if(request.getParameter("randomcode")==null){
boolean status1=connection.createStatement().execute("update requestblood set patientname='"+patientname+"',bloodgroup='"+bloodgroup+"',needdate='"+needdate+"',bloodunits='"+bloodunits+"',mobilenumber='"+mobilenumber+"',hospitalname='"+hspname+"',location='"+location+"',address='"+address+"',purpose='"+purpose+"' where randomecode='"+request.getParameter("randomcode")+"'");
			response.sendRedirect("userHome.jsp?updated");
		}else{
		
		
Statement st=connection.createStatement();
		
		ResultSet result=st.executeQuery("select email,district,bloodgroup from profile where username='"+session.getAttribute("username")+"'");


		pstatement=connection.prepareStatement("insert into requestblood values(?,?,?,?,?,?,?,?,?,?)");
		pstatement.setString(1, patientname);
		pstatement.setString(2, bloodgroup);
		pstatement.setString(3, needdate);
		pstatement.setString(4, bloodunits);
		pstatement.setString(5, mobilenumber);
		pstatement.setString(6, hspname);
		pstatement.setString(7, location);
		pstatement.setString(8, address);
		pstatement.setString(9, purpose);
	
		pstatement.setString(10, randomvalue);
		
		pstatement.executeUpdate();
		
		boolean mailFlag=false;

		if(result.next()){
			System.out.println("iiff");




			//String sendmessage="http://localhost:8080/ProjectManagerTool/forgotChangePassword.jsp";
			// to=null;
			//String link="?UserName="+username;


			//String Maillink=SendMessageData.concat(link.concat(link1));

			SendMail.Sendmail(result.getString("email"),randomvalue);

			//SendMail.Sendmail(result.getString("email"),Maillink); */
			//System.out.println("Please enter valid username");
			mailFlag=true;
			System.out.print("<h1>verification sent through maill..</h1>"); 

		
		//response.sendRedirect("userHome.jsp");
		
		}
		System.out.println("$$$$$$$$$$$$$$$"+result.getString(2));
		
		
	ResultSet	result1=st.executeQuery("select email from profile where district='"+district+"' and bloodgroup='"+bloodgroup+"'and  not username='"+session.getAttribute("username")+"'");
	
	 mailFlag=false;

		while(result1.next()){
			System.out.println("iiff");

System.out.println(result1.getString(1));


			//String sendmessage="http://localhost:8080/ProjectManagerTool/forgotChangePassword.jsp";
			// to=null;
			//String link="?UserName="+username;


			//String Maillink=SendMessageData.concat(link.concat(link1));


			SendMail.Sendmail(result1.getString(1),"hi..urgent requirment for blood..hosptial ='"+hspname+"',required bloodunits='"+bloodunits+"' and mobilenumber='"+mobilenumber+"' ,need blooddate='"+needdate+"'");

			//SendMail.Sendmail(result.getString("email"),Maillink); */
			//System.out.println("Please enter valid username");
			mailFlag=true;
			System.out.print("<h1>verification sent through maill..</h1>"); 

		
		
		
	}

		response.sendRedirect("userHome.jsp");
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}	
		
	


															
		

	
	
	}	
	
}
