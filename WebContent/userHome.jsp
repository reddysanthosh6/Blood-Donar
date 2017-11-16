<!DOCTYPE html>
<%@page import="com.c2n.blooddonar.MyStringRandomGen"%>
<%@page import="org.apache.catalina.ha.tcp.SendMessageData"%>
<%@page import="com.c2n.blooddonar.SendMail"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbconnection.DBConnection"%>
<%@ taglib uri="WEB-INF/taglib.tld" prefix="m"%>
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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#dob").datepicker();
	});
</script>
<script>
	$(function() {
		$("#needdate").datepicker();
	});
</script>
<script>
	$(function() {
		$("#donatedate").datepicker();
	});
</script>

<!-- <script>
  function validatecode(){
	 
	 var reqcode= document.getElementById("re").value;
	 var dbrequestcode=document.getElementById("dbrequestcode").value;
	
	 if(reqcode==null||reqcode==""){
		 alert("enter request code");
		 return false;
	 }
	 if(reqcode!=dbrequestcode){
		 alert("enter valid request id");
		 return false;
	 }
  }
  
  </script>
 -->

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<script>
	$(document)
			.ready(
					function() {

						$('#update_form').each(function() {
							$(this).data('serialized', $(this).serialize())
						}).on(
								'change input',
								function() {
									$(this).find('input:submit, button:submit')
											.attr(
													'disabled',
													$(this).serialize() == $(
															this).data(
															'serialized'));
								}).find('#btn-update').attr('disabled', true);

						$("body")
								.on(
										"click",
										"#report_person",
										function() {

											var username = $(this).find(
													".user_id").val();
											var randomnumber = Math.floor((Math
													.random() * 100) + 1);

											window
													.open(
															'report.jsp?username='
																	+ username,
															"_blank",
															'PopUp'
																	+ randomnumber
																	+ ',scrollbars=1,menubar=0,resizable=1,width=850,height=500');

										});

						$("body")
								.on(
										"click",
										"#lastdonation_dates",
										function() {

											var username = $(this).find(
													".lastdonation_dates")
													.val();
											var randomnumber = Math.floor((Math
													.random() * 100) + 1);

											window
													.open(
															'lastdonation_dates.jsp?username='
																	+ username,
															"_blank",
															'PopUp'
																	+ randomnumber
																	+ ',scrollbars=1,menubar=0,resizable=1,width=850,height=500');

										});

						$("#dpState")
								.change(
										function() {

											var value = $(this).find(
													"option:selected").val();

											alert("registration available in andrapradesh state only")

											$.post("get_Dist.jsp", {

												State : value

											}, function(data) {

												$("#dpDistrict").html(data);

											})

										});

						$("#dpDistrict")
								.change(
										function() {
											var value = $(this).find(
													"option:selected").val();
											alert("registration availble in Hyderabad and Warangal District")

											$.post("get_City.jsp", {

												District : value

											}, function(data) {

												$("#dpCity").html(data);
											})

										});
					});
</script>
<script>
	$(document).ready(function() {

		$('body').on('click', '#search_donar', function(e) {
			e.preventDefault();
			var bloodgroup = $('#bloodid option:selected').val();
			var state = $('#State option:selected').val();
			var district = $('#District option:selected').val();
			var city = $('#City option:selected').val();
			var userid = $('#userid').val();

			$.post("search.jsp", {
				bloodgroup : bloodgroup,
				state : state,
				district : district,
				city : city,
				userid : userid
			}, function(data) {

				$("#search_result").html(data);

			})

		})

		$("#State").change(function() {
			var value = $(this).find("option:selected").val();

			alert("registration available in andrapradesh state only")

			$.post("get_Dist.jsp", {

				State : value

			}, function(data) {

				$("#District").html(data);

			})

		});

		$("#District").change(function() {
			var value = $(this).find("option:selected").val();
			alert("registration availble in Hyderabad and Warangal District")

			$.post("get_City.jsp", {

				District : value

			}, function(data) {

				$("#City").html(data);
			})

		});
	});
</script>

