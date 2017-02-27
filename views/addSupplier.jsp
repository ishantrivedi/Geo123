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
<title>Add Supplier</title>
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
<!-- ---------------------------------------- -->
	<div class="container">
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
					<h1 class="title">Supplier Registration Form</h1>
				</div>
			</div>
		<div class="main-login main-center">

        <form:form class="form-horizontal" action="/geo/admin/addSupplier" method="post" commandName="supplier" enctype="multipart/form-data">

        <div class="form-group">
            <label for="suppliername" class="cols-sm-2 control-label">Supplier Name</label>
            <div class="cols-sm-10">
				<div class="input-group">
				<form:errors path="suppliername" cssStyle="color: #ff0000;" />
				<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
            <form:input path="suppliername" id="suppliername" class="form-Control"/>
            </div>
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="cols-sm-2 control-label">Password</label>
            <div class="cols-sm-10">
				<div class="input-group">
				<form:errors path="password" cssStyle="color: #ff0000;" />
				<span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
            <form:input type="password" path="password" id="password" class="form-Control"/>
            </div>
            </div>
        </div>

        <div class="form-group">
            <label for="email" class="cols-sm-2 control-label">Email</label>
            <div class="cols-sm-10">
				<div class="input-group">
				<form:errors path="email" cssStyle="color: #ff0000;" />
				<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
            <form:input path="email" id="email" class="form-Control"/>
            </div>
            </div>
        </div>

        <div class="form-group">
            <label for="address" class="cols-sm-2 control-label">Address</label>
            <div class="cols-sm-10">
				<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-road fa" aria-hidden="true"></i></span>
            <form:input path="address" id="address" class="form-Control"/>
            </div>
            </div>
        </div>
        
        <div class="form-group" class="cols-sm-2 control-label">
            <label for="mobile">Mobile</label>
            <div class="cols-sm-10">
				<div class="input-group">
				<form:errors path="email" cssStyle="color: #ff0000;" />
				<span class="input-group-addon"><i class="fa fa-phone-square" aria-hidden="true"></i></span>
            <form:input path="mobile" id="mobile" class="form-Control"/>
            </div>
            </div>
        </div>



        <br><br>
        <input type="submit" value="submit" class="btn btn-default">
        <a href="<c:url value="/admin/supplierInventory" />" class="btn btn-default">Cancel</a>
        </form:form>
</div>
</div>
</div>
<br><br>
 <%@include file="/WEB-INF/views/footer.jsp"%>
 </body>
 </html>
