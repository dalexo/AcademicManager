package com.academic.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.academic.db.DAOFactory;
import com.academic.db.dao.Dao;
import com.academic.model.Person;
import com.academic.utils.Logger;

@WebServlet("/html/persons")
public class PersonsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String type = request.getParameter("type");
		String idm = request.getParameter("id");
		String del = request.getParameter("del");

		if ((del != null) && del.equals("yes")) {

			int id = Integer.parseInt(request.getParameter("id"));
			type = request.getParameter("type");

			Dao<Person> personDao = null;

			try {
				personDao = DAOFactory.getInstance().getPersonDao();

			} catch (SQLException e) {
				Logger.logDebug("Caught SQLException while trying to delete person");
				Logger.logException(e);
				return;
			}

			Person p = new Person();

			p.setPersonId(id);
			personDao.delete(p);
			if (type.equals("Student")) {
				response.sendRedirect("./persons?type=students");
				return;
			}

			response.sendRedirect("./persons?type=teachers");
			return;

		}

		if (idm == null) {
			Dao<Person> personDao = null;
			try {
				personDao = DAOFactory.getInstance().getPersonDao();
			} catch (SQLException e) {
				Logger.logDebug("Caught SQLException while trying to retrieve persons");
				Logger.logException(e);
				return;
			}
			List<Person> list = personDao.getAll();
			request.setAttribute("persons", list);

			if (type.equals("students")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("./ViewAllStudents.jsp");
				dispatcher.forward(request, response);
				return;
			} else if (type.equals("teachers")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("./ViewAllTeachers.jsp");
				dispatcher.forward(request, response);
				return;
			}
			return;
		} else if (idm != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			Dao<Person> personDao = null;

			try {
				personDao = DAOFactory.getInstance().getPersonDao();

			} catch (SQLException e) {
				Logger.logDebug("Caught SQLException while trying to retrieve person");
				Logger.logException(e);
				return;
			}
			Person c = personDao.get(id);
			request.setAttribute("person", c);
			RequestDispatcher dispatcher = request.getRequestDispatcher("./PersonForm.jsp");
			dispatcher.forward(request, response);
			return;

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idm = request.getParameter("id");

		if (idm != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			String type = request.getParameter("type");
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
				Logger.logDebug("Caught SQLException while trying to update person");
				Logger.logException(e);
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

			if (type.equals("Student")) {
				response.sendRedirect("./persons?type=students");
				return;
			}

			response.sendRedirect("./persons?type=teachers");
			return;
		} else {
			String type = request.getParameter("type");
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
				Logger.logDebug("Caught SQLException while trying to add person");
				Logger.logException(e);
				return;
			}

			Person p = new Person();
			p.setName(name);
			p.setSurname(surname);
			p.setType(type);
			p.setDateOfBirth(dateOfBirth);
			p.setSex(sex);
			p.setEmail(email);
			p.setPhoneNumber(phoneNumber);
			p.setAddress(address);
			p.setTaxNumber(taxNumber);
			p.setBankAccount(bankAccount);

			personDao.add(p);

			if (type.equals("Student")) {
				response.sendRedirect("./persons?type=students");
				return;
			}

			response.sendRedirect("./persons?type=teachers");
			return;
		}
	}
}
