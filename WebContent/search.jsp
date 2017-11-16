 <%@page import="dbconnection.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
	 String userid=request.getParameter("userid");
String bloodgroup=request.getParameter("bloodgroup");
System.out.println(bloodgroup);

String state=request.getParameter("state");
System.out.println(state);
String district=request.getParameter("district");
System.out.println(district);
String city=request.getParameter("city");
System.out.println(city);
		Connection connection = DBConnection.getConnection();
		
	ResultSet rs = connection.createStatement().executeQuery("select  * from profile where BloodGroup='"+bloodgroup+"' and state='"+state+"' and district='"+district+"' and city='"+city+"' and conformation='1' and not username='"+session.getAttribute("username")+"'");
	/* 	ResultSet rs = connection.createStatement().executeQuery("select  `profile`.username,`profile`.mobilenumber,`profile`.availbility,`profile`.BloodGroup,`profile`.state,`profile`.district,`profile`.city ,donateblooddetails.donate_date from `profile` INNER JOIN  donateblooddetails on `profile`.username=donateblooddetails.username where `profile`.conformation='1'");
	 */
	%>
	
	
	


				 <%
				 boolean check=true;
					while (rs.next()) {
						if(check){
							
							check=false;
							%>
							
							
<div class="container table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Available/UnAvailable</th>
					<th>Mobile</th>
					<th>Report us</th>
					<th>Last Donation dates</th>
					

				</tr>
			</thead>
			<tbody>
							
							
							<%
							
						}
				%>
 

				<tr>
					 <td><%=rs.getString(2)%></td>
					<td><%=rs.getString(15)%></td>
					<td><%=rs.getString(6)%></td>
					
					
					<td><span style='cursor:pointer;color:blue;' id='report_person'>report
					<input type="hidden" class='user_id' value='<%=rs.getString(12) %>' >
					</span></td>
					 <td><span style='cursor:pointer;color:blue;' id='lastdonation_dates'>dates
					<input type="hidden" class='lastdonation_dates' value='<%=rs.getString(12)%>' >
					</span></td>
				</tr>
					<%
						}
					
					if(check){
						
						out.println("<center><span ><h2>No Records</h2></span></center>");
					}else{
					%> 
				
			</tbody>
		</table>
	</div>
<% } %>
