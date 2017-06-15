package com.academic.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.academic.db.DAOFactory;
import com.academic.db.dao.Dao;
import com.academic.model.User;
import com.academic.utils.Logger;

/**
 * Servlet implementation class UserAuthentication
 */
public class UserAuthentication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Dao<User> userDao = null;
	List<User> allUsers = new ArrayList<>();
	Cookie loginCookie;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserAuthentication() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String username, password;

		username = request.getParameter("username");
		password = request.getParameter("password");
		Logger.logDebug("username " + username);

		try {
			userDao = DAOFactory.getInstance().getUserDao();
		} catch (SQLException e) {
			Logger.logDebug("Could not connect to the database");
			e.printStackTrace();
			return;
		}

		allUsers = userDao.getAll();

		for (int i = 0; i < allUsers.size(); i++) {
			if (allUsers.get(i).getUserEmail().equalsIgnoreCase(username)
					&& allUsers.get(i).getUserPassword().equals(password)) {
				// user has been authenticated
				loginCookie = new Cookie("user", username);
				loginCookie.setMaxAge(60 * 60);
				response.addCookie(loginCookie);
				request.setAttribute("isAuthenticated", "true");
				response.sendRedirect("/AcademicManagerV1/html/FrontEnd_Homepage.jsp");
			} else {
				// user's credential is wrong, redirect him to the login page
				Logger.logDebug("Authentication failed...");
				response.sendRedirect("/AcademicManagerV1/html/login.jsp?authentication=false");

			}
		}
	}

}
