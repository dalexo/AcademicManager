package com.academic.db;

import java.sql.Connection;
import java.sql.SQLException;

import com.academic.db.dao.*;

// DAOImp class Dao implementation - offer the close method
public abstract class DAOImpl<T> implements Dao<T> {

	// Attribute
	protected Connection dbConnection;

	// Constructor
	public DAOImpl(Connection conn) throws SQLException {
		dbConnection = conn;
	}

	public abstract void close();

}
