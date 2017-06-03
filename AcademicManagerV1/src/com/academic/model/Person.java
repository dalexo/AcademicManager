package com.academic.model;

public class Person {

	public static final int DEFAULT_PERSON_ID = 0;

	private int personId;
	private String name;
	private String surname;
	private String type;
	private String dateOfBirth;
	private String email;
	private String phoneNumber;
	private String address;
	private String taxNumber;
	private String bankAccount;
	private String sex;

	public Person() {
		this.type = "";
		this.personId = DEFAULT_PERSON_ID;
		this.name = "";
		this.surname = "";
		this.dateOfBirth = "";
		this.sex = "";
		this.email = "";
		this.phoneNumber = "";
		this.address = "";
		this.taxNumber = "";
		this.bankAccount = "";

	}

	public int getPersonId() {
		return personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
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


	@Override
	public String toString() {
		return "Person[personId = " + personId + ",  name: " + name + ", surname: " + surname + ", personType: "
				+ type + ", dateOfBirth: " + dateOfBirth + ", sex: " + sex
				+ ", email: " + email + ", phoneNumber: " + phoneNumber + ", address:" + address + ", taxNumber:"
				+ taxNumber + ", bankAccount: " + bankAccount + "]";

	}
}
