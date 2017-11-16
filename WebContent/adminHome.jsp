<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.DBConnection"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<meta name="description" content="Save lifes">
<meta name="author" content="Gopiraj Kummari">

<title>BLOOD_DONOR</title>

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
	
	<script >
	
	$(document).ready(function(){
		
		$(".report_history").click(function(){
			
			var username=$(this).parent().find('#reported_user').text();
			var randomnumber = Math.floor((Math.random()*100)+1);
			 window.open('report_history.jsp?username='+username,"_blank",'PopUp'+randomnumber+',scrollbars=1,menubar=0,resizable=1,width=850,height=500');
			
		})
		
		
		
	})
	
	
	
	</script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		$("body").on("click","#profile_submit",function(){
			
			var username=$(this).parent().parent().find(".get_user").val();
			
			
			$.post("get_User_Profile_view.jsp", {

				 username: username

			},
			
			function(data) {
	            
				$("#profile_view_List").html(data);

			})
			
			
		});
	
		

		  
	});

	
	</script>
	
	
	
	
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans"
	rel="stylesheet">
<!-- External Style sheet -->
<link href="css/style.css" rel="stylesheet">

<!--Internal Style sheet-CSS  -->
<style>
body, html {
	height: 100%;
}

nav.sidebar, .main {
	-webkit-transition: margin 200ms ease-out;
	-moz-transition: margin 200ms ease-out;
	-o-transition: margin 200ms ease-out;
	transition: margin 200ms ease-out;
}

.main {
	padding: 10px 10px 0 10px;
}

@media ( min-width : 765px) {
	.main {
		position: absolute;
		width: calc(100% - 40px);
		margin-left: 40px;
		float: right;
	}
	nav.sidebar:hover+.main {
		margin-left: 200px;
	}
	nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand
		{
		margin-left: 0px;
	}
	nav.sidebar .navbar-brand, nav.sidebar .navbar-header {
		text-align: center;
		width: 100%;
		margin-left: 0px;
	}
	nav.sidebar a {
		padding-right: 13px;
	}
	nav.sidebar .navbar-nav>li:first-child {
		border-top: 1px #e5e5e5 solid;
	}
	nav.sidebar .navbar-nav>li {
		border-bottom: 1px #e5e5e5 solid;
	}
	nav.sidebar .navbar-nav .open .dropdown-menu {
		position: static;
		float: none;
		width: auto;
		margin-top: 0;
		background-color: transparent;
		border: 0;
		-webkit-box-shadow: none;
		box-shadow: none;
	}
	nav.sidebar .navbar-collapse, nav.sidebar .container-fluid {
		padding: 0 0px 0 0px;
	}
	.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
		color: #777;
	}
	nav.sidebar {
		width: 200px;
		height: 100%;
		margin-left: -160px;
		float: left;
		margin-bottom: 0px;
	}
	nav.sidebar li {
		width: 100%;
	}
	nav.sidebar:hover {
		margin-left: 0px;
	}
	.forAnimate {
		opacity: 0;
	}
}

@media ( min-width : 1330px) {
	.main {
		width: calc(100% - 200px);
		margin-left: 200px;
	}
	nav.sidebar {
		margin-left: 0px;
		float: left;
	}
	nav.sidebar .forAnimate {
		opacity: 1;
	}
}

nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus
	{
	color: #CCC;
	background-color: transparent;
}

nav:hover .forAnimate {
	opacity: 1;
}

section {
	padding-left: 15px;
}
</style>


</head>
<body style="font-family: 'Josefin Sans', sans-serif;">
	<div class="jumbotron text-center">
		<h1
			style="text-transform: uppercase; text-decoration: line-through; text-decoration-color: red">Blood
			Donor</h1>
	</div>

	<nav class="navbar navbar-default sidebar" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-sidebar-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-sidebar-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#home" data-toggle="pill">Home
							<span style="font-size: 16px;"
							class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span>
					</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">MyPage<span class="caret"></span><span
							style="font-size: 16px;"
							class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
						
							<li><a href="#report" data-toggle="pill">Reports</a></li>
							
							

						</ul></li>
					<li><a href="#delete" data-toggle="pill">User Delete Request <span
							style="font-size: 16px;"
							class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
					<li><a href="#users" data-toggle="pill">User List<span
							style="font-size: 16px;"
							class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>		
					<li><a href="logout.jsp">Logout<span
							style="font-size: 16px;"
							class="pull-right hidden-xs showopacity glyphicon glyphicon-off"></span></a></li>

				</ul>



			</div>
		</div>
	</nav>
	
	<%Connection connection=DBConnection.getConnection(); 
	%>

	<!-- Menus Body  -->
	<div class="container">
		<div class="tab-content">
			<!-- Home page  -->
			<div id="home" class="tab-pane fade in active">
				
				<div class="container">
				<div id="" style="padding:50px;"
					class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
					
					<img src="img/Donate-Blood2.jpg"   alt="Smiley face" width="80%" height="80%">
					<marquee><h1>Your blood donation can give a precious smile to someone’s face.</h1></marquee>
					
					</div>
