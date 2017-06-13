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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Dao<Course> courseDao = null;
		try {
			courseDao = DAOFactory.getInstance().getCourseDao();
		} catch (SQLException e) {
			Logger.logDebug("Caught SQLException while trying to retrieve all courses");
			Logger.logException(e);
			return;
		}
		List<Course> list = courseDao.getAll();
		request.setAttribute("courses", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./ViewAllCourses.jsp");
		dispatcher.forward(request, response);
		
	}

}
