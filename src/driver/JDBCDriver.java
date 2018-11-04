package driver;
import java.sql.*;
import java.util.ArrayList;

import datatypes.Offering;
import datatypes.User;

public class JDBCDriver {
	private static Connection conn = null;
	private static ResultSet rs = null;
	private static PreparedStatement ps = null;
	
	
	public static boolean connect(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/foodbook_db?user=root&password=root&useSSL=false");
			return true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public static void close(){
		try{
			if (rs!=null){
				rs.close();
				rs = null;
			}
			if(conn != null){
				conn.close();
				conn = null;
			}
			if(ps != null ){
				ps = null;
			}
		}catch(SQLException sqle){
			System.out.println("connection close error");
			sqle.printStackTrace();
		}
	}
	
	public static User getUser(String email){
		User retval = null;
		connect();
		try {
			ps = conn.prepareStatement("SELECT name, imageURL, bio, contactinfo FROM Users WHERE email=?;");
			ps.setString(1, email);	
			rs = ps.executeQuery();
			System.out.println(rs);
			rs.next();
			String name = rs.getString("name");
			String imageURL = rs.getString("imageURL");
			String bio = rs.getString("bio");
			double rating = rs.getDouble("rating");
			String contactinfo = rs.getString("contactinfo");
			retval = new User(name, imageURL, email, bio, rating, contactinfo);
			close();
			retval.setOfferings(getOfferingsByUser(email));
		} catch (SQLException e) {
			System.out.println("SQLException in function \"getUser\"");
			e.printStackTrace();
		}finally{
			close();
		}
		
		return retval;
	}
	
	public static void addUser(User user){
		connect();
		try {
			ps = conn.prepareStatement("INSERT INTO Users(email, name, imageURL, bio, contactinfo) "
					+ "VALUES(?, ?, ?, ?, ?)");
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getName());
			ps.setString(3, user.getImageUrl());
			ps.setString(4, user.getBio());
			ps.setString(5, user.getContactInfo());
			ps.executeUpdate();
	
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
	}
	
	public static void addOffering(String email, String cuisineType, String name, String description, 
			String price, String location, String startTime, String endTime){
		connect();
		try {
			ps = conn.prepareStatement("INSERT INTO Offerings(email, cuisineType, name, descripton, "
					+ "price, location, startTime, endTime, valid, rating) VALUES(?, ?, ?, ?, ?, ?, ?, ?, true, -1)");
			ps.setString(1, email);
			ps.setString(2, cuisineType);
			ps.setString(3, name);
			ps.setString(4, description);
			ps.setString(5, price);
			ps.setString(6, location);
			ps.setString(7, startTime);
			ps.setString(8, endTime);
			ps.executeUpdate();
	
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
	}
	
	public static ArrayList<Offering> getAllOfferings(){
		ArrayList<Offering> offerings = new ArrayList<Offering>();
		connect();
		try {
			ps = conn.prepareStatement("SELECT * FROM Offerings WHERE vaild=true");
			rs = ps.executeQuery();	
			
			while(rs.next()) {
				Offering offering = new Offering(rs.getString("name"), rs.getString("description"), 
						null, rs.getDouble("price"), rs.getLong("startTime"), rs.getLong("endTime"), 
						rs.getDouble("rating"), rs.getString("cuisineType"), rs.getString("location"));
				offerings.add(offering);
			}
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
		return offerings;
	}
	
	public static ArrayList<Offering> getOfferingsByUser(String email){
		ArrayList<Offering> offerings = new ArrayList<Offering>();
		connect();
		try {
			ps = conn.prepareStatement("SELECT * FROM Offerings WHERE email=? AND valid=true");
			ps.setString(1, email);
			rs = ps.executeQuery();	
			
			while(rs.next()) {
				Offering offering = new Offering(rs.getString("name"), rs.getString("description"), 
						email, rs.getDouble("price"), rs.getLong("startTime"), rs.getLong("endTime"), 
						rs.getDouble("rating"), rs.getString("cuisineType"), rs.getString("location"));
				offerings.add(offering);
			}
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
		return offerings;
	}
	
	public static void removeOffering(String eventID){
		connect();
		try {
			ps = conn.prepareStatement("UPDATE Offerings SET valid=false WHERE eventID=?");
			ps.setString(1, eventID);
			ps.executeUpdate();
		
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
	}
	
}