</div>
	</div>
			
			<!-- delete page	 -->
			
			<div id="delete" class="tab-pane fade ">
		
						<div class="container">
						
				
					<div id="" style="padding:50px;"
					class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Delete</div></div>
				<div  class="panel-body">
				
								

					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>

				
<%ResultSet request_user_status=connection.createStatement().executeQuery("select username from profile where requeststatus='1'");
while(request_user_status.next()){
System.out.println("");
%>						
						
			 <table>
                        
                        <tr>
                        
                        <td><div div class="col-sm-12 controls">Username</div></td><br>
                      
                        <td><div div class="col-sm-12 controls"><%=request_user_status.getString(1)%></div></td><br>
                        <td>
                         
			         <form action="deleteAction">
			         <input type="hidden" value="<%=request_user_status.getString(1)%>" name="delete_user_name"	>
			         <div class="col-sm-12 controls">
								
								<input type="submit" id="btn-login" value="Accept"
									class="btn btn-primary ">

							</div>
						</form>	
							
						</td>
						</tr>	
							
				</table> 
				
				
				<% }%>
				</div>
             </div>
		</div>
</div>
		
	</div>
	
	
	<!-- users -->
	
	
			<div id="users" class="tab-pane fade ">
		
						<div class="container">
						
				
					<div id="" style="padding:50px;"
					class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">User List</div></div>
				<div style="overflow:scroll;" class="panel-body">
				
								

					<div style="display: none" id="login-alert"
						class="alert alert-danger col-sm-12"></div>

				
<%ResultSet user_list=connection.createStatement().executeQuery("select * from profile ");
while(user_list.next()){

%>						
						
			 <table>
                        
                        <tr>
                        
                        <td><div  class="col-sm-12 controls"><%=user_list.getString(12)%></div></td><br>
                      
                        
                        <td>
                         
			         
			         <input type="hidden" class="get_user" value="<%=user_list.getString(12)%>" name="get_user"	>
			         <div class="col-sm-12 controls">
								
								<input type="button" id="profile_submit" value="Profileview"
									class="btn btn-primary ">

							</div>
						
							
						</td>
						</tr>	
							
				</table> 
				
				
				<% }%>
				</div>
             </div>
             
             
             <div id="profile_view_List"></div>
		</div>
</div>
		
	</div>
	
	
	
	
	<!-- reports..... -->
	
	
		<div id="report" class="tab-pane fade ">
		
						<div class="container">
						
				
					<div id="" style="padding:50px;"
					class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Report</div></div>
				<div style="padding-top: 30px" class="panel-body">
				
					<% 
					
					ResultSet report_result_set= connection.createStatement().executeQuery("select DISTINCT username  from user_report");
					
					%>
					<table class='table table-condensed'>
					<tr><th>username</th><th>Report History</th><th>No of Reports</th><th>Action</th></tr>
					<% 
					while(report_result_set.next()){
					ResultSet count_user_report=	connection.createStatement().executeQuery("select count(*) from user_report where username='"+report_result_set.getString(1)+"'");
					count_user_report.next();
						%>
						<tr><td id='reported_user'><%=report_result_set.getString(1) %></td><td class='report_history'>History</td><td><%=count_user_report.getInt(1) %></td><td><form action='deleteUser_Report'><input type='hidden' value='<%=report_result_set.getString(1) %>' name='delete_user_name'><input type='submit' value='Delete'></form></td></tr>
						
						
						<% 
					}
					%>
					</table>
					
					<%
					
					%>			

				

				
		
				
				
				
				</div>
             </div>
		</div>
</div>
		
	</div>
	

	
			
			
			
			
			

		</div>
		<!-- Close the tab content  -->
	</div>
	
	
		
	
	
	
	<!-- Close Main Container  -->

	<div class="footer-copyright">
		<div class="container">
			<p>
				Â© Copyright 2017 <b><i style="color: #085c5c;">C2N IT
						Services Pvt Ltd </i></b>. All Rights Reserved.
			</p>
		</div>
	</div>
</body>
</html>
