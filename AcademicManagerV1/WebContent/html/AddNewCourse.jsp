<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page
	import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String title = request.getParameter("title");
	int cost = Integer.parseInt(request.getParameter("cost"));
	String description = request.getParameter("description");
	String startingDate = request.getParameter("startingDate");
	String endingDate = request.getParameter("endingDate");
	boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));
    
	Dao<Course> courseDao = null;

	try {
		courseDao = DAOFactory.getInstance().getCourseDao();

	} catch (SQLException e) {
		out.print("Could not connect to the database");
		e.printStackTrace();
		return;
	}

	Course c = new Course();
	c.setTitle(title);
	c.setCost(cost);
	c.setDescription(description);
	c.setStartingDate(startingDate);
	c.setEndingDate(endingDate);
	c.setActive(isActive);
	courseDao.add(c);
%>

<%
	response.sendRedirect("courses");
%>
