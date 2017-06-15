package com.academic.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.academic.db.DAOImpl;
import com.academic.model.User;
import com.academic.utils.Logger;

public class UserDAO extends DAOImpl<User> {
	
	private PreparedStatement selectAllUserAuthenticationData;
	private PreparedStatement selectUserAuthenticationDataById;
	private PreparedStatement countUsersStatement;

	public UserDAO(Connection conn) throws SQLException {
		super(conn);
		// TODO Auto-generated constructor stub
		selectAllUserAuthenticationData = dbConnection.prepareStatement("select user_id,user_email,user_password,status_account from users;");
		selectUserAuthenticationDataById = dbConnection.prepareStatement("select user_id,user_email,user_password,status_acount from users where user_id=?");
		countUsersStatement = dbConnection.prepareStatement("select count(*) from users");
	}

	@Override
	public User get(int id) {
		User user = new User();
		try {
			selectUserAuthenticationDataById.setInt(1, id);
			selectUserAuthenticationDataById.execute();
			ResultSet resultSet = selectUserAuthenticationDataById.getResultSet();
			if( resultSet.first() ){
				user.setUserId(resultSet.getInt("user_id"));
				user.setUserEmail(resultSet.getString("user_email"));
				user.setUserPassword(resultSet.getString("user_password"));
				user.setUserAccountStatus(resultSet.getInt("status_account"));

			}
			resultSet.close();
		} catch (SQLException e) {
			Logger.logDebug("Caught SQLException while executing get by id: " + id);
			Logger.logException(e);
			return null;
		}

		return user;
	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		ResultSet resultSet;
		List<User> userList = new ArrayList<>();

		try {
			resultSet = selectAllUserAuthenticationData.executeQuery(); // result of the select query
																		
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
		int count=0;
		try {
			ResultSet resultSet = countUsersStatement.executeQuery();
			if( resultSet.first() ){
				count = resultSet.getInt(1);
			}
			resultSet.close();
		} catch (SQLException e) {
			Logger.logDebug("Caught SQLException while counting courses");
			Logger.logException(e);
			return -1;
		}
		return count;
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
		try {
			this.selectAllUserAuthenticationData.close();
		} catch (SQLException e) {
			Logger.logDebug("Could not close the DAO statements");
			Logger.logException(e);
		}
		
	}

}
