<head>
<meta http-equiv="Cache-control" content="no-cache">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#edtbtn").click(function() {
			/* var name = $("#name").val();
			var email = $("#email").val();
			var pass = $("#pass").val();
			
			if (name == "") {
				alert("please enter name");
				$("#name").focus().css("border-color", "red");
			} else if (email == "") {
				alert("please enter email id");
				$("#email").focus().css("border-color", "red");
			} else if (pass == "") {
				alert("please enter password");
				$("#pwd").focus().css("border-color", "red");
			} else {
				
				   
				
			} */

			var url = "user?opt=3";
			var form = $("#sampleUploadFrm")[0];
			var data = new FormData(form);

			$.ajax({
				type : "POST",
				encType : "multipart/form-data",
				url : url,
				cache : false,
				processData : false,
				contentType : false,
				data : data,

				success : function(msg) {
					location.reload(true);
					alert(msg);

				},
				error : function(msg) {
					alert("Couldn't upload file");
				}
			});

		});

	});
</script>
</head>
<%@include file="head.jsp"%>
<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core"%>
<p:choose>
<p:when test="${sessionScope.user ne null}">
<form id="sampleUploadFrm" method="POST" enctype="multipart/form-data">

	<div class="row" style="height: 80vh; margin: 0; padding: 0;">

		<div class="col-sm-2"></div>
		<div class="col-sm-8"
			style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s;">
			<h2 align="center">Profile Details</h2>
			<hr>
			<p align="center">

				<p:choose>
					<p:when test="${sessionScope.user.image ne null}">
				
						<img class="img-circle"
							src="profileimages/${sessionScope.user.image}" height="150"
							width="170">
					</p:when>

					<p:otherwise>
						<img src="images/default_user.png" class="img-circle" width="150"
							height="150">
					</p:otherwise>
				</p:choose>

			</p>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="name">Full Name:</label> <input type="text"
							class="form-control" placeholder="Enter Full Name" id="name"
							name="name" value="${sessionScope.user.name}">
					</div>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="email">Email address:</label> <input type="email"
							class="form-control" placeholder="Enter email" id="email"
							value="${sessionScope.user.email}" name="email">
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>

			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="pass">Password:</label> <input type="password"
							class="form-control" placeholder="Enter password" id="pass"
							value="${sessionScope.user.pass}" name="pass">
					</div>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-3">
					<div class="form-group">
						<label for="image">Profile Image:</label> <input type="file"
							class="form-control" placeholder="Select Image" id="image"
							name="file">
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>

			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<input type="button" id="edtbtn" class="btn btn-primary"
						value="Edit Profile" style="width: 100%;">
				</div>
				<div class="col-sm-4"></div>
			</div>
			<br>
		</div>
		<div class="col-sm-2"></div>

	</div>

</form>
</p:when>
<p:otherwise>
<p:redirect url="index.jsp"></p:redirect>
</p:otherwise>
</p:choose>
