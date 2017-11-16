<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.DBConnection"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BLOOD DONOR</title>
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<meta name="description" content="Save lifes">
<meta name="author" content="Gopiraj Kummari">


<!-- Bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans"
	rel="stylesheet">
<!-- External Style sheet -->
<link href="css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
  
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#dob" ).datepicker();
  } );
  </script>
  
  <script type="text/javascript">
  $(document).ready(function(){
	  $("body").on("click","#register_button",function(){
		  var fullname=$("#fullname").val();
		  
		 var bloodgroup=$("#dpBloodGroup option:selected").val();
		 
		  var gender=$("#dpGender option:selected").val();
		  var dob=$("#dob").val();
		  var mobilenumber=$("#mobilenumber").val();
		  var state=$("#dpState option:selected").val();
		  var district=$("#dpDistrict option:selected").val();
		  var city=$("#dpCity option:selected").val();
		  var email=$("#email").val();
		  var address=$("#address").val();
		  var username=$("#user_name").val();
		  var pass=$("#password").val();
		  var cpass=$("#cpassword").val();
		  var availability=$("#dpAvailUnAvailable option:selected").val();
		  
		  
		  
		  if(fullname==null||fullname==""){
			  alert("enter fullname");
			  return false;
		  }
		  if(bloodgroup==-1){
			  alert("enter your bloodgroup");
			  return false;
		  }
		  if(gender==-1){
			  alert("enter  your gender");
			  return false;
		  }
		  if(dob==null||dob==""){
			  alert("enter your dateofbirth");
			  return false;
		  }
		  if(mobilenumber==null||mobilenumber==""){
			  alert("enter your mobilenumber");
			  return false;
		  } if(state==-1){
			  alert("enter your state");
			  return false;
		  }
		  if(district==-1){
			  alert("choose your district");
			  return false;
		  } if(city==-1){
			  alert("choose your city");
			  return false;
		  }
		  if(email==null||email==""){
			  alert("enter your email");
			  return false;
		  } if(address==null||address==""){
			  alert("enter your address");
			  return false;
		  } if(username==null||username==""){
			  alert("enter your username");
			  return false;
		  }
		  if(pass==null||pass==""){
			  alert("enter your  password");
			  return false;
		  } if(cpass==null||cpass==""){
			  alert("enter your cpassword");
			  return false;
		  }
		  if(availability==-1){
			  alert("enter availability");
			  return false;
		  }
		 if(pass!=cpass){
			 alert("passwords not match.enter again");
			 return false;
		 }
		  
		  
		  
		 
	  }) 
	  
	  
  })
  
  
  </script>
  
  
  
<script>
$(document).ready(function(){
	
	$('#user_name').keyup(function(){
		
		$.post("serach_user_avalibility.jsp",{username:$(this).val()},function(data){
			
			//alert(data);
			
			$("#name_avalibility_message").html(data);
			
		})
		
		
		
	})
	
	
	
	
    $("#dpState").change(function(){
    	var value = $(this).find("option:selected").val();
    
    	
    	alert("registration available in andrapradesh state only")
    	
    	
    	$.post("get_Dist.jsp", {

			State : value

		}, function(data) {
            
			$("#dpDistrict").html(data).trim();

		})

    });
    
    
    $("#dpDistrict").change(function(){
    	var value = $(this).find("option:selected").val();
    	alert("registration availble in Hyderabad and Warangal District")
    	
    	$.post("get_City.jsp", {

			District : value

		}, function(data) {
            
			$("#dpCity").html(data).trim();

		})

    });

    
    
    
    
    
});

</script>

</head>
<body style="font-family: 'Josefin Sans', sans-serif;"
	background="img/Blood_1.jpg">

	<div class="page-header thick-heading text-center">
		<h1 style="text-transform: uppercase;">
			<small style="color: red;">|| Blood_Donor ||</small>
		</h1>
	</div>
	<div class="container">
		<div class="row text-center">
			<div class="col-md-6 col-xs-12">

				<div id="loginbox" style="margin-top: 5%;"
					class="mainbox col-md-10  col-sm-8 col-sm-offset-2">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Log In</div>
							
							
							
							
							<div
								style="float: right; font-size: 80%; position: relative; top: -10px">
								<a href="forgot_password.jsp">Forgot password?</a>
							</div>
						</div>
