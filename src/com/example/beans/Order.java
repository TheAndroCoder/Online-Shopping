package com.example.beans;

public class Order {
	private int id,pid,uid;
	private String order_date,delivery_date,tracking_id,delivery_address;
	public Order(int id, int pid, int uid, String order_date, String delivery_date, String tracking_id,String delivery_address) {
		super();
		this.id = id;
		this.pid = pid;
		this.uid = uid;
		this.order_date = order_date;
		this.delivery_date = delivery_date;
		this.tracking_id = tracking_id;
		this.delivery_address=delivery_address;
	}
	public Order() {}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getTracking_id() {
		return tracking_id;
	}
	public void setTracking_id(String tracking_id) {
		this.tracking_id = tracking_id;
	}
	public String getDelivery_address() {
		return delivery_address;
	}
	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}
	
}
