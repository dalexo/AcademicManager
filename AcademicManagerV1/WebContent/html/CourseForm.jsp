<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Course Form Page</title>
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
	
		<button class="btn btn-color" role="button" value="Back" onclick="window.history.back()">
			Back
		</button>

	</header>

	<div class="div-body">
	
	<div class="container-fluid">
	
	 <form method="post" action="#" class="form-horizontal">
	 <div class="form-group">
       <label class="control-label col-sm-2" for="courseId">Course ID:</label>
       <div class="col-sm-10">
       <label class="form-control" for="courseId"><c:out value="${course.getCourseId()}" /></label>
       </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="title">Course Title:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="title" placeholder="Enter title" value="${course.getTitle()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="cost">Cost:</label>
    <div class="col-sm-10">
      <input type="number" class="form-control" name="cost" placeholder="e.g. 5000" value="${course.getCost()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="description">Description:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="description" placeholder="Enter course description" value="${course.getDescription()}">
      </div>
      </div>	
      <div class="form-group">
       <label class="control-label col-sm-2" for="startingDate">Starting Date:</label>
    <div class="col-sm-10">
      <input type="date" class="form-control" name="startingDate" placeholder="yyyy-mm-dd" value="${course.getStartingDate()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="endingDate">Ending Date:</label>
    <div class="col-sm-10">
      <input type="date" class="form-control" name="endingDate" placeholder="yyyy-mm-dd" value="${course.getEndingDate()}">
      </div>
      </div>
      <div class="form-group">
       <label class="control-label col-sm-2" for="isActive">Active:</label>
    <div class="col-sm-10">
      <select name="isActive>">
      <option value="1">Yes</option>
      <c:set var="activeCourse" value="${course.getActive()}" />	 
      <option value="0" <c:if test="${activeCourse == false}">
      <c:out value="selected" /></c:if>>No</option>    
      </select>
      </div>
      </div>
       <button type="submit" class="btn btn-success pull-right">Save</button>
      </form>	
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
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
				<div class="col-sm-4">
					<h3 class="text-center">
						<a href="#">Useful Links</a>
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
				<div class="col-sm-4">
					<h3 class="text-center">
						<a href="#">Contact Us</a>
					</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
						do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>
			</div>
		</div>
		
	</footer>
</body>


</html>