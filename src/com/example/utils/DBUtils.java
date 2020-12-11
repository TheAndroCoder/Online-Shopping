package com.example.utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

import com.example.beans.Order;
import com.example.beans.Product;
import com.example.beans.Review;
import com.example.beans.Track;
import com.example.beans.User;

public class DBUtils {
	private final String DATABASE_NAME = "shoppify";
	//private final String DATABASE_URL = "jdbc:mysql://localhost:8889/"+DATABASE_NAME;
	private final String DATABASE_URL = "jdbc:mysql://db4free.net:3306/"+DATABASE_NAME+"?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT";
	private final String DRIVER = "com.mysql.jdbc.Driver";
	private final String USER_TABLE = "Users";
	Connection con=null;
	private static DBUtils instance=null;
	private DBUtils() {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(DATABASE_URL, "sachin", "sachin123");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static DBUtils getInstance() {
		if(instance==null)
		instance=new DBUtils();
		return instance;
	}
	public int addUser(User user)throws Exception {
		try {
			PreparedStatement stmt=con.prepareStatement("insert into "+USER_TABLE+"(first_name,last_name,gender,email_id,phone,order_id,wishlist_id) values(?,?,?,?,?,?,?)");
			stmt.setString(1, user.getFirst_name());
			stmt.setString(2, user.getLast_name());
			stmt.setString(3, user.getGender());
			stmt.setString(4, user.getEmail_id());
			stmt.setString(5, user.getEmail_id());
			stmt.setString(6, user.getPhone());
			stmt.setString(7, user.getOrder_id());
			stmt.setString(8, user.getWishlist_id());
			int n=stmt.executeUpdate();
			if(n!=1) {
				throw new Exception("Email or Phone already exists");
			}
			return 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public boolean isRegisteredUser(String email,String password) {
		try {
			PreparedStatement stmt=null;
			if(hasRateSymbol(email))
				stmt = con.prepareStatement("select email_id,password from "+USER_TABLE+" where email_id='"+email+"' and password='"+password+"'");
			else
				stmt=con.prepareStatement("select phone,password from "+USER_TABLE+" where phone='"+email+"' and password='"+password+"'");
			ResultSet rs = stmt.executeQuery();
			if(rs.first()) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	private boolean hasRateSymbol(String email) {
		char[] chars=email.toCharArray();
		for(char character:chars) {
			if(character=='@') {
				return true;
			}
		}
		return false;
	}
	public String getUserName(String email) {
		try {
			PreparedStatement stmt=null;
			if(hasRateSymbol(email))
				stmt = con.prepareStatement("select first_name from "+USER_TABLE+" where email_id='"+email+"'");
			else
				stmt=con.prepareStatement("select first_name from "+USER_TABLE+" where phone='"+email+"'");
			ResultSet rs = stmt.executeQuery();
			if(rs.first() && rs.getString("first_name")!=null) {
				return rs.getString("first_name");
			}else {
				return email.substring(0, 10)+"...";
			}
		}catch(Exception e) {
			//System.out.println("Getting into "+e.getMessage());
			e.printStackTrace();
		}
		return "Guest";
	}
	public boolean emailExists(String email) {
		try {
			PreparedStatement stmt=con.prepareStatement("select email_id from "+USER_TABLE+" where email_id='"+email+"'");
			ResultSet rs = stmt.executeQuery();
			if(rs.first()) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public void registerUser(String email,String password) {
		try {
			String order_id = generateRandomKey();
			String wishlist_id = generateRandomKey();
			PreparedStatement stmt = con.prepareStatement("insert into "+USER_TABLE+"(email_id,password,order_id,wishlist_id) values(?,?,?,?)");
			stmt.setString(1,email);
			stmt.setString(2, password);
			stmt.setString(3, order_id);
			stmt.setString(4, wishlist_id);
			int res = stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public User getUserInfo(String email) {
		User user = new User();
		try {
			PreparedStatement stmt=con.prepareStatement("select * from Users where email_id='"+email+"'");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				user.setId(rs.getInt("id"));
				user.setEmail_id(rs.getString("email_id"));
				if(rs.getString("first_name")!=null)
					user.setFirst_name(rs.getString("first_name"));
				else
					user.setFirst_name("");
				if(rs.getString("last_name")!=null)
					user.setLast_name(rs.getString("last_name"));
				else
					user.setLast_name("");
				user.setGender(rs.getString("gender"));
				if(rs.getString("phone")!=null)
					user.setPhone(rs.getString("phone"));
				else
					user.setPhone("");
				if(rs.getString("order_id")!=null)
					user.setOrder_id(rs.getString("order_id"));
				else
					user.setOrder_id("");
				if(rs.getString("wishlist_id")!=null)
					user.setWishlist_id(rs.getString("wishlist_id"));
				else
					user.setWishlist_id("");
				user.setPassword(rs.getString("password"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public void updateNameAndGender(String email,String first_name,String last_name,String gender) {
		try {
			PreparedStatement stmt = con.prepareStatement("update "+USER_TABLE+" set first_name='"+first_name+"',last_name='"+last_name+"',gender='"+gender+"' where email_id='"+email+"'");
			int n=stmt.executeUpdate();
			System.out.println("updated");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int updateEmail(String oldEmail,String newEmail) {
		try {
			PreparedStatement stmt =con.prepareStatement("select email_id from "+USER_TABLE+" where email_id='"+newEmail+"'");
			ResultSet rs=stmt.executeQuery();
			if(rs.first()) {
				return 0;
			}else {
				stmt=con.prepareStatement("update "+USER_TABLE+" set email_id='"+newEmail+"' where email_id='"+oldEmail+"'");
				int n = stmt.executeUpdate();
				System.out.println("email updated");
				return n;
			}
			 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int updatePhone(String newPhone,String email) {
		try {
			
				PreparedStatement stmt=con.prepareStatement("update "+USER_TABLE+" set phone='"+newPhone+"' where email_id='"+email+"'");
				int n = stmt.executeUpdate();
				System.out.println("phone updated");
				return n;
			 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int getUserId(String email) {
		int id=0;
		try {
			PreparedStatement stmt = con.prepareStatement("select id from "+USER_TABLE+" where email_id='"+email+"'");
			ResultSet rs = stmt.executeQuery();
			if(rs.first()) {
				id=rs.getInt("id");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	private String generateRandomKey() {
		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 18) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

	}
	public ArrayList<Product> getProducts(){
		ArrayList<Product> productsList = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from Product");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getString("price"));
				product.setDiscount(rs.getString("discount"));
				product.setRatingId(rs.getString("ratingId"));
				product.setReviewId(rs.getString("reviewId"));
				product.setFeaturesCsv(rs.getString("featuresCsv"));
				product.setImageUrl(rs.getString("imageUrl"));
				product.setCategory(rs.getString("category"));
				product.setBrand(rs.getString("brand"));
				productsList.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return productsList;
	}
	public ArrayList<Product> getSearchResult(String str){
		ArrayList<Product> productsList = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from Product where name like '%"+str+"%' or category like '%"+str+"%'");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getString("price"));
				product.setDiscount(rs.getString("discount"));
				product.setRatingId(rs.getString("ratingId"));
				product.setReviewId(rs.getString("reviewId"));
				product.setFeaturesCsv(rs.getString("featuresCsv"));
				product.setImageUrl(rs.getString("imageUrl"));
				product.setCategory(rs.getString("category"));
				product.setBrand(rs.getString("brand"));
				productsList.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return productsList;
	}
	public Product getProductDetails(int id) {
		Product product=new Product();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from Product where id="+id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				product.setProductId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setPrice(rs.getString("price"));
				product.setDiscount(rs.getString("discount"));
				product.setRatingId(rs.getString("ratingId"));
				product.setReviewId(rs.getString("reviewId"));
				product.setFeaturesCsv(rs.getString("featuresCsv"));
				product.setImageUrl(rs.getString("imageUrl"));
				product.setCategory(rs.getString("category"));
				product.setBrand(rs.getString("brand"));
			}else {
				product=null;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return product;
	}
	public User fetchUser(int id) {
		User user = new User();
		try {
			PreparedStatement stmt=con.prepareStatement("select * from Users where id="+id);
			ResultSet rs = stmt.executeQuery();
			if(rs.first()) {
				user.setEmail_id(rs.getString("email_id"));
				user.setFirst_name(rs.getString("first_name"));
				user.setGender(rs.getString("gender"));
				user.setId(id);
				user.setLast_name(rs.getString("last_name"));
				user.setOrder_id(rs.getString("order_id"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setWishlist_id(rs.getString("wishlist_id"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public void addTocart(int pid,String wishlist_id) {
		try {
			PreparedStatement stmt = con.prepareStatement("insert into Cart values('"+wishlist_id+"','"+pid+"')");
			int n=stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Product> getCartItemsList(String wishlistId) {
		ArrayList<Product> products = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select pid from Cart where wishlist_id='"+wishlistId+"'");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Product product = getProductDetails(Integer.parseInt(rs.getString("pid")));
				products.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	public void removeFromCart(String pid,String wid) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from Cart where pid='"+pid+"' and wishlist_id='"+wid+"'");
			int n = stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Product> getProductsFromPidList(String pid_list){
		ArrayList<Product> list=new ArrayList<>();
		String[] pids=pid_list.split(",");
		for(String pid : pids) {
			Product product = getProductDetails(Integer.parseInt(pid));
			list.add(product);
		}
		return list;
	}
	public void insertReview(String review,String date,int pid,int uid) {
		try {
			PreparedStatement stmt = con.prepareStatement("insert into Review(pid,date,review,uid) values(?,?,?,?)");
			//stmt.setString(1, rev_id);
			stmt.setInt(1, pid);
			stmt.setString(2, date);
			stmt.setString(3, review);
			stmt.setInt(4, uid);
			int n=stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Review> fetchReviewsForProductId(int pid){
		ArrayList<Review> list = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from Review where pid='"+pid+"'");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Review review=new Review();
				review.setId(rs.getInt("id"));
				review.setDate(rs.getString("date"));
				review.setPid(pid);
				review.setReview(rs.getString("review"));
				review.setUid(rs.getInt("uid"));
				list.add(review);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public String getUserNameForUid(int uid) {
		try {
			PreparedStatement stmt = con.prepareStatement("select first_name,last_name from Users where id='"+uid+"'");
			ResultSet rs = stmt.executeQuery();
			if(rs.first()) {
				String name=rs.getString("first_name")+" "+rs.getString("last_name");
				return name;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public void placeOrder(int pid,int uid,String order_date,String delivery_date,String address) {
		try {
			PreparedStatement stmt = con.prepareStatement("insert into Orders(pid,uid,order_date,delivery_date,tracking_id,delivery_address) values(?,?,?,?,?,?)");
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			stmt.setString(3, order_date);
			stmt.setString(4, delivery_date);
			String randomKey=generateRandomKey();
			stmt.setString(5, randomKey);
			stmt.setString(6, address);
			int n = stmt.executeUpdate();
			stmt=con.prepareStatement("insert into Track values('"+randomKey+"','"+address+"',1)");
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Order> getOrdersForUid(int uid){
		ArrayList<Order> list = new ArrayList<>();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from Orders where uid="+uid);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Order order=new Order();
				order.setId(rs.getInt("id"));
				order.setPid(rs.getInt("pid"));
				order.setUid(rs.getInt("uid"));
				order.setDelivery_address(rs.getString("delivery_address"));
				order.setDelivery_date(rs.getString("delivery_date"));
				order.setOrder_date(rs.getString("order_date"));
				order.setTracking_id(rs.getString("tracking_id"));
				list.add(order);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Track getTrackingDetails(String id){
		//ArrayList<Track> list = new ArrayList<>();
		Track track=new Track();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from Track where id='"+id+"'");
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				
				track.setId(id);
				track.setStatus(rs.getInt("status"));
				track.setAddress(rs.getString("address"));
				//list.add(track);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return track;
	}
	public Order getOrderDetailsForTrackingId(String id) {
		Order order=new Order();
		try {
			PreparedStatement stmt = con.prepareStatement("select * from Orders where tracking_id='"+id+"'");
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				order.setTracking_id(id);
				order.setDelivery_address(rs.getString("delivery_address"));
				order.setDelivery_date(rs.getString("delivery_date"));
				order.setOrder_date(rs.getString("order_date"));
				order.setPid(rs.getInt("pid"));
				order.setId(rs.getInt("id"));
				order.setUid(rs.getInt("uid"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return order;
	}
	public void removeProduct(int id) {
		try {
			PreparedStatement stmt = con.prepareStatement("delete from Product where id='"+id+"'");
			int n=stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void addProduct(Product product) {
		try {
			PreparedStatement stmt = con.prepareStatement("insert into Product(name,description,price,discount,ratingId,reviewId,featuresCsv,imageUrl,category,brand) values('"+product.getName()+"','"+product.getDescription()+"','"+product.getPrice()+"','"+product.getDiscount()+"','"+generateRandomKey()+"','"+generateRandomKey()+"','"+product.getFeaturesCsv()+"','"+product.getImageUrl()+"','"+product.getCategory()+"','"+product.getBrand()+"')");
			int n = stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void updateProduct(Product product) {
		try {
			PreparedStatement stmt = con.prepareStatement("update Product set name='"+product.getName()+"',description='"+product.getDescription()+"',price='"+product.getPrice()+"',discount='"+product.getDiscount()+"',ratingId='"+product.getRatingId()+"',reviewId='"+product.getReviewId()+"',featuresCsv='"+product.getFeaturesCsv()+"',imageUrl='"+product.getImageUrl()+"',category='"+product.getCategory()+"',brand='"+product.getBrand()+"' where id='"+product.getProductId()+"'");
			int n = stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
