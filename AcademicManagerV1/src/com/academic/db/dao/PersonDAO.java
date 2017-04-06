package com.academic.db.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.academic.db.DAOImpl;
import com.academic.model.Person;
import com.mysql.jdbc.PreparedStatement;

public class PersonDAO extends DAOImpl<Person> {
	private PreparedStatement selectByIdStatement;
	private PreparedStatement selectAllStatement;
	private PreparedStatement countStatement;

	public PersonDAO(Connection conn) throws SQLException {
		super(conn);
		// TODO Auto-generated constructor stub
		selectByIdStatement = (PreparedStatement) dbConnection.prepareStatement("SELECT personId,name,surname,type,dateOfBirth,email,phoneNumber,address,taxNumber,bankAccount,sex FROM person WHERE personId=?;",
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		selectAllStatement = (PreparedStatement) dbConnection.prepareStatement("SELECT * FROM person;",
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		countStatement = (PreparedStatement) dbConnection.prepareStatement("SELECT COUNT(*) FROM person;",
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	}

	@Override
	public Person get(int id) {
		// TODO Auto-generated method stub
		Person person = new Person();
		try {
			selectByIdStatement.setInt(1, id);
			selectByIdStatement.execute();
			ResultSet resultSet = selectByIdStatement.getResultSet();
			if(resultSet.first()){
				person.setPersonId(resultSet.getInt("personId"));
				person.setName(resultSet.getString("name"));
				person.setSurname(resultSet.getString("surname"));
				person.setType(resultSet.getString("type"));
				person.setDateOfBirth(resultSet.getString("dateOfBirth"));
				person.setEmail(resultSet.getString("email"));
				person.setPhoneNumber(resultSet.getString("phoneNumber"));
				person.setAddress(resultSet.getString("address"));
				person.setTaxNumber(resultSet.getString("taxNumber"));
				person.setBankAccount(resultSet.getString("bankAccount"));
				person.setSex(resultSet.getString("sex"));
			}
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Caught SQLException while executing get by id: " + id);
			e.printStackTrace();
			return null;
		}
		return person;
	}

	@Override
	public List<Person> getAll() {
		// TODO Auto-generated method stub
		ResultSet resultSet;
		List<Person> personList = new ArrayList<Person>();
		try {
			resultSet = selectAllStatement.executeQuery();
			while( resultSet.next() ){
				Person person = new Person();
				person.setPersonId(resultSet.getInt("personId"));
				person.setName(resultSet.getString("name"));
				person.setSurname(resultSet.getString("surname"));
				person.setType(resultSet.getString("type"));
				person.setDateOfBirth(resultSet.getString("dateOfBirth"));
				person.setEmail(resultSet.getString("email"));
				person.setPhoneNumber(resultSet.getString("phoneNumber"));
				person.setAddress(resultSet.getString("address"));
				person.setTaxNumber(resultSet.getString("taxNumber"));
				person.setBankAccount(resultSet.getString("bankAccount"));
				person.setSex(resultSet.getString("sex"));
				personList.add(person);
			}
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Caught SQLException while trying to retrieve all persons");
			e.printStackTrace();
			return null;
		}
		return personList;
	}

	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		int count=0;
		ResultSet resultSet;
		
		try {
			resultSet = countStatement.executeQuery();
			if( resultSet.first() ){
				count = resultSet.getInt(1);		
			}
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Caught SQLException while counting persons");
			e.printStackTrace();
			return -1;
		}
		return count;
	}
	@Override
	public void add(Person t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Person t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Person t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void close() {
		// TODO Auto-generated method stub
		try {
			this.selectByIdStatement.close();
			this.selectAllStatement.close();
			this.countStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Could not close the person DAO statements");
			e.printStackTrace();
		}
		
	}

}
