package com.academic.db.dao;
import java.util.List;

		// Main DAO interface
		public interface DAO<T> {

			T get(int id);

			List<T> getAll();
			
			int countAll();
		}




