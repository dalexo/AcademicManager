<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
h1 {
	text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Homepage</title>
<link rel="stylesheet" type="text/css" href="FrontEnd_Homepage.css">
</head>
<body>
	<%@page
		import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<h1>Welcome</h1>
	<%
		Dao<Course> courseDao = null;

		try {
			courseDao = DAOFactory.getInstance().getCourseDao();

		} catch (SQLException e) {
			out.print("Could not connect to the database");
			e.printStackTrace();
			return;
		}

		List<Course> list = courseDao.getAll();
		request.setAttribute("courses", list);
	%>

	<table>
		<thead>
			<tr>
				<th>Courses</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${courses}" var="course">
				<tr>

					<td><a href="ViewCourseDetails.jsp?id=${course.getCourseId()}"><c:out
								value="${course.getTitle()}" /></a></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
