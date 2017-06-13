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
		Dao<Person> personDao = null;
		try {
			personDao = DAOFactory.getInstance().getPersonDao();
		} catch (SQLException e) {
			Logger.logDebug("Caught SQLException while trying to retrieve all courses");
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
	}

}
