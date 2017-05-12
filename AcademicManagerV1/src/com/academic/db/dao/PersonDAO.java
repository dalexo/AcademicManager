package com.academic.db.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.academic.db.DAOImpl;
import com.academic.model.Person;
import java.sql.PreparedStatement;

public class PersonDAO extends DAOImpl<Person> {
	private PreparedStatement selectByIdStatement;
	private PreparedStatement selectAllStatement;
	private PreparedStatement countStatement;
	//CRUD
	private PreparedStatement addStatement;
	private PreparedStatement updateStatement;
	private PreparedStatement deleteStatement;

	public PersonDAO(Connection conn) throws SQLException {
		super(conn);
		// TODO Auto-generated constructor stub
		selectByIdStatement = dbConnection.prepareStatement("SELECT personId,name,surname,type,dateOfBirth,email,phoneNumber,address,taxNumber,bankAccount,sex FROM person WHERE personId=? AND isDeleted=0;",
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		selectAllStatement = dbConnection.prepareStatement("SELECT * FROM person WHERE isDeleted=0;",
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		countStatement = dbConnection.prepareStatement("SELECT COUNT(*) FROM person WHERE isDeleted=0;",
				ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

		addStatement = dbConnection.prepareStatement(
				"INSERT INTO person (name,surname,type,dateOfBirth,email,phoneNumber,address,taxNumber,bankAccount,sex,isDeleted) VALUES ('?','?','?','?','?','?','?','?','?','?','0');");

		updateStatement = dbConnection.prepareStatement(
				"UPDATE person SET name=?,surname=?,dateOfBirth=?,email=?,phoneNumber=?,address=?,taxnumber=?,bankAccount=?,sex=? WHERE personId=?;");
		
		deleteStatement = dbConnection.prepareStatement("UPDATE person SET isDeleted=1 WHERE personId=?;");
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
		try {
			addStatement.setString(1, t.getName());
			addStatement.setString(2, t.getSurname());
			addStatement.setString(3, t.getType());
			addStatement.setString(4, t.getDateOfBirth());
			addStatement.setString(5, t.getEmail());
			addStatement.setString(6, t.getPhoneNumber());
			addStatement.setString(7, t.getAddress());
			addStatement.setString(8, t.getTaxNumber());
			addStatement.setString(9, t.getBankAccount());
			addStatement.setString(10, t.getSex());
			addStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(Person t) {
		// TODO Auto-generated method stub
		try {
			updateStatement.setString(1, t.getName());
			updateStatement.setString(2, t.getSurname());
			updateStatement.setString(3, t.getDateOfBirth());
			updateStatement.setString(4, t.getEmail());
			updateStatement.setString(5, t.getPhoneNumber());
			updateStatement.setString(6, t.getAddress());
			updateStatement.setString(7, t.getTaxNumber());
			updateStatement.setString(8, t.getBankAccount());
			updateStatement.setString(9, t.getSex());
			updateStatement.setInt(10, t.getPersonId());
			updateStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Person t) {
		// TODO Auto-generated method stub
		try {

			deleteStatement.setInt(1, t.getPersonId());
			deleteStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void close() {
		// TODO Auto-generated method stub
		try {
			this.selectByIdStatement.close();
			this.selectAllStatement.close();
			this.countStatement.close();
			this.addStatement.close();
			this.updateStatement.close();
			this.deleteStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Could not close the person DAO statements");
			e.printStackTrace();
		}
		
	}

}
