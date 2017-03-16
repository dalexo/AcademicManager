package com.academic.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.academic.db.DAOImpl;
import com.academic.model.Course;

public class CourseDAO extends DAOImpl<Course> {

	private PreparedStatement selectByIdStatement;
	private PreparedStatement selectAllStatement;
	private PreparedStatement countStatement;

	public CourseDAO(Connection conn) throws SQLException {
		super(conn);
		selectByIdStatement = dbConnection.prepareStatement(
				"SELECT courseId, title, cost, description, startingDate, endingDate, isActive FROM course WHERE isActive=1 AND courseId=?;");
		selectAllStatement = dbConnection.prepareStatement(
				"SELECT courseId, title, cost, description, startingDate, endingDate, isActive FROM course WHERE isActive=1;");
		countStatement = dbConnection.prepareStatement("SELECT COUNT(*) FROM course WHERE isActive=1;");
	}

	@Override
	public Course get(int id) {
		Course course = new Course();

		try {
			selectByIdStatement.setInt(1, id);
			selectByIdStatement.execute();
			ResultSet resultSet = selectByIdStatement.getResultSet();
			if (resultSet.first()) {
				course.setCourseId(resultSet.getInt("courseId"));
				course.setTitle(resultSet.getString("title"));
				course.setDescription(resultSet.getString("description"));
				course.setStartingDate(resultSet.getString("startingDate"));
				course.setEndingDate(resultSet.getString("endingDate"));

			}
			resultSet.close();
		} catch (SQLException e) {
			System.out.println("Caught SQLException while executing get by id: " + id);
			e.printStackTrace();
			return null;
		}

		return course;
	}

	@Override
	public List<Course> getAll() {
		ResultSet resultSet;
		List<Course> objectList = new ArrayList<>();

		try {
			resultSet = selectAllStatement.executeQuery();

			while (resultSet.next()) {
				Course course = new Course();
				course.setCourseId(resultSet.getInt("courseId"));
				course.setTitle(resultSet.getString("title"));
				course.setDescription(resultSet.getString("description"));
				course.setStartingDate(resultSet.getString("startingDate"));
				course.setEndingDate(resultSet.getString("endingDate"));
				objectList.add(course);
			}

			resultSet.close();
		} catch (SQLException e) {
			System.out.println("Caught SQLException while trying to retrieve all WP posts");
			e.printStackTrace();
			return null;
		}

		return objectList;
	}

	@Override
	public int countAll() {
		int count = 0;
		try {
			ResultSet resultSet = countStatement.executeQuery();
			if (resultSet.first()) {
				count = resultSet.getInt(1);
			}
			resultSet.close();
		} catch (SQLException e) {
			System.out.println("Caught SQLException while counting WP posts");
			e.printStackTrace();
			return -1;
		}
		return count;
	}

	@Override
	public void close() {
		try {
			this.selectAllStatement.close();
			this.selectByIdStatement.close();
			this.countStatement.close();
		} catch (SQLException e) {
			System.out.println("Could not close the DAO statements");
			e.printStackTrace();
		}
	}
}
