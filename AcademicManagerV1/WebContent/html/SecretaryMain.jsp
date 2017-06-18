<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../html/Head.jsp"%>
<body>
	<header> </header>
	<div class="div-body">

		<div class="container-fluid">
			<div class="row">
				<%@ include file="../html/SecurityCheck.jsp"%>
				<p>
					Welcome <br><%=secretaryName%>
				</p>


				<div class="col-md-12">
					<a href="courses" class="btn btn-block btn-primary">Courses</a> 
					<a href="./persons?type=students" class="btn btn-block btn-primary">Students</a>
					<a href="./persons?type=teachers" class="btn btn-block btn-primary">Teachers</a>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="../html/Footer.jsp"%>
</body>
</html>