<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.academic.model.Person"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../html/SecurityCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>All Teachers</title>
<link rel="stylesheet" type="text/css"
	href="../css/FrontEnd_Homepage.css" media="screen">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<a href="./SecretaryMain.html">
			<button class="btn btn-color" role="button">Back</button>
		</a> <a href="./NewPersonForm.jsp?type=Teacher">
			<button class="btn btn-success pull-right">Add New Teacher</button>
		</a>
	</header>
	<div class="div-body">

		<div class="container-fluid">

			<div class="col-md-12">
				<table class="table table-bordered table-responsive table-hover">
					<thead>
						<tr>
							<th>All Available Teachers</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${persons}" var="person">
							<c:set var="personType" value="${person.getType()}" />
							<c:if test="${personType == 'Teacher'}">
								<tr>
									<td><a href="./PersonForm.jsp?id=${person.getPersonId()}">
											<c:out value="${person.getName()}" /> <c:out
												value="${person.getSurname()}" />
									</a></td>
								</tr>
							</c:if>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<footer>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4">
					<h3 class="text-center">
						<a href="#">About</a>
					</h3>

				</div>
				<div class="col-sm-4">
					<h3 class="text-center">
						<a href="#">Useful Links</a>
					</h3>

				</div>
				<div class="col-sm-4">
					<h3 class="text-center">
						<a href="#">Contact Us</a>
					</h3>

				</div>
			</div>
		</div>
	</footer>
</body>
</html>