<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
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

			<form method="post" action="courses"
				class="form-horizontal">
				
				<div class="form-group">
					<label class="control-label col-sm-2" for="title">Title:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="title"
							placeholder="e.g. Ancient Greek" >
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cost">Cost:</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" name="cost"
							placeholder="e.g. lots of money" >
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="description">Description:</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="description"
							placeholder="whatever" >
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="startingDate">Starting
						Date:</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" name="startingDate"
							placeholder="e.g. 50 bc" >
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="endingDate">Ending
						Date:</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" name="endingDate"
							placeholder="e.g. 3000 ac" >
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="isActive">Active:</label>
					<div class="col-sm-10">
						<select name="isActive">
							<option value="true">Yes</option>
							<option value="false">No</option>
						</select>
					</div>
				</div>
		
				<button type="submit" class="btn btn-success pull-right btn-space">Save</button>
			</form>
		</div>
	</div>
<%@ include file="../html/Footer.jsp"%>
</body>


</html>
