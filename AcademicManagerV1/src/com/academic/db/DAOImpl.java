package com.academic.db;

import java.sql.Connection;
import java.sql.SQLException;

import com.academic.db.dao.DAO;


public abstract class DAOImpl<T> implements DAO<T> {

	// Attribute
		protected Connection dbConnection;

		// Constructor
		public DAOImpl(Connection conn) throws SQLException {
			dbConnection = conn;
		}

		public abstract void close();

}