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
		<button class="btn btn-color" role="button">
			Back
		</button>
			</a>
	</header>

	<div class="div-body">

		<h3>View Course Details</h3>

		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>

					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Description</th>
						<th>Cost</th>
						<th>startingDate</th>
						<th>endingDate</th>
						<th>isActive</th>
						<th>Teachers</th>
					</tr>
				</thead>
				<tbody>

					<tr>

						<td><c:out value="${course.getCourseId()}" /></td>
						<td><c:out value="${course.getTitle()}" /></td>
						<td><c:out value="${course.getDescription()}" /></td>
						<td><c:out value="${course.getCost()}" /></td>
						<td><c:out value="${course.getStartingDate()}" /></td>
						<td><c:out value="${course.getEndingDate()}" /></td>
						<td><c:out value="${course.getActive()}" /></td>



					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<footer>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4">
					<h3 class="text-center">
						<a href="#">About</a>
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
						reprehenderit in voluptate velit esse cillum dolore eu fugiat
						nulla pariatur.</p>
				</div>
				<div class="col-sm-4">
					<h3 class="text-center">
						<a href="#">Useful Links</a>
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
						reprehenderit in voluptate velit esse cillum dolore eu fugiat
						nulla pariatur.</p>
				</div>
				<div class="col-sm-4">
					<h3 class="text-center">
						<a href="#">Contact Us</a>
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
						reprehenderit in voluptate velit esse cillum dolore eu fugiat
						nulla pariatur.</p>
				</div>
			</div>
		</div>
		<!--  <nav>
		<ul>
			<li><a href="#">About</a></li>
			<li><a href="#">Useful Links</a></li>
			<li><a href="#">Contact Us</a></li>
		</ul>
      </nav> -->
	</footer>
</body>


</html>
