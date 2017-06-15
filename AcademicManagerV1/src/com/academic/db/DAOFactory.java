package com.academic.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.Connection;
import com.academic.db.DAOImpl;
import com.academic.db.dao.CourseDAO;
import com.academic.db.dao.CourseRestDAO;
import com.academic.db.dao.Dao;
import com.academic.db.dao.PersonDAO;
import com.academic.db.dao.TeacherDao;
import com.academic.db.dao.UserDAO;
import com.academic.model.Course;
import com.academic.model.Person;
import com.academic.utils.Logger;

//Factory class to retrieve all DAOs
public class DAOFactory {

	// Constants
	private static final String DB_URL = "jdbc:mysql://localhost/AcademicManager";
	private static final String COURSE_DAO_KEY = "course.dao";
	private static final String PERSON_DAO_KEY = "person.dao";
	private static final String USER_DAO_KEY = "user.dao";

	// Attributes
	private Connection dbConnection;
	private Map<String, DAOImpl> daoTable;
	private Context ctx;
	private DataSource ds;

	// Singleton instance
	private static DAOFactory instance;

	// Constructor
	protected DAOFactory() throws SQLException {

		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:/comp/env/AcademicManagerDB");
			dbConnection = ds.getConnection();
		} catch (NamingException e) {
			Logger.logException(e);
		}

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
	
	public Dao<Person> getPersonDao() throws SQLException {
		if (!daoTable.containsKey(PERSON_DAO_KEY)) {
			daoTable.put(PERSON_DAO_KEY, new PersonDAO(dbConnection));
		}
		
		return (Dao<Person>) daoTable.get(PERSON_DAO_KEY);
	}
	
	public TeacherDao getTeacherDao() throws SQLException {
		if (!daoTable.containsKey(PERSON_DAO_KEY)) {
			daoTable.put(PERSON_DAO_KEY, new PersonDAO(dbConnection));
		}
		
		return (TeacherDao) daoTable.get(PERSON_DAO_KEY);
	}
	
	public CourseRestDAO getCourseRestDao() throws SQLException {
		if (!daoTable.containsKey(COURSE_DAO_KEY)) {
			daoTable.put(COURSE_DAO_KEY, new CourseDAO(dbConnection));
		}
		
		return (CourseDAO) daoTable.get(COURSE_DAO_KEY);
	}
	
	public UserDAO getUserDao() throws SQLException {
		if (!daoTable.containsKey(USER_DAO_KEY)) {
			daoTable.put(USER_DAO_KEY, new UserDAO(dbConnection));
		}
		return (UserDAO) daoTable.get(USER_DAO_KEY);
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
			Logger.logDebug("Could not close connection to database");
			Logger.logException(e);
		}
	}
}
