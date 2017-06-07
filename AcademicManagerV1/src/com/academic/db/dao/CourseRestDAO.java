package com.academic.db.dao;

import java.util.List;

import com.academic.model.Course;

public interface CourseRestDAO extends Dao<Course> {
	
	public List<Course> getCoursesByTeacherId(int id);

}
