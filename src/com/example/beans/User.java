package com.example.beans;

public class User {
	private int id;
	private String first_name,last_name,gender,email_id,password,phone,order_id,wishlist_id;
	public User() {
		
	}
	public User(int id,String first_name,String last_name,String gender,String email_id,String password,String phone,String order_id,String wishlist_id) {
		this.id=id;
		this.first_name=first_name;
		this.last_name=last_name;
		this.gender=gender;
		this.email_id=email_id;
		this.phone=phone;
		this.order_id=order_id;
		this.wishlist_id=wishlist_id;
		this.password=password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getPhone() {
		return phone;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getWishlist_id() {
		return wishlist_id;
	}
	public void setWishlist_id(String wishlist_id) {
		this.wishlist_id = wishlist_id;
	}
	
}