<script>
	$(document).ready(function() {

		$('body').on('click', '#request_code', function(e) {
			e.preventDefault();

			var randomvalue = $('#reqcode').val();
			if (randomvalue == null || randomvalue == "") {
				alert("please enter randomcode");
				return false;
			}

			$.post("postRequestDetails.jsp", {

				randomcode : randomvalue
			}, function(data) {
				//alert(data);
				$("#requestdata").html(data);

			})

		})

	});
</script>
<script>
	$(document).ready(function() {

		$('body').on('click', '#post_request', function() {

			var patient = $("#patient").val();
			var bloodgroup = $("#dBloodGroup option:selected").val();
			var needdate = $("#needdate").val();
			var bloodunits = $("#bloodunits").val();
			var mobile = $("#mobile").val();
			var hspname = $("#hspname").val();
			var selectState = $("#selectState option:selected").val();
			var selectDistrict = $("#selectDistrict option:selected").val();
			var reqlocation = $("#reqlocation").val();
			var dpaddress = $("#dpaddress").val();
			var dppurpose = $("#dppurpose").val();

			if (patient == null || patient == "") {
				alert("please enter patient name");
				return false;
			}
			if (bloodgroup == -1) {
				alert("choose bloodgroup");
				return false;
			}
			if (needdate == null || needdate == "") {
				alert("please enter date");
				return false;
			}
			if (bloodunits == null || bloodunits == "") {
				alert("please enter bloodunits");
				return false;
			}
			if (mobile == null || mobile == "") {
				alert("please enter mobilenumber");
				return false;
			}
			if (hspname == null || hspname == "") {
				alert("please enter hospital name");
				return false;
			}
			if (selectState == -1) {
				alert("choose state");
				return false;
			}
			if (selectDistrict == -1) {
				alert("choose district");
				return false;
			}

			if (reqlocation == null || reqlocation == "") {
				alert("please enter request location");
				return false;
			}
			if (dpaddress == null || dpaddress == "") {
				alert("please enter address");
				return false;
			}
			if (dppurpose == null || dppurpose == "") {
				alert("please enter purpose of request blood");
				return false;
			}

		})

	});
</script>


<script>
	$(document).ready(function() {

		$("#selectState").change(function() {
			var value = $(this).find("option:selected").val();

			alert("registration available in andrapradesh state only")

			$.post("get_Dist.jsp", {

				State : value

			}, function(data) {

				$("#selectDistrict").html(data);

			})

		});

	})
</script>





<script type="text/javascript">
	function validate() {
		var oldpassword = document.getElementById("oldpassword").value;
		var newpassword = document.getElementById("newpassword").value;
		var cpassword = document.getElementById("cpassword").value;
		if (oldpassword == "null" || oldpassword == "") {
			alert("please enter old password");
			return false;
		}
		if (newpassword == "null" || newpassword == "") {
			alert("please enter new password");
			return false;
		}
		if (cpassword == "null" || cpassword == "") {
			alert("please enter confirm password");
			return false;
		}
		if (newpassword != cpassword) {
			alert("password not match");

			return false;

		}
	}
</script>


