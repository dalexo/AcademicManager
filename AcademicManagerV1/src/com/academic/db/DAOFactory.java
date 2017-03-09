package com.academic.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.sql.Connection;
import com.academic.db.DAOImpl;
import com.academic.db.dao.CourseDAO;
import com.academic.db.dao.Dao;
import com.academic.model.Course;

//Factory class to retrieve all DAOs
public class DAOFactory {

	// Constants
	private static final String DB_URL = "jdbc:mysql://localhost/AcademicManager";
	private static final String COURSE_DAO_KEY = "course.dao";

	// Attributes
	private Connection dbConnection;
	private Map<String, DAOImpl> daoTable;

	// Singleton instance
	private static DAOFactory instance;

	// Constructor
	protected DAOFactory() throws SQLException {
		dbConnection = DriverManager.getConnection(DB_URL, "AcademicManager_u", "AcademicManager_p");
		daoTable = new HashMap<String, DAOImpl>();
	}

	public static DAOFactory getInstance() throws SQLException {
		if (instance == null) {
			instance = new DAOFactory();
		}

		return instance;
	}

	public Dao<Course> getCourseDao() throws SQLException {
		if (!daoTable.containsKey(COURSE_DAO_KEY)) {
			daoTable.put(COURSE_DAO_KEY, new CourseDAO(dbConnection));
		}

		return (Dao<Course>) daoTable.get(COURSE_DAO_KEY);
	}

	public void close() {

		Collection<DAOImpl> daos = daoTable.values();
		Iterator<DAOImpl> daoIterator = daos.iterator();
		while (daoIterator.hasNext()) {
			daoIterator.next().close();
		}

		try {
			this.dbConnection.close();
		} catch (SQLException e) {
			System.out.println("Could not close connection to database");
			e.printStackTrace();
		}
	}
}
