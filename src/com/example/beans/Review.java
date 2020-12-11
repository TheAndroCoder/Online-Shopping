package com.example.beans;

public class Review {
	private String review,date;
	private int id,pid,uid;
	public Review() {}
	public Review(int id, String review, String date, int pid, int uid) {
		super();
		this.id=id;
		this.review = review;
		this.date = date;
		this.pid = pid;
		this.uid = uid;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
}
