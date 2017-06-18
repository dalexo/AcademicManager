<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.academic.model.Person"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../html/SecurityCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../html/Head.jsp"%>
<body>
	<header>
		<a href="./SecretaryMain.jsp">
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
									<td><a href="persons?id=${person.getPersonId()}">
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
<%@ include file="../html/Footer.jsp"%>
</body>
</html>