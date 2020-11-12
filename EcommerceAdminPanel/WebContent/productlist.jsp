<head>
<meta http-equiv="Cache-control" content="no-cache">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#search")
								.on(
										"keyup",
										function() {
											var value = $(this).val()
													.toLowerCase();
											$("table tbody .tr")
													.filter(
															function() {
																$(this)
																		.toggle(
																				$(
																						this)
																						.text()
																						.toLowerCase()
																						.indexOf(
																								value) > -1)
															});
										});

						var id;
						$("table tbody .tr td")
								.click(
										function() {

											var text = $(this).find("button")
													.text();
											//var text = $(this).find("img").attr(src);
											if (text == "") {

											} else {
												id = $(this).closest(".tr")
														.find('td.id').text();

												var name = $(this).closest(
														".tr").find('td.name')
														.text();

												var price = $(this).closest(
														".tr").find('td.price')
														.text();

												var quantity = $(this).closest(
														".tr").find(
														'td.quantity').text();

												var date = $(this).closest(
														".tr").find('td.date')
														.text();

												var category = $(this).closest(
														".tr").find(
														'td.category').text();

												var image = $(this).closest(
														".tr").find(
														'td.image img').attr(
														"src");

												if (text == "Edit") {
													
													$("#myimage").attr("src",
															image);
													$("#myimagename").val(image);
													$("#proid").val(id);
													$("#pname").val(name);
													$("#pprice").val(price);
													$("#pquantity").val(
															quantity);
													$("#pdate").val(date);
													$("#pcategory").val(
															category);

													$('#myModal1')
															.modal('show');

												} else {
													if (confirm("Are you sure you want to delete this product ?")) {
														$.post("product", {
															opt : 2,
															id : id,
														}, function(response) {
															location.reload();
														});
													} else {
														return false;
													}
												}

											}
										});

						$("#updbutton").click(function() {
							/* var name=$("#pname").val();
							var price=$("#pprice").val();
							var quantity=$("#pquantity").val();
							var date=$("#pdate").val();
							var category=$("#pcategory").val(); */

							var url = "product?opt=3";
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
									alert(msg);
									$('#myModal1')
									.modal('hide');
									location.reload();
									

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
								<th>PRICE</th>
								<th>QUANTITY</th>
								<th>DATE</th>
								<th>Category</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>

							<p:forEach items="${sessionScope.products}" var="product">



								<tr class="tr">
									<td class="id">${product.id}</td>
									<td class="name">${product.name}</td>
									<td class="price">${product.price}</td>
									<td class="quantity">${product.quantity}</td>
									<td class="date">${product.date}</td>
									<td class="category">${product.category}</td>
									<td><button class="btn btn-primary">Edit</button></td>
									<td>
										<button class="btn btn-danger">Delete</button>
									</td>
									<td class="image"><img src="products/${product.mainimage}"
										width="30" height="30"></td>
								</tr>



							</p:forEach>
						</tbody>
					</table>
				</div>

			</div>

			<form id="sampleUploadFrm" method="POST"
				enctype="multipart/form-data">
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
											id="myimage" src="images/defaultimage.jpg" width="100"
											height="100">
									</p>
									<hr>

									<div class="col-sm-6">
										<div class="form-group">
											<label for="name">Product Name:</label> <input type="text"
												class="form-control" id="pname" placeholder="Product Name"
												name="name">
										</div>
										<div class="form-group">
											<label for="price">Product Price:</label> <input
												type="number" class="form-control" id="pprice"
												placeholder="Product Price" name="price">
										</div>
									</div>


									<div class="col-sm-6">
										<div class="form-group">
											<label for="quantity">Product Quantity:</label> <input
												type="number" class="form-control" id="pquantity"
												placeholder="Product Quantity" name="quantity">
										</div>
										<div class="form-group">
											<label for="date">Purchase Date:</label> <input type="date"
												class="form-control" id="pdate" name="date">
										</div>
									</div>

									<div><input id="myimagename" type="hidden" name="imagename"></div>
									<div><input id="proid" type="hidden" name="productid"></div>

									<div class="col-sm-6">
										<div class="form-group">
											<label for="category">Product Category:</label> <select
												class="form-control" id="pcategory" name="category">
												<option>Select Category</option>
												<option>Men</option>
												<option>Women</option>
												<option>Home</option>
											</select>
										</div>

									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label for="image">Product Image:</label> <input type="file"
												class="form-control" id="pimage"
												placeholder="Product Quantity" name="image">
										</div>

									</div>

									<div align="center">
										<button type="button" class="btn btn-primary"
											style="width: 60%;" id="updbutton">Update Product</button>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</p:when>
	<p:otherwise>
		<p:redirect url="index.jsp"></p:redirect>
	</p:otherwise>
</p:choose>