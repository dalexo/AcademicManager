<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page
	import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String type = request.getParameter("type");

	Dao<Person> personDao = null;

	try {
		personDao = DAOFactory.getInstance().getPersonDao();

	} catch (SQLException e) {
		out.print("Could not connect to the database");
		e.printStackTrace();
		return;
	}

	Person p = new Person();

	p.setPersonId(id);
	personDao.delete(p);
%>

<%
	if (type.equals("Student")) {
		response.sendRedirect("./ViewAllStudents.jsp");
		return;
	}

	response.sendRedirect("./ViewAllTeachers.jsp");
%>