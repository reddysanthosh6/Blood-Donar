  <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

Connection connection=DBConnection.getConnection();
ResultSet rs=connection.createStatement().executeQuery(" select * from  requestblood where randomcode='"+request.getParameter("randomcode")+"'");

rs.next();
%>






<input type="hidden" name="randomcode" id="randomvalue" value="<%=request.getParameter("randomcode") %>">

                   <div class="form-group">
				<label class="col-md-3 control-label">Patient Name</label>
				<div class="col-md-9">
				<input type="text" class="form-control" name="patientname"  value='<%=rs.getString(1)%>' id="patientname" placeholder="enter your patientname">
									</div>
								</div>	
             <div class="form-group">
								<label for="bloodgroup" class="col-md-3 control-label">Blood
										Group</label>
								<div class="col-md-9">
								<select name="bloodgroup" id="dpBloodGroup" class="form-control">
								 <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
	                            <option value="Select">----------</option>
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
				<label class="col-md-3 control-label">When you need blood</label>
				<div class="col-md-9">
				<input type="text" class="form-control hasDatepicker" name="needdate" value='<%=rs.getString(3)%>' id="needdate" placeholder="enter your blood need date">
									</div>
								</div>	
								
					<div class="form-group">
				<label class="col-md-3 control-label">How many Units you need?</label>
				<div class="col-md-9">
				<input type="text" class="form-control" name="bloodunits"   value='<%=rs.getString(4)%>'  id="bloodunits" placeholder="enter units of required blood">
									</div>
								</div>	
								
				<div class="form-group">
				<label class="col-md-3 control-label">MobileNumber</label>
				<div class="col-md-9">
				<input type="text" class="form-control" value='<%=rs.getString(5)%>' name="mobilenumber" id="mobilenumber" placeholder="enter your mobile your mobilenumber">
									</div>
								</div>
								
			<div class="form-group">
				<label class="col-md-3 control-label">Hospital Name</label>
				<div class="col-md-9">
				<input type="text" class="form-control"  value='<%=rs.getString(6)%>'name="hospitalname" id="hosppitalname" placeholder="enter hospitalname">
									</div>
								</div>
								
													
			<div class="form-group">
				<label class="col-md-3 control-label">Location</label>
				<div class="col-md-9">
				<input type="text" class="form-control" value='<%=rs.getString(7)%>' name="location" id="location" placeholder="please enter location">
									</div>
								</div>
								
				<div class="form-group">
									<label for="address" class="col-md-3 control-label">Patient Address</label>
									<div class="col-md-9">
										<textarea rows="5" cols="6" class="form-control" name="address" id="address"><%=rs.getString(8)%></textarea>
										
									</div>
								</div>		
				<div class="form-group">
									<label for="address" class="col-md-3 control-label">Purpose</label>
									<div class="col-md-9">
										<textarea rows="5" cols="6" class="form-control" name="purpose" id="purrpose"><%=rs.getString(9)%></textarea>
										
									</div>
								</div>	
								
								
						<div class="col-md-offset-3 col-md-9">
										<!-- <button id="btn-signup" type="button" class="btn btn-primary">
											<i class="icon-hand-right"></i> &nbsp Sign Up
										</button> -->
										
										<input type="submit" id="btn-signup" class="btn btn-primary">
										
									</div>
									
									
									


