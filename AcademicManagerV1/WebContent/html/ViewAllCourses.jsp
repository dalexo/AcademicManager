<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.academic.model.Course"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../html/SecurityCheck.jsp" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../html/Head.jsp"%>
<body>
	<header>
		<a href="./SecretaryMain.jsp">
			<button class="btn btn-color" role="button">Back</button>
		</a> <a href="./NewCourseForm.jsp">
			<button class="btn btn-success pull-right">Add New Course</button>
		</a>
	</header>
	<div class="div-body">
             
		<div class="container-fluid">

			<div class="col-md-12">
				<table class="table table-bordered table-responsive table-hover">
					<thead>
						<tr>
							<th>All Available Courses</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${courses}" var="course">
							<tr>

								<td><a href="./courses?id=${course.getCourseId()}"><c:out
											value="${course.getTitle()}" /></a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<%@ include file="../html/Footer.jsp"%>
</body>
</html>