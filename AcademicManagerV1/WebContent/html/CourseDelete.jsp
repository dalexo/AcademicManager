<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page
	import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String type = request.getParameter("type");

	Dao<Course> courseDao = null;

	try {
		courseDao = DAOFactory.getInstance().getCourseDao();

	} catch (SQLException e) {
		out.print("Could not connect to the database");
		e.printStackTrace();
		return;
	}

	Course c = new Course();

	c.setCourseId(id);
	courseDao.delete(c);
%>

<%
	response.sendRedirect("courses");
%>