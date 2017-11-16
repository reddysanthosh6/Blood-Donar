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
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans"
	rel="stylesheet">
<!-- External Style sheet -->
<link href="css/style.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
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
							<div class="panel-title">Forgot Password</div>
							
							
							
							
							
						</div>


						<div style="padding-top: 30px" class="panel-body">

							<div style="display: none" id="login-alert"
								class="alert alert-danger col-sm-12"></div>
								
							<%
			try{
			if(request.getParameter("mailFlag").equals("false")){ %>
			<label style="font-style: italic; color: red;"
				class="col-md-6 col-lg-6 col-sm-6 col-md-offset-6">Enter
				Valid UserName</label>
			<%
				
			}
			
			}catch(Exception e){
				System.out.println("skip the values");
			}
			%>

							<form   action="SendmailAction"   id="loginform" class="form-horizontal" role="form">

								
								<div class="form-group">
									<label for="fullname" class="col-md-3 control-label">Enter
										UserName</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="username"
											placeholder="enter username">
									</div>
								</div>
								
								<div class="col-sm-12 controls">
										<!-- <a id="btn-login"  class="btn btn-primary col-sm-4 col-sm-offset-2">Login
										</a> -->
										<input type="submit"  id="btn-login" class="btn btn-primary col-sm-4 col-sm-offset-2">
									
							</div>
							</form>
				
								</div>


						



						</div>
					</div>
				</div>
				



			</div>
			
		</div>
	

</body>
</html>