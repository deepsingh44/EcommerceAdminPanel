<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#regbtn").click(function() {
			$("#loginform").css("display", "none");
			$("#registerform").css("display", "block");
		});

		$("#logbtn").click(function() {
			$("#registerform").css("display", "none");
			$("#loginform").css("display", "block");

		});

		$("#rbtn").click(function() {
			var name=$("#regname").val();
			var email=$("#regemail").val();
			var pass=$("#regpwd").val();
			
			if(name==""){
				alert("Please enter full name");
				$("#regname").focus().css("border-color","red");
			}else if(email==""){
				alert("Please enter email id");
				$("#regemail").focus().css("border-color","red");
			}else if(pass==""){
				alert("Please enter password");
				$("#regpwd").focus().css("border-color","red");
			}else{
				$.post("user",{
					name:name,
					email:email,
					pass:pass,
					opt:1,
				},function(response){
					alert(response);
				});
			}
			
		});
		
		$("#lbtn").click(function() {
			var email=$("#logemail").val();
			var pass=$("#logpwd").val();
			
			if(email==""){
				alert("Please enter email id");
				$("#logemail").focus().css("border-color","red");
			}else if(pass==""){
				alert("Please enter password");
				$("#logpwd").focus().css("border-color","red");
			}else{
				
				$.post("user",{
					email:email,
					pass:pass,
					opt:2,
				},function(response){
					
					if(response!=""){
						alert(response);	
					}else{
						location.replace("homepage.jsp");
					}
				});
				
			}
			
		});
		
	});
</script>
</head>

<%@include file="head.jsp"%>
<div class="row" style="height: 70vh; margin-top: 80px;">
	<div class="col-sm-1"></div>
	<div class="col-sm-5">
		<p align="center">
			<img src="images/background.jpg" class="rounded-circle" width="400"
				height="350" style="margin-top: 10px;">
		</p>
	</div>
	<div class="col-sm-5"
		style="background: white; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s;">
		<div id="loginform">
			<h1 align="center">Login Form</h1>
			<hr>

			<div class="form-group">
				<label for="email">Email address:</label> <input type="email"
					class="form-control" placeholder="Enter email" id="logemail">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" placeholder="Enter password" id="logpwd">
			</div>
			<div class="form-group form-check">
				<label class="form-check-label"> <input
					class="form-check-input" type="checkbox"> Remember me
				</label>
			</div>
			<p align="center">
				<button id="lbtn" type="button" class="btn btn-primary" style="width: 80%;">Login</button>
			</p>

			<p align="center">
				<button id="regbtn" type="button" class="btn btn-primary"
					style="width: 80%;">Click Here For Register</button>
			</p>

		</div>

		<div style="display: none;" id="registerform">
			<h1 align="center">Register Form</h1>
			<hr>

			<div class="form-group">
				<label for="name">Full Name:</label> <input type="text"
					class="form-control" placeholder="Enter Full Name" id="regname">
			</div>
			<div class="form-group">
				<label for="email">Email address:</label> <input type="email"
					class="form-control" placeholder="Enter email" id="regemail">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" placeholder="Enter password" id="regpwd">
			</div>

			<p align="center">
				<button id="rbtn" type="button" class="btn btn-primary" style="width: 80%;">Submit</button>
			</p>

			<p align="center">
				<button id="logbtn" type="button" class="btn btn-primary"
					style="width: 80%;">Click Here For Login</button>
			</p>

		</div>

	</div>

	<div class="col-sm-1"></div>
	<br> <br>
</div>
<%@include file="foot.jsp"%>