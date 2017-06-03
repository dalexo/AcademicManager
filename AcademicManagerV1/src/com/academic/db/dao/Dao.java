package com.academic.db.dao;

import java.util.List;

// Main DAO interface
public interface Dao<T> {

	T get(int id);

	List<T> getAll();


	int countAll();

	void add(T t);

	void update(T t);

	void delete(T t);

}
