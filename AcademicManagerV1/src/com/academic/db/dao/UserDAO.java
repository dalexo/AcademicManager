package com.academic.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.academic.db.DAOImpl;
import com.academic.model.User;

public class UserDAO extends DAOImpl<User> {
	
	private PreparedStatement selectUserAuthenticationData;

	public UserDAO(Connection conn) throws SQLException {
		super(conn);
		// TODO Auto-generated constructor stub
		selectUserAuthenticationData = dbConnection.prepareStatement("select user_id,user_email,user_password,status_account from users;");
	}

	@Override
	public User get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		ResultSet resultSet;
		List<User> userList = new ArrayList<>();

		try {
			resultSet = selectUserAuthenticationData.executeQuery(); // result of the select query
																		
			while (resultSet.next()) {
				User user = new User();
				user.setUserId(resultSet.getInt("user_id"));
				user.setUserEmail(resultSet.getString("user_email"));
				user.setUserPassword(resultSet.getString("user_password"));
				user.setUserAccountStatus(resultSet.getInt("status_account"));

				userList.add(user);

			}
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		return userList;

	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void add(User t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(User t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(User t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void close() {
		// TODO Auto-generated method stub
		
	}

}
