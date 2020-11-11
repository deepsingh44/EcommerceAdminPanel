<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#search").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("table tbody .tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		
		
		var id;
		$("table tbody .tr td").click(function() {

			var text = $(this).find("button").text();
			if (text == "") {

			} else {

				if (text == "Edit") {
					$('#myModal1').modal('show');
				} else {
					if (confirm("Are you sure you want to delete this product ?")) {
						$.post("delete/"+ id,{},function(response) {
							location.reload();
						});
					} else {
						return false;
					}
				}

			}
		});

	});
</script>
</head>
<%@include file="head.jsp"%>
<p:choose>
<p:when test="${sessionScope.user ne null}">
<div class="container-fluid" align="center">
	<div
		style="width: 85%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s; height: 85vh;">
		<div class="row">

			<div class="col-sm-4">
				<h1 align="center">Product List</h1>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="form-group">
					<div align="center"
						style="display: flex; align-items: center; border: 1px lightgray solid; border-radius: 5px; margin-right: 10px; margin-left: 10px; margin-top: 20px;">
						<input type="text" class="form-control" style="border: 0;"
							id="search" name="search" placeholder="Search Product..."><span
							class="material-icons"> search </span>
					</div>
				</div>

			</div>
		</div>
		<hr>

		<div class="table-responsive" style="width: 80%;" align="center">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>QUANTITY</th>
						<th>PRICE</th>
						<th>DATE</th>
						<th>ACCEPT</th>
						<th>DENY</th>
					</tr>
				</thead>
				<tbody>

					<p:forEach items="1,2,3,4,5,6" var="product">

						<%-- <tr class="tr">
							<td class="id">${product.id}</td>
							<td class="name">${product.name}</td>
							<td class="price">${product.price}</td>
							<td class="quantity">${product.quantity}</td>
							<td class="date">${product.date}</td>
							<td><button class="btn btn-primary">Edit</button></td>
							<td>
								<button class="btn btn-danger">Delete</button>
							</td>
						</tr> --%>


						<tr class="tr">
							<td class="id">${product}</td>
							<td class="name">A</td>
							<td class="price">123</td>
							<td class="quantity">2</td>
							<td class="date">2020/02/12</td>
							<td><button class="btn btn-primary">Confirm</button></td>
							<td>
								<button class="btn btn-danger">Reject</button>
							</td>
							<td><img src="images/default_user.png" width="30"
								height="30"></td>
						</tr>



					</p:forEach>
				</tbody>
			</table>
		</div>

	</div>

	<div id="myModal1" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">Edit Product</h3>
				</div>
				<div class="modal-body" align="left">
					<div class="row">

						<p align="center">
							<img style="margin-top: 10px;" class="img-rounded"
								src="images/defaultimage.jpg" width="100" height="100">
						</p>
						<hr>

						<div class="col-sm-6">
							<div class="form-group">
								<label for="email">Product Name:</label> <input type="text"
									class="form-control" id="pname" placeholder="Product Name">
							</div>
							<div class="form-group">
								<label for="pwd">Product Price:</label> <input type="number"
									class="form-control" id="pprice" placeholder="Product Price">
							</div>
						</div>


						<div class="col-sm-6">
							<div class="form-group">
								<label for="email">Product Quantity:</label> <input
									type="number" class="form-control" id="pquantity"
									placeholder="Product Quantity">
							</div>
							<div class="form-group">
								<label for="email">Purchase Date:</label> <input type="date"
									class="form-control" id="pdate">
							</div>
						</div>


						<div class="col-sm-6">
							<div class="form-group">
								<label for="email">Product Quantity:</label> <input
									type="number" class="form-control" id="pquantity"
									placeholder="Product Quantity">
							</div>

						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<label for="email">Product Quantity:</label> <input
									type="number" class="form-control" id="pquantity"
									placeholder="Product Quantity">
							</div>

						</div>

						<div align="center">
							<button type="submit" class="btn btn-primary" style="width: 60%;"
								id="updbutton">Update Product</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</div>
</p:when>
<p:otherwise>
<p:redirect url="index.jsp"></p:redirect>
</p:otherwise>
</p:choose>