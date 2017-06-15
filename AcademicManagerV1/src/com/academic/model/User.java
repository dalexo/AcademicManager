package com.academic.model;

public class User {

	private int userId;
	private String userEmail;
	private String userPassword;
	private int userAccountStatus;

	public User() {
		this.userId = 0;
		this.userEmail = "";
		this.userPassword = "";
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public int getUserAccountStatus() {
		return userAccountStatus;
	}

	public void setUserAccountStatus(int userAccountStatus) {
		this.userAccountStatus = userAccountStatus;
	}

}
