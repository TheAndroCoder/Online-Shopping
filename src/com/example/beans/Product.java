package com.example.beans;

public class Product {
	private int productId;
	private String name,description,price,discount,featuresCsv,reviewId,ratingId,imageUrl,category,brand;
	public Product() {
		
	}
	public Product(int productId, String name, String description, String price, String discount,
			 String featuresCsv, String reviewId, String ratingId,String imageUrl,String category,String brand) {
		super();
		this.productId = productId;
		this.name = name;
		this.description = description;
		this.price = price;
		this.discount = discount;
		this.featuresCsv = featuresCsv;
		this.reviewId = reviewId;
		this.ratingId = ratingId;
		this.imageUrl=imageUrl;
		this.category=category;
		this.brand=brand;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
	public String getFeaturesCsv() {
		return featuresCsv;
	}
	public void setFeaturesCsv(String featuresCsv) {
		this.featuresCsv = featuresCsv;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getRatingId() {
		return ratingId;
	}
	public void setRatingId(String ratingId) {
		this.ratingId = ratingId;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
}
