package com.academic.rest;

import java.sql.SQLException;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import com.academic.db.DAOFactory;
import com.academic.model.Course;
import com.academic.model.Person;

@Path("courses")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class CourseResource {

	@GET
	public List<Course> allCourses() throws ClassNotFoundException, SQLException {
		List<Course> courses = DAOFactory.getInstance().getCourseDao().getAll();

		return courses;
	}

	@GET
	@Path("{id}")
	public Response course(@PathParam("id") int id) throws ClassNotFoundException, SQLException {		
		if (id == 0) {
			return Response.serverError().entity("ID cannot be zero").build();
		}

		Course course = DAOFactory.getInstance().getCourseDao().get(id);
		if (course.getCourseId() == -1) {
			return Response.status(Status.NOT_FOUND).build();
		}

		return Response.status(Status.FOUND).entity(course).build();
	}
	
	@GET
	@Path("{id}/teachers")
	public List<Person> getCourseTeachers(@PathParam("id") int id) throws ClassNotFoundException, SQLException {
		
		List<Person> teachers = DAOFactory.getInstance().getTeacherDao().getTeachersByCourseId(id);
		
		return teachers;
	}
}
