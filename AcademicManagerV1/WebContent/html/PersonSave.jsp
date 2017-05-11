<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@page
		import="com.academic.db.*,com.academic.model.*,com.academic.db.dao.*,java.sql.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<%
		int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String sex = request.getParameter("sex");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String taxNumber = request.getParameter("taxNumber");
        String bankAccount = request.getParameter("bankAccount");

		Dao<Person> personDao = null;
		
		try {
			personDao = DAOFactory.getInstance().getPersonDao();

		} catch (SQLException e) {
			out.print("Could not connect to the database");
			e.printStackTrace();
			return;
		}
		
		Person p = new Person();
		p.setName(name);
		p.setSurname(surname);
		p.setDateOfBirth(dateOfBirth);
		p.setSex(sex);
		p.setEmail(email);
		p.setPhoneNumber(phoneNumber);
		p.setAddress(address);
		p.setTaxNumber(taxNumber);
		p.setBankAccount(bankAccount);
		p.setPersonId(id);	
		personDao.update(p);
	    
	%>
	
	<%	
		// Redirect to another page. 
		response.sendRedirect("./ViewAllStudents.jsp?");
	%>
		
