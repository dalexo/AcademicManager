package com.academic.rest;

import java.sql.SQLException;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import com.academic.db.DAOFactory;
import com.academic.model.Course;

@Path("courses")
public class CourseResource {

	@GET
	public List<Course> allCourses() throws ClassNotFoundException, SQLException {
		List<Course> courses = DAOFactory.getInstance().getCourseDao().getAll();

		return courses;
	}

	@GET
	@Path("{id}")
	public Course course(@PathParam("id") int id) throws ClassNotFoundException, SQLException {
		return DAOFactory.getInstance().getCourseDao().get(id);
	}
}
