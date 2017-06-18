<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../html/SecurityCheck.jsp" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../html/Head.jsp"%>


<body>
	<header>

		<button class="btn btn-color" role="button" value="Back"
			onclick="window.history.back()">Back</button>

	</header>

	<div class="div-body">

		<div class="container-fluid">

			<form method="post" action="persons"
				class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="type">Person
						Type:</label>
					<div class="col-sm-10">
						<label class="form-control" for="type"><c:out
								value="${param.type}" /></label> <input type="hidden" name="type"
							value="${param.type}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="name">Name:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name"
							placeholder="e.g. Mitsos">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="surname">Surname:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="surname"
							placeholder="e.g. Spasoklampanias">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="dateOfBirth">Birthday:</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" name="dateOfBirth"
							placeholder="yyyy-mm-dd">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="sex">Sex:</label>
					<div class="col-sm-10">
						<select name="sex">
							<option value="Male">Male</option>
							<option value="Female">Female</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email:</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" name="email"
							placeholder="e.g. spaso@gmail.com">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="phoneNumber">Phone
						Number:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="phoneNumber"
							placeholder="e.g. 6906969696">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="address">Address:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="address"
							placeholder="e.g. Massalias 6">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="taxNumber">Tax
						Number:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="taxNumber"
							placeholder="e.g. 058435568">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="bankAccount">Bank
						Account:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="bankAccount"
							placeholder="Enter bank account">
					</div>
				</div>
				<button type="submit" class="btn btn-success pull-right">Save</button>
			</form>
		</div>
	</div>
<%@ include file="../html/Footer.jsp"%>
</body>

</html>
