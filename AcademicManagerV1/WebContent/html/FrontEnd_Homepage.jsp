<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page
	import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../html/SecurityCheck.jsp"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../html/Head.jsp"%>
<body>
	<header> </header>
	<div class="div-body">



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

		<div class="container-fluid">
			<div class="row">
				<p>
					Welcome <br><%=secretaryName%>
				</p>
				<div class="col-md-6">
					<button class="btn btn-block btn-primary">Home</button>
					<button class="btn btn-block btn-primary">Courses</button>
					<button class="btn btn-block btn-primary">Students</button>
					<button class="btn btn-block btn-primary">Teachers</button>
				</div>
				<div class="col-md-6">
					<table class="table table-bordered table-responsive table-hover">
						<thead>
							<tr>
								<th>All Available Courses</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${courses}" var="course">
								<tr>

									<td><a
										href="./html/ViewCourseDetails.jsp?id=${course.getCourseId()}"><c:out
												value="${course.getTitle()}" /></a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../html/Footer.jsp"%>

</body>
</html>
