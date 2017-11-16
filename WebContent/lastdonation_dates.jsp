<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String username=request.getParameter("username");
Connection connection=DBConnection.getConnection();
ResultSet last_dates=connection.createStatement().executeQuery("select * from donateblooddetails where username='"+username+"'");

%>
 



<%boolean check=true;
	while (last_dates.next()) {
		if(check){
			
			check=false;
	
		%>
			
<div class="container table-responsive">
<table class="table">
<thead>
<tr>
	<th>Donation Date</th>
	<th>Patient Name</th>
	<th>Location</th>
	<th>Hospital Name</th>
	<th>Donation Type</th>
	
</tr>
</thead>
<tbody>
		<%} %>	
		

<tr>
	 
	 
	 <td><%=last_dates.getString(2)%></td>
	<td><%=last_dates.getString(3)%></td>
	<td><%=last_dates.getString(4)%></td>
	<td><%=last_dates.getString(5)%></td>
	<td><%=last_dates.getString(6)%></td>
	
	
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
<% 
} 

%>