<%
			try{
			if(request.getParameter("values").equals("notValidA")){ %>
			<label style="font-style: italic; color: red;"
				class="col-md-6 col-lg-6 col-sm-6 col-md-offset-6">Enter
				Valid Credentials for Admin/User</label>
			<%
				
			}
			
			}catch(Exception e){
				System.out.println("skip the values");
			}
			%>

						<div style="padding-top: 30px" class="panel-body">

							<div style="display: none" id="login-alert"
								class="alert alert-danger col-sm-12"></div>

							<form   action="loginValidation.jsp"   id="loginform" class="form-horizontal" role="form">

								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input
										id="login-username" type="text" class="form-control"
										name="name" value="" placeholder="username">
								</div>

								<div style="margin-bottom: 25px" class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input
										id="login-password" type="password" class="form-control"
										name="password" placeholder="password">
								</div>



								<div class="input-group">
									<div class="checkbox">
										<label> <input id="login-remember" type="checkbox"
											name="remember" value="1"> Remember me
										</label>
									</div>
								</div>

 
								<div style="margin-top: 10px" class="form-group">
									
                             
									<div class="col-sm-12 controls">
										<!-- <a id="btn-login"  class="btn btn-primary col-sm-4 col-sm-offset-2">Login
										</a> -->
										<input type="submit"  id="btn-login" class="btn btn-primary col-sm-4 col-sm-offset-2">
									
							</div>
	
						</form>
								</div>


								<div class="form-group">
									<div class="col-md-12 control">
										<div
											style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
											Don't have an account! <a href="#"
												onClick="$('#loginbox').hide(); $('#signupbox').show()">
												Sign Up Here </a>
										</div>
									</div>
								</div>
							



						</div>
					</div>
				</div>
				
				
				<div id="signupbox" style="display: none; margin-top: 5%"
					class="mainbox col-md-10  col-sm-8 col-sm-offset-2">
					
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Sign Up</div>
							<div
								style="float: right; font-size: 85%; position: relative; top: -10px">
								<a id="signinlink" href="#"
									onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign
									In</a>
							</div>
						</div>
						<div class="panel-body">
							<form  action="registration.jsp"  id="signupform" class="form-horizontal" role="form">

								<div id="signupalert" style="display: none"
									class="alert alert-danger">
									<p>Error:</p>
									<span></span>
								</div>



                                <div class="form-group">
									<label for="fullname" class="col-md-3 control-label">Full
										Name</label>
									<div class="col-md-9">
										<input type="text" class="form-control"id="fullname" name="fullname"
											placeholder="Full Name">
									</div>
								</div>
								
								<div class="form-group">
								<label for="bloodgroup" class="col-md-3 control-label">Blood
										Group</label>
								<div class="col-md-9">
								<select name="bloodgroup" id="dpBloodGroup" class="form-control" class="dpBloodGroup">
	                            <option value="-1">-----Select-----</option>
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
	                            <option value="-1">-----Select-----</option>
	                            <option value="Male">Male</option>
	                            <option value="Female">Female</option>

                                  </select>
								
								 </div>
								</div>
								
								
								<div class="form-group">
									<label for="dob" class="col-md-3 control-label">Date of Birth</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="dob" id="dob"
											placeholder="(MM/DD/YYYY)">
									</div>
								</div>
								
								<div class="form-group">
									<label for="mobilenumber" class="col-md-3 control-label">MobileNumber</label>
									<div class="col-md-9">
										<input type="number"  maxlength="10" class="form-control" name="mobilenumber" id="mobilenumber"
											placeholder="mobilenumber">
									</div>
								</div>
								
								
								
								<%Connection connection=DBConnection.getConnection();
										
								ResultSet rs=connection.createStatement().executeQuery("select Distinct State from State_District_City");
								%>
  								
								<div class="form-group">
								<label for="state" class="col-md-3 control-label">State
									</label>
								<div class="col-md-9">
								<select name="state" id="dpState" class="form-control">
								 <option value="-1">-----Select-----</option>
								
							<% 	while(rs.next()){
									%>
                                                              <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                                   
								<%}%>
								 </select>
								 </div>
								 
								</div>
								
							<div class="form-group">
								<label for="district" class="col-md-3 control-label">District
									</label>
								<div class="col-md-9">
								<select name="district" id="dpDistrict" name="distname" class="form-control">
                                <option value="-1">-----Select-----</option>
                               
                             
                               
                                    </select>
								
								 </div>
								</div>	
								
								
								
								<div class="form-group">
								<label for="city" class="col-md-3 control-label">City
									</label>
								<div class="col-md-9">
								<select name="city" id="dpCity" class="form-control">
                                 <option value="-1">-----Select-----</option>
                                
                                    </select>
								
								 </div>
								</div>	
								
								
								
								
								<div class="form-group">
									<label for="email" class="col-md-3 control-label">Email</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="email" id="email"
											placeholder="Email Address">
									</div>
								</div>
								
								<div class="form-group">
									<label for="address" class="col-md-3 control-label">Permanent Address</label>
									<div class="col-md-9">
										<textarea rows="5" cols="6" class="form-control" name="address" id="address"></textarea>
										
									</div>
								</div>
								
								<div class="form-group">
									<label for="username"  class="col-md-3 control-label">UserName</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="username"
										 id='user_name'	placeholder="username">
										 <div id='name_avalibility_message'></div>
									</div>
								</div>
								
								<div class="form-group">
									<label for="password" class="col-md-3 control-label">Password</label>
									<div class="col-md-9">
										<input type="password" class="form-control" name="passwd" id="password"
											placeholder="Password">
									</div>
								</div>
								
								<div class="form-group">
									<label for="password" class="col-md-3 control-label">Retype Password</label>
									<div class="col-md-9">
										<input type="password" class="form-control" name="cpasswd" id="cpassword"
											placeholder="Password">
									</div>
								</div>
								
								
								<div class="form-group">
									<label for="donate blood" class="col-md-3 control-label">Please Confirm Your availability to donate blood</label>
									<div class="col-md-9">
										<select name="AvailUnAvailable" id="dpAvailUnAvailable" class="form-control">
										<option  value="-1">Select</option>
	                                       <option  value="Available">Available</option>
	                                             <option value="UnAvailable">UnAvailable</option>

                                                    </select>
									</div>
								</div>

								

								<div class="form-group">
									
									<div class="col-md-9">
										<input type="checkbox" class="form-control"  value="0" name="declaration">
										
										 I authorise the website to display my name and telephone number, so that the needy could contact me, as and when there is an emergency.
                                                             
									</div>
								</div>
								
								<div class="form-group">
									<!-- Button -->
									
									<div class="col-md-offset-3 col-md-9">
										<!-- <button id="btn-signup" type="button" class="btn btn-primary">
											<i class="icon-hand-right"></i> &nbsp Sign Up
										</button> -->
										
										<input type="submit" id="register_button" value="submit" class="btn btn-primary" >
										
									</div>
									
									</div>

								
							</form>
						</div>
					</div>




				</div>


			</div>
			                   <div class="col-md-6 col-xs-12">
				<!-- <div class="btn-group-vertical btn-group btn-group-lg" style="margin-top: 5%; width: 75%;">
					<button type="button" class="btn btn-danger btnGroup">
						New User? <br> Registrer Here...
					</button>
					<button type="button" class="btn btn-danger btnGroup">
						Post Your Blood <br> Request
					</button>
					<button type="button" class="btn btn-danger btnGroup">
						Find a <br> Blood Donor
					</button>
				</div> -->
			                 </div>
		</div>
	

</body>
</html>