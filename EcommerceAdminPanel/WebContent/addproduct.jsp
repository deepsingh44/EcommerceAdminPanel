<head>
<meta http-equiv="Cache-control" content="no-cache">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#addbtn").click(function() {
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

			var url = "product?opt=1";
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
					//location.reload(true);
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
<p:choose>
<p:when test="${sessionScope.user ne null}">

<form id="sampleUploadFrm" method="POST" enctype="multipart/form-data">
<div class="container-fluid" align="center">
	<div
		style="width: 85%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s; height: 85vh;">
		<div class="row" align="left">
			<div style="width: 80%; margin-left: 10%;">
				<h1 align="center">Add Product</h1>
				<hr>
				
				<div class="col-sm-1"></div>
				<div class="col-sm-10" style="">
					<div class="row">
						<p align="center">
							<img style="margin-top: 10px;" class="img-rounded"
								src="images/defaultimage.jpg" width="150" height="150">
						</p>
						<div class="col-sm-1"></div>

						<div class="col-sm-4">
							<div class="form-group">
								<label for="name">Product Name:</label> <input type="text"
									class="form-control" id="name" name="name"
									placeholder="Enter Name">
							</div>

							<div class="form-group">
								<label for="price">Product Price:</label> <input type="number"
									class="form-control" id="price" name="price"
									placeholder="Enter Price">
							</div>

							<div class="form-group">
								<label for="category">Product Category:</label> <select
									class="form-control" id="category" name="category">
									<option>Select Category</option>
									<option>Men</option>
									<option>Women</option>
									<option>Home</option>
								</select>
							</div>

						</div>

						<div class="col-sm-2"></div>

						<div class="col-sm-4">

							<div class="form-group">
								<label for="quantity">Product Quantity:</label> <input
									type="number" class="form-control" id="quantity" min="1"
									value="1" name="quantity">
							</div>

							<div class="form-group">
								<label for="date">Select Date:</label> <input type="date"
									class="form-control" id="date" name="date">
							</div>

							<div class="form-group">
								<label for="image">Product Image:</label> <input type="file"
									class="form-control" id="image" name="image">
							</div>

						</div>


						<div class="col-sm-1"></div>

					</div>
					<div align="center">
						<button id="addbtn" type="button" style="width: 60%;" class="btn btn-primary">Add Product</button>
					</div>

				</div>
				<div class="col-sm-1"></div>
				
			</div>
		</div>
	</div>
</div>
</form>

</p:when>

<p:otherwise>
<p:redirect url="index.jsp"></p:redirect>
</p:otherwise>

</p:choose>