<script>
	$(document).ready(function() {
		$("body").on("click", "#donate_submit", function() {

			var donatedate = $("#donatedate").val();

			var patientname = $("#patientname").val();
			var location = $("#location").val();
			var hospitalname = $("#hospitalname").val();

			var bloodtype = $("#bloodtype  option:selected").val();

			if (donatedate == null || donatedate == "") {
				alert("enter donate date");
				return false;
			}
			if (patientname == null || patientname == "") {
				alert("enter patient name");
				return false;
			}
			if (location == null || location == "") {
				alert("enter your location");
				return false;
			}
			if (hospitalname == null || hospitalname == "") {
				alert("enter hospitalname");
				return false;
			}
			if (bloodtype == -1) {
				alert("enter bloodtype");
				return false;
			}

		})

	})
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
							<!-- <li><a href="{{URL::to('createusuario')}}"
								data-toggle='pill'>EditProfile</a></li>
 -->
							<li><a href="#profile" data-toggle="pill">Profile</a></li>
							<li><a href="#changepassword" data-toggle="pill">ChangePassword</a></li>
							<li><a href="#donate" data-toggle="pill">LastDonatedBlood</a></li>
							<li><a href="#delete" data-toggle="pill">Detele
									profile/Unsuscribe</a></li>


							<!-- <li class="divider"></li> -->
							<!-- <li><a href="#team" data-toggle="pill">Team</a></li>
							<li class="divider"></li>
							<li><a href="#career" data-toggle="pill">Career</a></li> -->
						</ul></li>
					<li><a href="#searchresult" data-toggle="pill">Search
							Result<span style="font-size: 16px;"
							class="pull-right hidden-xs showopacity glyphicon glyphicon-search"></span>
					</a></li>
					<li><a href="#postbloodrequest" data-toggle="pill">Post
							Blood Request<span style="font-size: 16px;"
							class="pull-right hidden-xs showopacity glyphicon glyphicon-tint"></span>
					</a></li>
					<li><a href="logout.jsp">Logout<span
							style="font-size: 16px;"
							class="pull-right hidden-xs showopacity glyphicon glyphicon-off"></span></a></li>
				</ul>



			</div>
		</div>
	</nav>

	<!-- Menus Body  -->
	<div class="container">
		<div class="tab-content">
			<!-- Home page  -->
			<div id="home" class="tab-pane fade in active">

				<div class="container">
					<div id="" style="padding: 50px;"
						class="mainbox col-md-8  col-sm-8 col-sm-offset-2">

						<img src="img/Donate-Blood2.jpg" alt="Smiley face" width="80%"
							height="80%">
						<marquee>
							<h1>Your blood donation can give a precious smile to
								someone’s face.</h1>
						</marquee>

					</div>
				</div>
			</div>

			<!-- My page  -->

			<!-- profile page -->
			<div id="profile" class="tab-pane fade ">

				<div class="container">


					<div id="" style="padding: 50px;"
						class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">
									<span class="glyphicon glyphicon-user"></span> Profile
								</div>

							</div>
							<div style="padding-top: 30px" class="panel-body">



								<div style="display: none" id="login-alert"
									class="alert alert-danger col-sm-12"></div>

								<!-- <form  class="form-horizontal" role="form" >
						</form> -->
								<div class="panel-body">
									<form id='update_form' action="registration.jsp"
										id="signupform" class="form-horizontal" role="form">

										<div id="signupalert" style="display: none"
											class="alert alert-danger">
											<p>Error:</p>
											<span></span>
										</div>

										<%
											Connection connection = DBConnection.getConnection();
											/* session=request.getSession();
											String	username=session.getAttribute("username").toString();
											*/ ResultSet profile_view = connection.createStatement()
													.executeQuery("select * from profile where username='" + session.getAttribute("username") + "'");
											profile_view.next();
										%>
										<input type='hidden' name='userid' id='userid'
											value='<%=profile_view.getInt(1)%>'>



										<div class="form-group">
											<label for="fullname" class="col-md-3 control-label">Full
												Name</label>
											<div class="col-md-9">
												<input type="text" class="form-control" name="fullname"
													id='fullname'
													<%-- placeholder="<%=profile_view.getInt(1)%>" --%> value="<%=profile_view.getString(2)%>">
											</div>
										</div>

										<div class="form-group">
											<label for="bloodgroup" class="col-md-3 control-label">Blood
												Group</label>
											<div class="col-md-9">
												<select name="bloodgroup" id="dpBloodGroup"
													class="form-control">
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
													<option value="Bombay Blood Group">Bombay Blood
														Group</option>
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
											<label for="dob" class="col-md-3 control-label">Date
												of Birth</label>
											<div class="col-md-9">
												<input type="text" class="form-control" name="dob" id="dob"
													class="dob" value="<%=profile_view.getString(5)%>">
											</div>
										</div>

										<div class="form-group">
											<label for="mobilenumber" class="col-md-3 control-label">MobileNumber</label>
											<div class="col-md-9">
												<input type="number" maxlength="10" class="form-control"
													name="mobilenumber" value="<%=profile_view.getString(6)%>">
											</div>
										</div>



										<%
											ResultSet rs = connection.createStatement().executeQuery("select Distinct State from State_District_City");
										%>

										<div class="form-group">
											<label for="state" class="col-md-3 control-label">State
											</label>
											<div class="col-md-9">
												<select name="state" id="dpState" class="form-control">
													<option value="<%=profile_view.getString(7)%>"><%=profile_view.getString(7)%></option>
													<option value="--" disabled="disabled">----------------</option>
													<%
														while (rs.next()) {
													%>
													<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

													<%
														}
													%>
												</select>
											</div>

										</div>

										<div class="form-group">
											<label for="district" class="col-md-3 control-label">District
											</label>
											<div class="col-md-9">
												<select name="district" id="dpDistrict" name="distname"
													class="form-control">
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
											<label for="address" class="col-md-3 control-label">Permanent
												Address</label>
											<div class="col-md-9">
												<textarea rows="5" cols="6" class="form-control"
													name="address" id="address"><%=profile_view.getString(11)%></textarea>

											</div>
										</div>

										<div class="form-group">
											<label for="username" class="col-md-3 control-label">UserName</label>
											<div class="col-md-9">
												<input type="text" class="form-control" name="username"
													readonly="readonly" value="<%=profile_view.getString(12)%>">
											</div>
										</div>

										<div class="form-group">
											<label for="password" class="col-md-3 control-label">Password</label>
											<div class="col-md-9">
												<input type="password" class="form-control" name="passwd"
													placeholder="Password"
													value="<%=profile_view.getString(13)%>">
											</div>
										</div>

										<div class="form-group">
											<label for="password" class="col-md-3 control-label">Retype
												Password</label>
											<div class="col-md-9">
												<input type="password" class="form-control" name="cpasswd"
													value="<%=profile_view.getString(14)%>">
											</div>
										</div>


										<div class="form-group">
											<label for="donate blood" class="col-md-3 control-label">Please
												Confirm Your availability to donate blood</label>
											<div class="col-md-9">
												<select name="AvailUnAvailable" id="dpAvailUnAvailable"
													class="form-control">

													<option value="<%=profile_view.getString(15)%>"><%=profile_view.getString(15)%></option>
													<option value="Available">Available</option>
													<option value="UnAvailable">UnAvailable</option>

												</select>
											</div>
										</div>




										<div class="form-group">
											<!-- Button -->

											<div class="col-md-offset-3 col-md-9">


												<input type="submit" id="btn-update" value="Update"
													class="btn btn-primary" disabled="disabled">

											</div>




										</div>


									</form>
								</div>






							</div>
						</div>

					</div>

				</div>

			</div>


			<%
				try {
					String changepwdflag = request.getParameter("Update");
					System.out.println("update flag is " + changepwdflag);
					if (changepwdflag != null) {
						if (changepwdflag.equals("SUCCESS")) {
							System.out.println("update flag is in if ");
			%>
			<script>
				$(document).ready(function() {
					$('#home').removeClass('active in');
					$('#changePassword').addClass('active in');
				});
			</script>

			<%
				} else {
			%>
			<script>
				$(document).ready(function() {
					$('#home').removeClass('active in');
					$('#home').addClass('active in');
				});
			</script>

			<%
				}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>



			<div id="changepassword" class="tab-pane fade ">
				<h1 class="thick-heading">||Jobs Page||</h1>
				<h6>This is jobs page</h6>
				<div class="container">


					<div id="" style="padding: 50px;"
						class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">ChangePassword</div>
							</div>
							<div style="padding-top: 30px" class="panel-body">



								<div style="display: none" id="login-alert"
									class="alert alert-danger col-sm-12"></div>

								<form action="ChangePassword" id="loginform"
									class="form-horizontal" role="form"
									onsubmit="return validate()">








									<%
										try {
											String changepwdflag = request.getParameter("Update");
											System.out.println("update flag is " + changepwdflag);
											if (changepwdflag != null) {
												if (changepwdflag.equals("SUCCESS")) {

													System.out.println("update flag is in if ");
									%>
									<!-- <span style="color:green;font-size: 26px; ">Password Changed Successfully</span> -->
									<span style="color: green; font-size: 26px;"><m:FlashMessage
											delay="5000">Password Changed Successfully</m:FlashMessage> </span>
									<%
										} else {
									%>
									<!-- <span style="color:red;font-size: 26px; ">Password Not Changed</span> -->
									<span style="color: red; font-size: 26px;"><m:FlashMessage
											delay="5000">Password Not Changed</m:FlashMessage> </span>
									<%
										}
											}
										} catch (Exception e) {
											e.printStackTrace();
										}
									%>




									<%
										connection = DBConnection.getConnection();
										try {
											ResultSet rs_profile = connection.createStatement().executeQuery("select * from profile");
											if (rs_profile.next()) {
									%>

									<input type='hidden' name='userid' id='userid'
										value='<%=rs_profile.getInt(1)%>'>
									<div class="form-group">
										<label for="oldpassword" class="col-md-3 control-label">OldPassword</label>
										<div class="col-md-9">
											<input type="password" class="form-control" id="oldpassword"
												name="oldpassword" placeholder="enter your old password">
										</div>
									</div>

									<div class="form-group">
										<label for="newpassword" class="col-md-3 control-label">NewPassword</label>
										<div class="col-md-9">
											<input type="password" class="form-control" id="newpassword"
												name="newpassword" placeholder="enter your new password">
										</div>
									</div>

									<div class="form-group">
										<label for="confirmpassword" class="col-md-3 control-label">Re_type
											Password</label>
										<div class="col-md-9">
											<input type="password" class="form-control" id="cpassword"
												name="cpassword" placeholder="enter your confirm password">
										</div>
									</div>

									<div style="margin-top: 10px" class="form-group">
										<!-- Button -->

										<div class="col-sm-12 controls">
											<!-- <a id="btn-login"  class="btn btn-primary col-sm-4 col-sm-offset-2">Login
										</a> -->
											<input type="submit" id="btn-login"
												class="btn btn-primary col-sm-4 col-sm-offset-2">

										</div>
										<%
											}
											} catch (Exception e) {
												e.printStackTrace();
											}
										%>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>





			<div id="delete" class="tab-pane fade ">

				<div class="container">


					<div id="" style="padding: 50px;"
						class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Delete</div>
							</div>
							<div style="padding-top: 30px" class="panel-body">



								<div style="display: none" id="login-alert"
									class="alert alert-danger col-sm-12"></div>







								<form action="deleteAction">

									<div class="form-group">
										<label class="col-md-3 control-label">Enter Your
											UserName</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="username"
												id="username" placeholder="enter your username">
										</div>
									</div>


									<div style="margin-top: 10px" class="form-group">
										<!-- Button -->

										<div class="col-sm-12 controls">
											<!-- <a id="btn-login"  class="btn btn-primary col-sm-4 col-sm-offset-2">Login
										</a> -->
											<input type="submit" id="btn-login" value="DeleteRequest"
												class="btn btn-primary col-sm-4 col-sm-offset-2">

										</div>
									</div>


								</form>

							</div>
						</div>
					</div>
				</div>

			</div>




			<!-- last donate blood -->
			<div id="donate" class="tab-pane fade ">

				<div class="container">


					<div id="" style="padding: 50px;"
						class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">
									<span class="glyphicon glyphicon-thumbs-up"></span> Last Donate
									Blood:Register
								</div>
							</div>
							<div style="padding-top: 30px" class="panel-body">



								<div style="display: none" id="login-alert"
									class="alert alert-danger col-sm-12"></div>

								<form action="lastDonateBlood.jsp" class="form-horizontal">

									<div class="form-group">
										<label class="col-md-3 control-label">Donate Date</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="donatedate"
												id="donatedate" placeholder="enter your blood need date">
										</div>
									</div>


									<div class="form-group">
										<label class="col-md-3 control-label">Patient Name</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="patientname"
												id="patientname" placeholder="enter your patientname">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">Location</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="location"
												id="location" placeholder="enter your location">
										</div>
									</div>


									<div class="form-group">
										<label class="col-md-3 control-label">Hospital name</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="hospitalname"
												id="hospitalname" placeholder="enter your hospitalname">
										</div>
									</div>


									<div class="form-group">
										<label class="col-md-3 control-label">Type of Donation
										</label>
										<div class="col-md-9">
											<select name="bloodtype" id="bloodtype" class="form-control">
												<option value="-1">-----Select-----</option>
												<option value="Blood">Blood</option>
												<option value="">Platelets</option>


											</select>
										</div>

									</div>



									<div class="form-group">


										<div class="col-md-offset-3 col-md-9">


											<input type="submit" id="donate_submit"
												class="btn btn-primary">

										</div>
									</div>
								</form>
							</div>
						</div>

					</div>

				</div>

			</div>



			<!-- search result -->

			<div id="searchresult" class="tab-pane fade ">

				<div class="container">


					<div id="" style="padding: 50px;"
						class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">
									<span class="glyphicon glyphicon-search"></span> SearchResult
								</div>
							</div>
							<div style="padding-top: 30px" class="panel-body">



								<div style="display: none" id="login-alert"
									class="alert alert-danger col-sm-12"></div>

								<form id="loginform" class="form-horizontal" role="form">
									<div class="form-group">
										<label for="bloodgroup" class="col-md-3 control-label">Blood
											Group</label>
										<div class="col-md-9">
											<select name="bloodgroup" id="bloodid" class="form-control">
												<option value="Select">-----Select-----</option>
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
												<option value="Bombay Blood Group">Bombay Blood
													Group</option>
												<option value="INRA">INRA</option>
												<option value="O+">O+</option>
												<option value="O-">O-</option>

											</select>
										</div>
									</div>

									<%
										rs = connection.createStatement().executeQuery("select Distinct State from State_District_City");
									%>

									<div class="form-group">
										<label for="state" class="col-md-3 control-label">State
										</label>
										<div class="col-md-9">
											<select name="state" id="State" class="form-control">
												<option value="Select">-----Select-----</option>

												<%
													while (rs.next()) {
												%>
												<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>

												<%
													}
												%>
											</select>
										</div>

									</div>

									<div class="form-group">
										<label for="district" class="col-md-3 control-label">District
										</label>
										<div class="col-md-9">
											<select name="district" id="District" name="distname"
												class="form-control">
												<option value="Select">-----Select-----</option>

												<option value=""></option>

											</select>

										</div>
									</div>



									<div class="form-group">
										<label for="city" class="col-md-3 control-label">City
										</label>
										<div class="col-md-9">
											<select name="city" id="City" class="form-control">
												<option value="Select">-----Select-----</option>

											</select>

										</div>
									</div>
									<div class="form-group">


										<div class="col-md-offset-3 col-md-9">


											<input type="submit" id="search_donar"
												class="btn btn-primary">

										</div>
									</div>
								</form>
							</div>
						</div>
<div id="search_result" class="table-striped "></div>
					</div>
					
				</div>

			</div>


			<!-- blood request page -->


			<div id="postbloodrequest" class="tab-pane fade ">

				<div class="container">


					<div id="" style="padding: 50px;"
						class="mainbox col-md-8  col-sm-8 col-sm-offset-2">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">
									<span class="glyphicon glyphicon-compressed"></span> Post Blood
									Request Form
								</div>

							</div>
							<div style="padding-top: 30px" class="panel-body">

								<marquee>If you are already posted your Blood Request
									and Want to update your Blood request then please enter request
									code</marquee>
								<div style="display: none" id="login-alert"
									class="alert alert-danger col-sm-12"></div>

								<%
									connection = DBConnection.getConnection();
									try {
										ResultSet requestcode = connection.createStatement()
												.executeQuery("select randomcode from requestblood");
										requestcode.next();
										String dbrequestcode = requestcode.getString(1);
										System.out.println(dbrequestcode);
								%>
								<input type="hidden" value="<%=requestcode.getString(1)%>"
									name="dbrequestcode" id="dbrequestcode">
								<%
									connection.close();
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>


								<form class="form-horizontal" onsubmit="return validatecode()">
									<div class="form-group">
										<label class="col-md-3 control-label">Enter Your Blood
											Request Code</label>
										<div class="col-md-9">
											<br> <input type="text" class="form-control"
												name="reqcode" id="reqcode"
												placeholder="enter your blood request code"><br>
										</div>
									</div>
									<div class="col-md-offset-3 col-md-9">
										<!-- <button id="btn-signup" type="button" class="btn btn-primary">
											<i class="icon-hand-right"></i> &nbsp Sign Up
										</button> -->

										<input type="submit" id="request_code" class="btn btn-primary">

									</div>

									&nbsp; &nbsp;

								</form>

								<!--   				<hr style="height:1px;border:none;color:#333;background-color:#333;" />
 -->

								<form class="form-horizontal" id="requestdata"
									action="bloodrequest">
									<input type="hidden" name='randomcode'>




									<div class="form-group">
										<label class="col-md-3 control-label">Patient Name</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="patientname"
												id="patient" placeholder="enter your patientname">
										</div>
									</div>
									<div class="form-group">
										<label for="bloodgroup" class="col-md-3 control-label">Blood
											Group</label>
										<div class="col-md-9">
											<select name="bloodgroup" id="dBloodGroup"
												class="form-control">
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
												<option value="Bombay Blood Group">Bombay Blood
													Group</option>
												<option value="INRA">INRA</option>
												<option value="O+">O+</option>
												<option value="O-">O-</option>

											</select>
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">When you need
											blood</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="needdate"
												id="needdate" placeholder="enter your blood need date">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">How many Units
											you need?</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="bloodunits"
												id="bloodunits" placeholder="enter units of required blood">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">MobileNumber</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="mobilenumber"
												id="mobile"
												placeholder="enter your mobile your mobilenumber">
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">Hospital Name</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="hospitalname"
												id="hspname" placeholder="enter hospitalname">
										</div>
									</div>


									<%
										connection = DBConnection.getConnection();
										ResultSet rs_value = connection.createStatement()
												.executeQuery("select Distinct State from State_District_City");
									%>

									<div class="form-group">
										<label for="state" class="col-md-3 control-label">State
										</label>
										<div class="col-md-9">
											<select id="selectState" class="form-control">
												<option value="-1">-----Select-----</option>

												<%
													while (rs_value.next()) {
												%>
												<option value="<%=rs_value.getString(1)%>"><%=rs_value.getString(1)%></option>

												<%
													}
												%>
											</select>
										</div>

									</div>

									<div class="form-group">
										<label for="district" class="col-md-3 control-label">District
										</label>
										<div class="col-md-9">
											<select name="district" id="selectDistrict"
												class="form-control">
												<option value="-1">-----Select-----</option>

												<option value=""></option>

											</select>

										</div>
									</div>




									<div class="form-group">
										<label class="col-md-3 control-label">Location</label>
										<div class="col-md-9">
											<input type="text" class="form-control" name="location"
												id="reqlocation" placeholder="please enter location">
										</div>
									</div>

									<div class="form-group">
										<label for="address" class="col-md-3 control-label">Patient
											Address</label>
										<div class="col-md-9">
											<textarea rows="5" cols="6" class="form-control"
												name="address" id="dpaddress"></textarea>

										</div>
									</div>
									<div class="form-group">
										<label for="address" class="col-md-3 control-label">Purpose</label>
										<div class="col-md-9">
											<textarea rows="5" cols="6" class="form-control"
												name="purpose" id="dppurpose"></textarea>

										</div>
									</div>


									<div class="col-md-offset-3 col-md-9">
										<!-- <button id="btn-signup" type="button" class="btn btn-primary">
											<i class="icon-hand-right"></i> &nbsp Sign Up
										</button> -->

										<input type="submit" id="post_request" class="btn btn-primary">

									</div>





								</form>



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
