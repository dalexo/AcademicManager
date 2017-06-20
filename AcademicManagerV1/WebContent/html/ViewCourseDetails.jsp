<%@page
	import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../html/SecurityCheck.jsp"%>

<!DOCTYPE html>
<html lang="en">

<%@ include file="../html/Head.jsp"%>


<body>

	<%
		int id = Integer.parseInt(request.getParameter("id"));

		Dao<Course> courseDao = null;

		try {
			courseDao = DAOFactory.getInstance().getCourseDao();

		} catch (SQLException e) {
			out.print("Could not connect to the database");
			e.printStackTrace();
			return;
		}
		Course c = courseDao.get(id);
		request.setAttribute("course", c);
	%>
	<header>
		<a href="/AcademicManagerV1">
			<button class="btn btn-color" role="button">Back</button>
		</a>
	</header>

	<div class="div-body">

		<h3>Course Details</h3>

		<div class="container-fluid">

			<div class="form-group">
				<label class="control-label col-sm-2">Course ID:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getCourseId()}" /></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Course Title:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getTitle()}" /></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Cost:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getCost()}" /></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Description:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getDescription()}" /></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Starting Date:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getStartingDate()}" /></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Ending Date:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getEndingDate()}" /></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Course Teachers:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getTeachers()}" /></label>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../html/Footer.jsp"%>
</body>


</html>
