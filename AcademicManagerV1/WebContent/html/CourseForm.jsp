<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.academic.model.Course"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<%@ include file="../html/Head.jsp"%>


<body>

	<header>

		<button class="btn btn-color" role="button" value="Back"
			onclick="window.history.back()">Back</button>

	</header>

	<div class="div-body">

		<div class="container-fluid">

			<form method="post"
				action="./courses?id=${course.getCourseId()}"
				class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-sm-2" for="courseId">Course
						ID:</label>
					<div class="col-sm-10">
						<label class="form-control" for="courseId"><c:out
								value="${course.getCourseId()}" /></label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="title">Title:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="title"
							placeholder="e.g. Ancient Greek" value="${course.getTitle()}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cost">Cost:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="cost"
							placeholder="e.g. lots of money" value="${course.getCost()}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="description">Description:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="description"
							placeholder="whatever" value="${course.getDescription()}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="startingDate">Starting
						Date:</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" name="startingDate"
							placeholder="e.g. 50 bc" value="${course.getStartingDate()}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="endingDate">Ending
						Date:</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" name="endingDate"
							placeholder="e.g. 3000 ac" value="${course.getEndingDate()}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="isActive">Active:</label>
					<div class="col-sm-10">
						<select name="isActive">
							<option value="true">Yes</option>
							<c:set var="active" value="${course.getActive()}" />
							<option value="false"
								<c:if test="${active == '0'}">
      <c:out value="selected" /></c:if>>No</option>
						</select>
					</div>
				</div>
				<a href="courses?id=${course.getCourseId()}&del=yes"
					role="button" class="btn btn-danger pull-right btn-space">
					Delete </a>
				<button type="submit" class="btn btn-success pull-right btn-space">Save</button>
			</form>
		</div>
	</div>
<%@ include file="../html/Footer.jsp"%>
</body>


</html>
