package com.academic.model;

public class Course {

	public static final int DEFAULT_COURSE_ID = -1;
	public static final int DEFAULT_COST = 0;

	private int courseId;
	private String title;
	private int cost;
	private String description;
	private String startingDate;
	private String endingDate;
	private boolean isActive;

	public Course() {
		this.courseId = DEFAULT_COURSE_ID;
		this.title = "";
		this.cost = DEFAULT_COST;
		this.description = "";
		this.startingDate = "";
		this.endingDate = "";
		this.isActive = false;

	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStartingDate() {
		return startingDate;
	}

	public void setStartingDate(String startingDate) {
		this.startingDate = startingDate;
	}

	public String getEndingDate() {
		return endingDate;
	}

	public void setEndingDate(String endingDate) {
		this.endingDate = endingDate;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "Course[courseId = " + courseId + ",  title: " + title + ", cost: " + cost + ", description: "
				+ description + ", startingDate: " + startingDate + ", endingDate: " + endingDate + ", isActive(): "
				+ isActive() + "]";

	}

}
