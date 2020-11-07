<%@include file="head.jsp"%>
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
							class="form-control" id="name">
					</div>

					<div class="form-group">
						<label for="price">Price:</label> <input type="number"
							class="form-control" id="price">
					</div>

					<div class="form-group">
						<label for="category">Product Category:</label> <select
							class="form-control" id="category">
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
						<label for="quantity">Quantity:</label> <input type="number"
							class="form-control" id="quantity">
					</div>

					<div class="form-group">
						<label for="date">Email address:</label> <input type="date"
							class="form-control" id="date">
					</div>

					<div class="form-group">
						<label for="image">Product Image:</label> <input type="file"
							class="form-control" id="image">
					</div>

				</div>


				<div class="col-sm-1"></div>

			</div>
			<hr>
			<br>
			<div align="center">
				<button type="submit" style="width: 60%;" class="btn btn-primary">Submit</button>
			</div>

		</div>
		<div class="col-sm-1"></div>
	</div>
</div>
</div>
</div>