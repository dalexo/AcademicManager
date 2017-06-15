<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to HAU</title>
<link rel="stylesheet" href="../css/login.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
</head>
<body>

	<h1>Hellenic American Union</h1>
	<div id="alertBox"><span class="closebtn">&times</span><h4>Username or password is incorrect, please try again</h4></div>
	<form action="/AcademicManagerV1/UserAuthentication" method="post">
		<div id="login-form">
			<label for="username">Username:</label><br> <input type="text"
				id="username" name="username" value="" autofocus=""
				required="required"><br> <label for="password">Password:</label><br>
			<input type="password" id="password" name="password" value=""
				required="required"><br> <input type="checkbox"
				id="checkbox" name="rememberme" value="true" checked=""> <label
				for="checkbox" id="remember-me-label">Remember me</label><br>
			<div class="btn-container">
				<input type="submit" value="Login" id="login-btn" class="btn">
			</div>
			<div class="btn-container">
				<!-- for onclick event add a method in tag below -->
				<button type="button" name="register" class="btn">Register</button>
			</div>
			<div class="reset-pass">
				<p>
					Forget your password? Reset <a href="#">here</a>
				</p>
			</div>

		</div>

	</form>
	<script src="../node_modules/jquery/dist/jquery.js"></script>
	
	 <c:choose>
		<c:when test="${ param.authentication == false   }">
		  <script type="text/javascript" src="../js/loginFailed.js"></script>
		  
		</c:when>
		<c:otherwise>
		
		  <script type="text/javascript" src="../js/verifyLogin.js"></script>
		</c:otherwise>
	</c:choose>
	

</body>
</html>