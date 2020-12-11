package com.example.beans;

public class Track {
	private String id,address;
	private int status;
	public Track() {}
	public Track(String id,String address,int status) {
		this.id=id;
		this.address=address;
		this.status=status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
