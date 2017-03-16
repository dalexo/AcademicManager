<html>

<head>

<title>Course Details Page</title>

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

	<p>View Course Details</p>


	<table>
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
				<td><c:out value="${course.isActive()}" /></td>
				


			</tr>
		</tbody>
	</table>


</body>


</html>
