<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Connection connection=DBConnection.getConnection();
%>
<div class="panel panel-info">
<div class="panel-heading">
	<div class="panel-title"> <span class="glyphicon glyphicon-user"></span>
	Profile</div>
	
</div>
<div style="padding-top: 30px" class="panel-body">

		

<div style="display: none" id="login-alert"
class="alert alert-danger col-sm-12"></div>

<!-- <form  class="form-horizontal" role="form" >
</form> -->
<div class="panel-body">
	

		
<%
/* session=request.getSession();
String	username=session.getAttribute("username").toString();
*/						ResultSet profile_view=connection.createStatement().executeQuery("select * from profile where username='"+request.getParameter("username")+"'"); 
 profile_view.next();
%>
<input type='hidden' name='userid' id='userid'
			value='<%=profile_view.getInt(1)%>'>
 


        <div class="form-group">
			<label for="fullname" class="col-md-3 control-label">Full
				Name</label>
			<div class="col-md-9">
				<input type="text" class="form-control" name="fullname"
					<%-- placeholder="<%=profile_view.getInt(1)%>" --%> value="<%=profile_view.getString(2)%>">
			</div>
		</div>
		
		<div class="form-group">
		<label for="bloodgroup" class="col-md-3 control-label">Blood
				Group</label>
		<div class="col-md-9">
		<select name="bloodgroup" id="dpBloodGroup" class="form-control">
        <option value="value=<%=profile_view.getString(2)%>"><%=profile_view.getString(3)%></option>
        <option value="A+">A+</option>
     <option value="A-">A-</option>
        <option value="A1+">A1+</option>
        <option value="A1-">A1-</option>
        <option value="A1B+">A1B+</option>
        <option value="A1B-">A1B-</option>
          <option value="A2+">A2+</option>
           <option value="A2-">A2-</option>
       <option value="A2B+">A2B+</option>
       <option value="A2B-">A2B-</option>
        <option value="AB+">AB+</option>
        <option value="AB-">AB-</option>
         <option value="B+">B+</option>
           <option value="B-">B-</option>
       <option value="Bombay Blood Group">Bombay Blood Group</option>
              <option value="INRA">INRA</option>
       <option value="O+">O+</option>
       <option value="O-">O-</option>

         </select>
         </div>
		</div>
		
		<div class="form-group">
		<label for="gender" class="col-md-3 control-label">Gender
			</label>
		<div class="col-md-9">
		<select name="gender" id="dpGender" class="form-control">
        <option value="<%=profile_view.getString(4)%>"><%=profile_view.getString(4)%></option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>

          </select>
		
		 </div>
		</div>
		
		
		<div class="form-group">
			<label for="dob" class="col-md-3 control-label">Date of Birth</label>
			<div class="col-md-9">
				<input type="text" class="form-control" name="dob" id="dob" class="dob"									value="<%=profile_view.getString(5)%>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="mobilenumber" class="col-md-3 control-label">MobileNumber</label>
			<div class="col-md-9">
				<input type="number"  maxlength="10" class="form-control" name="mobilenumber"
					value="<%=profile_view.getString(6)%>">
			</div>
		</div>
		
		
		
		
			
		<div class="form-group">
		<label for="state" class="col-md-3 control-label">State
			</label>
		<div class="col-md-9">
		<select name="state" id="dpState" class="form-control">
		 <option value="<%=profile_view.getString(7)%>"><%=profile_view.getString(7)%></option>
		<option value="--" disabled="disabled">----------------</option>
	
		 </select>
		 </div>
		 
		</div>
		
	<div class="form-group">
		<label for="district" class="col-md-3 control-label">District
			</label>
		<div class="col-md-9">
		<select name="district" id="dpDistrict" name="distname" class="form-control">
        <option value="<%=profile_view.getString(8)%>"><%=profile_view.getString(8)%></option>
       
       <option value=""></option>
       
            </select>
		
		 </div>
		</div>	
		
		
		
		<div class="form-group">
		<label for="city" class="col-md-3 control-label">City
			</label>
		<div class="col-md-9">
		<select name="city" id="dpCity" class="form-control">
         <option value="<%=profile_view.getString(9)%>"><%=profile_view.getString(9)%></option>
        
            </select>
		
		 </div>
		</div>	
		
		
		
		
		<div class="form-group">
			<label for="email" class="col-md-3 control-label">Email</label>
			<div class="col-md-9">
				<input type="text" class="form-control" name="email"
					value="<%=profile_view.getString(10)%>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="address" class="col-md-3 control-label">Permanent Address</label>
			<div class="col-md-9">
				<textarea rows="5" cols="6" class="form-control" name="address" id="address"><%=profile_view.getString(11)%></textarea>
				
			</div>
		</div>
		
		<div class="form-group">
			<label for="username" class="col-md-3 control-label">UserName</label>
			<div class="col-md-9">
				<input type="text" class="form-control" name="username" readonly="readonly"
					value="<%=profile_view.getString(12)%>"> 
			</div>
		</div>
		
		<div class="form-group">
			<label for="password" class="col-md-3 control-label">Password</label>
			<div class="col-md-9">
				<input type="password" class="form-control" name="passwd"
					placeholder="Password"  value="<%=profile_view.getString(13)%>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="password" class="col-md-3 control-label">Retype Password</label>
			<div class="col-md-9">
				<input type="password" class="form-control" name="cpasswd"
					value="<%=profile_view.getString(14)%>">
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="donate blood" class="col-md-3 control-label">Please Confirm Your availability to donate blood</label>
			<div class="col-md-9">
				<select name="AvailUnAvailable" id="dpAvailUnAvailable" class="form-control" >
				
                          <option value="<%=profile_view.getString(15)%>"><%=profile_view.getString(15)%></option>							
                   <option  value="Available">Available</option>
                         <option value="UnAvailable">UnAvailable</option>

                            </select>
			</div>
		</div>

	</div>								
</div>
</div>



