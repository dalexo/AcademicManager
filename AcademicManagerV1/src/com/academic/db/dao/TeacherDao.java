package com.academic.db.dao;

import java.util.List;

import com.academic.model.Person;

public interface TeacherDao extends Dao<Person> {
	
	public List<Person> getTeachers();
	
	public Person getTeacher(int id);

}
