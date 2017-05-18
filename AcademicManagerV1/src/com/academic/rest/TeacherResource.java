package com.academic.rest;

import java.sql.SQLException;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import com.academic.db.DAOFactory;
import com.academic.model.Person;

@Path("teachers")
public class TeacherResource {

	@GET
	public List<Person> allTeachers() throws ClassNotFoundException, SQLException {
		
		List<Person> teachers = DAOFactory.getInstance().getTeacherDao().getTeachers();

		return teachers;
	}

	@GET
	@Path("{id}")
	public Person teacher(@PathParam("id") int id) throws ClassNotFoundException, SQLException {
		return DAOFactory.getInstance().getTeacherDao().getTeacher(id);
	}

}
