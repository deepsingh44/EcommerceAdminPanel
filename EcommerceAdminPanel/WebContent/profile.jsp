<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#edtbtn").click(function() {
			var text = $("#edtbtn").text();
			if (text == "Edit Profile") {
				$("#right").css("display", "block");
				$("#edtbtn").text("Close Profile");
			} else {
				$("#right").css("display", "none");
				$("#edtbtn").text("Edit Profile");
			}

		});
	});
</script>
</head>
<%@include file="head.jsp"%>
<div class="container-fluid" align="center">
	<div
		style="width: 85%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s; height: 85vh;">
		<div class="row">
			<h1 align="center">Profile Details</h1>
			<hr>
			<div class="col-sm-1"></div>

			<div class="col-md-4"
				style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s;">
				<p align="center">
					<img style="margin-top: 10px;" class="img-circle"
						src="images/default_user.png" width="150" height="150">
				</p>
				<hr>
				<h2 align="center" style="">Deep Singh</h2>
				<p align="center">
					<b style="">deepsingh44@gmail.com</b>
				</p>
				<p align="center">
					<button style="width: 80%;" class="btn btn-primary" id="edtbtn">Edit
						Profile</button>
				</p>
			</div>

			<div class="col-md-5 col-md-offset-1" id="right"
				style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s; display: none;">
				<p align="center">
					<img style="margin-top: 10px;" class="img-circle"
						src="images/default_user.png" width="150" height="150">
				</p>
				<hr>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-5">
						<div class="form-group" align="left">
							<label for="email">Full Name:</label> <input type="email"
								class="form-control" id="email">
						</div>
					</div>

					<div class="col-sm-2"></div>

					<div class="col-sm-5">
						<div class="form-group" align="left">
							<label for="email">Email address:</label> <input type="email"
								class="form-control" id="email">
						</div>
					</div>

					<div class="col-sm-1"></div>
				</div>

				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-5">
						<div class="form-group" align="left">
							<label for="email">Password:</label> <input type="email"
								class="form-control" id="email">
						</div>
					</div>

					<div class="col-sm-2"></div>

					<div class="col-sm-5">
						<div class="form-group" align="left">
							<label for="email">Profile Image:</label> <input type="email"
								class="form-control" id="email">
						</div>
					</div>

					<div class="col-sm-1"></div>
				</div>

				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
						<p>
							<button type="submit" style="width: 80%;" class="btn btn-primary">Submit</button>
						</p>

					</div>
					<div class="col-sm-2"></div>
				</div>

			</div>

			<div class="col-sm-2"></div>

		</div>
	</div>
</div>