package com.academic.model;

public class Person {

	public static final int DEFAULT_PERSON_TYPE = -1;
	public static final int DEFAULT_PERSON_ID = 0;

	private int personId;
	private String name;
	private String surname;
	private int personType;
	private String dateOfBirth;
	private String email;
	private String phoneNumber;
	private String address;
	private String taxNumber;
	private String bankAccount;
	private String username;
	private String password;
	private boolean sex;

	public Person() {
		this.personType = DEFAULT_PERSON_TYPE;
		this.personId = DEFAULT_PERSON_ID;
		this.name = "";
		this.username = "";
		this.dateOfBirth = "";
		this.sex = false;
		this.email = "";
		this.phoneNumber = "";
		this.address = "";
		this.taxNumber = "";
		this.bankAccount = "";
		this.username = "";
		this.password = "";

	}

	public int getPersonId() {
		return personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}

	public int getPersonType() {
		return personType;
	}

	public void setPersonType(int personType) {
		this.personType = personType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public boolean isMale() {
		return this.sex == true;
	}

	public void setisMale() {
		this.sex = true;
	}

	public boolean isFemale() {
		return this.sex == false;
	}

	public void setisFemale() {
		this.sex = false;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTaxNumber() {
		return taxNumber;
	}

	public void setTaxNumber(String taxNumber) {
		this.taxNumber = taxNumber;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Person[personId = " + personId + ",  name: " + name + ", surname: " + surname + ", personType: "
				+ personType + ", dateOfBirth: " + dateOfBirth + ", sex: " + isMale() + ", sex: " + isFemale()
				+ ", email: " + email + ", phoneNumber: " + phoneNumber + ", address:" + address + ", taxNumber:"
				+ taxNumber + ", bankAccount: " + bankAccount + ", username: " + username + ", password:" + password
				+ "]";

	}
}