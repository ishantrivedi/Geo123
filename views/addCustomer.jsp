<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<link rel="icon" type="image/png" href="resources\images\earth.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">

		<!-- Website Font style -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<title>Registration Page</title>
<style type="text/css">
body, html{
     height: 100%;
     background-repeat: no-repeat;
 	background-color: #bcbb73;
 	font-family: 'Oxygen', sans-serif;
    font-size: 12px;
}

.main{
 	margin-top: 70px;
}

h1.title { 
	font-size: 50px;
	font-family: 'Passion One', cursive; 
	font-weight: 400; 
}

hr{
	width: 10%;
	color: #fff;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 14px;
}

input,
input::-webkit-input-placeholder {
    font-size: 9px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 330px;
    padding: 40px 40px;

}

.login-button{
	margin-top: 3px;
}

.login-register{
	font-size: 8px;
	text-align: center;
}
</style>
</head>

<body>
	<jsp:include page="menu.jsp"></jsp:include>

	<div class="container">
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
					<h1 class="title">Registration Form</h1>
				</div>
			</div>
		<div class="main-login main-center">	
		${message}
		<form:form class="form-horizontal" id="customer" action="/geo/addCustomer" commandName="customer"
			method="post">

			<h3>Basic Info</h3>

			<div class="form-group">
				<label for="customerName" class="cols-sm-2 control-label">Name</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
				<input id="customerName" name="customerName" path="customerName" class="form-Control" type="text" value="" /> <br />
				</div>
				</div>
			</div>

			<div class="form-group">
			<label for="customerEmail" class="cols-sm-2 control-label">Email</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span> 
				<input id="customerEmail" name="customerEmail" path="customerEmail" class="form-Control" type="text" value="" /> <br />
				</div>
			</div>
			</div>	

			<div class="form-group">
			<label for="customerPhone" class="cols-sm-2 control-label">Phone</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-mobile fa" aria-hidden="true"></i></span>
				<input id="customerPhone" name="customerPhone" path="customerPhone" title="10 digit mobile number" pattern="[0-9]{10}" class="form-Control" type="text" value="" />
				</div>
			</div>
			</div>

			<div class="form-group">
				<label for="username" class="cols-sm-2 control-label">Username</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
				<input id="username" name="username" path="username" class="form-Control" type="text" value="" /> <br />
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="cols-sm-2 control-label">Password</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
				<input id="password" name="password" path="password" class="form-Control" type="password" value="" /> <br />
				</div>
				</div>
			</div>


			<h3>Billing Address</h3>

			<div class="form-group">
				<label for="billingStreet" class="cols-sm-2 control-label">Street Name</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-road fa" aria-hidden="true"></i></span>
				<input id="billingStreet" name="billingAddress.streetName" path="billingAddress.streetName" class="form-Control" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="billingApartmentNumber" class="cols-sm-2 control-label">Apartment Number</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-building fa" aria-hidden="true"></i></span>
				<input id="billingApartmentNumber" name="billingAddress.apartmentNumber" path="billingAddress.apartmentNumber" class="form-Control" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="billingCity" class="cols-sm-2 control-label">City</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-area-chart fa" aria-hidden="true"></i></span>
				<input id="billingCity"	name="billingAddress.city" class="form-Control"	path="billingAddress.city" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="billingState" class="cols-sm-2 control-label">State</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-street-view fa" aria-hidden="true"></i></span>
				<input id="billingState" name="billingAddress.state" class="form-Control" path="billingAddress.state" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="billingCountry" class="cols-sm-2 control-label">Country</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-sitemap" aria-hidden="true"></i></span>
				<input id="billingCountry" name="billingAddress.country" class="form-Control" path="billingAddress.country" type="text"	value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="billingZip" class="cols-sm-2 control-label">Zipcode</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-file-archive-o fa" aria-hidden="true"></i></span>
				<input id="billingZip"name="billingAddress.zipCode" title="6 digit zip code" path="billingAddress.zipCode" pattern="[0-9]{6}" class="form-Control" type="text" value="" /> <br>
				</div>
				</div>
			</div>


			<h3>Shipping Address</h3>

			<div class="form-group">
				<label for="shippingStreet" class="cols-sm-2 control-label">Street Name</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-road fa" aria-hidden="true"></i></span>
				<input id="shippingStreet" name="shippingAddress.streetName" class="form-Control" path="shippingAddress.streetName" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="shippingApartmentNumber" class="cols-sm-2 control-label">Apartment Number</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-building fa" aria-hidden="true"></i></span>
				<input id="shippingApartmentNumber" name="shippingAddress.apartmentNumber" class="form-Control" path="shippingAddress.apartmentNumber" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="shippingCity" class="cols-sm-2 control-label">City</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-area-chart fa" aria-hidden="true"></i></span>
				<input id="shippingCity" name="shippingAddress.city" class="form-Control" path="shippingAddress.city" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="shippingState" class="cols-sm-2 control-label">State</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-street-view fa" aria-hidden="true"></i></span>
				<input id="shippingState" name="shippingAddress.state" class="form-Control"	path="shippingAddress.state" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="shippingCountry" class="cols-sm-2 control-label">Country</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-sitemap" aria-hidden="true"></i></span>
				<input id="shippingCountry" name="shippingAddress.country" class="form-Control" path="shippingAddress.country" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<div class="form-group">
				<label for="shippingZip" class="cols-sm-2 control-label">Zipcode</label>
				<div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-file-archive-o fa" aria-hidden="true"></i></span>
				<input id="shippingZip" name="shippingAddress.zipCode" title="6 digit zip code"	path="shippingAddress.zipCode" pattern="[0-9]{6}" class="form-Control" type="text" value="" /> <br>
				</div>
				</div>
			</div>

			<br> <br> <input type="submit" value="submit"
				class="btn btn-default"> <a href="/geo/"
				class="btn btn-default">Cancel</a>
		</form:form>
		</div>
		</div>
	</div>
	<br>
	<br>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>