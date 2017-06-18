<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.academic.model.Person"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../html/SecurityCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Person Form Page</title>
<link rel="stylesheet" type="text/css"
	href="../css/SecretaryMain.css" media="screen">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>


<body>
	
	<header>
	
		<button class="btn btn-color" role="button" value="Back" onclick="window.history.back()">
			Back
		</button>

	</header>

	<div class="div-body">
	
	<div class="container-fluid">
	 
	 <form method="post" action="./persons?id=${person.getPersonId()}" class="form-horizontal">
	 <div class="form-group">
       <label class="control-label col-sm-2" for="personId">Person ID:</label>
       <div class="col-sm-10">
       <label class="form-control" for="personId"><c:out value="${person.getPersonId()}" /></label>
       </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="type">Person Type:</label>
       <div class="col-sm-10">
       <label class="form-control" for="type"><c:out value="${person.getType()}" /></label>
       <input type="hidden" name="type" value="${person.getType()}">
       </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="name">Name:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="name" placeholder="e.g. Mitsos" value="${person.getName()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="surname">Surname:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="surname" placeholder="e.g. Spasoklampanias" value="${person.getSurname()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="dateOfBirth">Birthday:</label>
    <div class="col-sm-10">
      <input type="date" class="form-control" name="dateOfBirth" placeholder="yyyy-mm-dd" value="${person.getDateOfBirth()}">
      </div>
      </div>	
      <div class="form-group">
       <label class="control-label col-sm-2" for="sex">Sex:</label>
    <div class="col-sm-10">
      <select name="sex">
      <option value="Male">Male</option>
      <c:set var="personSex" value="${person.getSex()}" />	 
      <option value="Female" <c:if test="${personSex == 'Female'}">
      <c:out value="selected" /></c:if>>Female</option>
      </select>
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="email">Email:</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="email" placeholder="e.g. spaso@gmail.com" value="${person.getEmail()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="phoneNumber">Phone Number:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="phoneNumber" placeholder="e.g. 6906969696" value="${person.getPhoneNumber()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="address">Address:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="address" placeholder="e.g. Massalias 6" value="${person.getAddress()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="taxNumber">Tax Number:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="taxNumber" placeholder="e.g. 058435568" value="${person.getTaxNumber()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="bankAccount">Bank Account:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="bankAccount" placeholder="Enter bank account" value="${person.getBankAccount()}">
      </div>
      </div>
      <a href="persons?id=${person.getPersonId()}&type=${person.getType()}&del=yes" role="button" class="btn btn-danger pull-right btn-space">
       Delete
       </a>
       <button type="submit" class="btn btn-success pull-right btn-space">Save</button>
      </form>	
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
