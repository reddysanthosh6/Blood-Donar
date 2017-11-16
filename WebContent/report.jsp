<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
	
	$("#close_button").click(function(){
		
		window.close();
		
	})
	
	
})
</script>
</head>
<body>
<form action="reportAction">

<div class="form-group">
									<label for="username"  class="col-md-3 control-label">UserName</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="username"
										 id='user_name'	placeholder="username" value="<%=request.getParameter("username")%>">
										 <div id='name_avalibility_message'></div>
									</div>
								</div>
								
								<div class="form-group">
								<label for="city" class="col-md-3 control-label">Phone
									</label>
								<div class="col-md-9">
								<select name="phone" id="phone" class="form-control">
                                 <option value="Select">-----Select-----</option>
                                 <option value="Valid">Valid</option>
                                <option value="InValid">InValid</option>
                                
                                
                                    </select>
								
								 </div>
								 
								 
								 
				
								</div>	
								
					<div class="form-group">
									<label for="Report" class="col-md-3 control-label">Report Information</label>
									<div class="col-md-9">
										<textarea rows="5" cols="6" class="form-control" name="report" id="report"></textarea>
										
									</div>
								</div>

<button id='submit'>Report</button>
</form>
<button id='close_button'>close</button>
</body>
</html>