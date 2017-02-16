<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Course Details</title>
</head>
<body>
	<center><h1>Update Course Details</h1></center>
	<p></p>

	<form action="main.jsp" method="POST">
		Course Name: <input type="text" name="Course_Name"> <br />
		Course Duration: <input type="text" name="Course_Duration" /> <br />
		Course Cost: <input type="text" name="Course_Name"> <br />
		Starting Date: <input type="text" name="Course_Duration" /> <br />
		Ending Date: <input type="text" name="Course_Name"> <br /> <input
			type="submit" value="Save" />
	</form>
</body>
</html>