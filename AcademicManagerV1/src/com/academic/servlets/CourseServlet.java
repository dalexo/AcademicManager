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
import com.academic.model.Course;
import com.academic.utils.Logger;

@WebServlet("/html/courses")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idm = request.getParameter("id");
		String del = request.getParameter("del");

		if (del != null) {
			if (del.equals("yes")) {

				int id = Integer.parseInt(request.getParameter("id"));

				Dao<Course> courseDao = null;

				try {
					courseDao = DAOFactory.getInstance().getCourseDao();

				} catch (SQLException e) {
					Logger.logDebug("Caught SQLException while trying to delete course");
					Logger.logException(e);
					return;
				}

				Course c = new Course();

				c.setCourseId(id);
				courseDao.delete(c);
				response.sendRedirect("courses");
				return;
			}
		}

		if (idm != null) {
			int id = Integer.parseInt(request.getParameter("id"));

			Dao<Course> courseDao = null;

			try {
				courseDao = DAOFactory.getInstance().getCourseDao();

			} catch (SQLException e) {
				Logger.logDebug("Caught SQLException while trying to retrieve course");
				Logger.logException(e);
				return;
			}
			Course c = courseDao.get(id);
			request.setAttribute("course", c);
			RequestDispatcher dispatcher = request.getRequestDispatcher("./CourseForm.jsp");
			dispatcher.forward(request, response);
			return;
		} else {

			Dao<Course> courseDao = null;
			try {
				courseDao = DAOFactory.getInstance().getCourseDao();
			} catch (SQLException e) {
				Logger.logDebug("Caught SQLException while trying to retrieve courses");
				Logger.logException(e);
				return;
			}
			List<Course> list = courseDao.getAll();
			request.setAttribute("courses", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("./ViewAllCourses.jsp");
			dispatcher.forward(request, response);
			return;

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idm = request.getParameter("id");

		if (idm != null) {
			int id = Integer.parseInt(request.getParameter("id"));
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
				Logger.logDebug("Caught SQLException while trying to update course");
				Logger.logException(e);
				return;
			}

			Course c = new Course();
			c.setTitle(title);
			c.setCost(cost);
			c.setDescription(description);
			c.setStartingDate(startingDate);
			c.setEndingDate(endingDate);
			c.setActive(isActive);
			c.setCourseId(id);
			courseDao.update(c);

			response.sendRedirect("courses");
			return;

		} else {

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
				Logger.logDebug("Caught SQLException while trying to add course");
				Logger.logException(e);
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
			response.sendRedirect("courses");
			return;
		}

	}
}
