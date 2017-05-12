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
	private PreparedStatement teachingStatement;
	//CRUD
	private PreparedStatement addStatement;
	private PreparedStatement updateStatement;
	private PreparedStatement deleteStatement;

	public CourseDAO(Connection conn) throws SQLException {
		super(conn);
		selectByIdStatement = dbConnection.prepareStatement(
				"SELECT courseId, title, cost, description, startingDate, endingDate, isActive FROM course WHERE isDeleted=0 AND courseId=?;",
		ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		selectAllStatement = dbConnection.prepareStatement(
				"SELECT courseId, title, cost, description, startingDate, endingDate, isActive FROM course WHERE isDeleted=0;",
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		countStatement = dbConnection.prepareStatement("SELECT COUNT(*) FROM course WHERE isDeleted=0;",
		ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		teachingStatement = dbConnection.prepareStatement(
				"SELECT courseId,person.surname from teaching inner join person on teaching.personId = person.personId",
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

		addStatement = dbConnection.prepareStatement(
				"INSERT INTO course (title, cost, description, startingDate, endingDate, isActive, isDeleted) VALUES ('?','?','?','?','?','?','0');");

		updateStatement = dbConnection.prepareStatement(
				"UPDATE course SET title=?,cost=?,description=?,startingDate=?,endingDate=?,isActive=? WHERE courseId= ?;");
		
		deleteStatement = dbConnection.prepareStatement("UPDATE course SET isDeleted=1 WHERE courseId=?");
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
				course.setCost(resultSet.getInt("cost"));
				course.setDescription(resultSet.getString("description"));
				course.setStartingDate(resultSet.getString("startingDate"));
				course.setEndingDate(resultSet.getString("endingDate"));
				course.setActive(resultSet.getBoolean("isActive"));
				course.setTeachers((getTeachers(course.getCourseId())));
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
				course.setCost(resultSet.getInt("cost"));
				course.setDescription(resultSet.getString("description"));
				course.setStartingDate(resultSet.getString("startingDate"));
				course.setEndingDate(resultSet.getString("endingDate"));
				course.setActive(resultSet.getBoolean("isActive"));
				objectList.add(course);
			}

			resultSet.close();
		} catch (SQLException e) {
			System.out.println("Caught SQLException while trying to retrieve all courses");
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
			System.out.println("Caught SQLException while counting courses");
			e.printStackTrace();
			return -1;
		}
		return count;
	}
	
	@Override
	public void add(Course t) {
		try {
			addStatement.setString(1, t.getTitle());
			addStatement.setInt(2, t.getCost());
			addStatement.setString(3, t.getDescription());
			addStatement.setString(4, t.getStartingDate());
			addStatement.setString(5, t.getEndingDate());
			addStatement.setBoolean(6, t.getActive());
			addStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(Course t) {
		try {
			updateStatement.setString(1, t.getTitle());
			updateStatement.setInt(2, t.getCost());
			updateStatement.setString(3, t.getDescription());
			updateStatement.setString(4, t.getStartingDate());
			updateStatement.setString(5, t.getEndingDate());
			updateStatement.setBoolean(6, t.getActive());
			updateStatement.setInt(7, t.getCourseId());
			updateStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Course t) {
		// TODO Auto-generated method stub
		try {

			deleteStatement.setInt(1, t.getCourseId());
			deleteStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void close() {
		try {
			this.selectAllStatement.close();
			this.selectByIdStatement.close();
			this.countStatement.close();
			this.addStatement.close();
			this.updateStatement.close();
			this.deleteStatement.close();
		} catch (SQLException e) {
			System.out.println("Could not close the DAO statements");
			e.printStackTrace();
		}
	}
	
	private List<String> getTeachers(int id) {
		List<String> result = new ArrayList<>();
		try {
			teachingStatement.setInt(1, id);
			teachingStatement.execute();
			ResultSet resultSet = teachingStatement.getResultSet();

			while (resultSet.next()) {
				if (id == (resultSet.getInt("courseId"))) {
					result.add(resultSet.getString("person.surname"));

				}

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}
}
