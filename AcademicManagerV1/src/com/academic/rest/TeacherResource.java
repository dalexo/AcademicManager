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
import com.academic.model.Person;

@Path("teachers")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class TeacherResource {

	@GET
	public List<Person> allTeachers() throws ClassNotFoundException, SQLException {

		List<Person> teachers = DAOFactory.getInstance().getTeacherDao().getTeachers();

		return teachers;
	}

	@GET
	@Path("{id}")
	public Response teacher(@PathParam("id") int id) throws ClassNotFoundException, SQLException {
		if (id == 0) {
			return Response.serverError().entity("ID cannot be zero").build();
		}

		Person person = DAOFactory.getInstance().getTeacherDao().getTeacher(id);
		if (person.getPersonId() == 0) {
			return Response.status(Status.NOT_FOUND).build();
		}

		return Response.status(Status.FOUND).entity(person).build();
	}

}
