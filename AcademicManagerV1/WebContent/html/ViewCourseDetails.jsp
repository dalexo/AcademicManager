<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Course Details Page</title>
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
	<%@page
		import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<label class="control-label col-sm-2">Course
					ID:</label>
				<div class="col-sm-10">
					<label class="form-control" ><c:out
							value="${course.getCourseId()}" /></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Course
					Title:</label>
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
				<label class="control-label col-sm-2">Starting
					Date:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getStartingDate()}" /></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Ending
					Date:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getEndingDate()}" /></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Course
					Teachers:</label>
				<div class="col-sm-10">
					<label class="form-control"><c:out
							value="${course.getTeachers()}" /></label>
				</div>
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
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
					<div class="col-sm-4">
						<h3 class="text-center">
							<a href="#">Useful Links</a>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
					<div class="col-sm-4">
						<h3 class="text-center">
							<a href="#">Contact Us</a>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
				</div>
			</div>

		</footer>
</body>


</html>
