package driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import datatypes.Offering;
import datatypes.User;

public class JDBCDriver {
	private static Connection conn = null;
	private static ResultSet rs = null;
	private static PreparedStatement ps = null;
	private static Lock lock = new ReentrantLock();
	
	
	private static boolean connect(){
		
		
		try {
			boolean hasLock = false;
			
			while(!hasLock) {
				synchronized(lock) {
				hasLock = lock.tryLock();
				}
				
				if(!hasLock) {
					//System.out.println("Failed to obtain lock!");
					//System.out.println("In " + Thread.currentThread().getStackTrace()[2]);
					Thread.sleep(100);
				} else {
					//System.out.println("Locked successfully!");
					//System.out.println("In " + Thread.currentThread().getStackTrace()[2]);
				}
			}
			
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			System.out.println("Thread was interupted!");
			e1.printStackTrace();
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodbook?user=root&password=root&useSSL=false&allowPublicKeyRetrieval=true");
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
	
	private static void close(){
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
		} finally {
			synchronized(lock) {
				lock.unlock();
				//System.out.println("Unlocked successfully!");
			}
		}
	}
	
	public static User getUser(String email){
		User retval = null;
		connect();
		try {
			ps = conn.prepareStatement("SELECT name, imgURL, bio, contactinfo FROM Users WHERE email=?;");
			ps.setString(1, email);	
			rs = ps.executeQuery();
			rs.next();
			String name = rs.getString("name");
			String imageURL = rs.getString("imgURL");
			String bio = rs.getString("bio");
			String contactinfo = rs.getString("contactinfo");
			retval = new User(name, imageURL, email, bio, contactinfo);
		} catch (SQLException e) {
			System.out.println("SQLException in function \"getUser\"");
			e.printStackTrace();
		}finally{
			close();
		}
		
		return retval;
	}
	
	public static ArrayList<User> getAllUsers(){
		ArrayList<User> users = new ArrayList<User>();
		connect();
		try {
			ps = conn.prepareStatement("SELECT * FROM Users");
			rs = ps.executeQuery();	
			
			while(rs.next()) {
				User user = new User(
						rs.getString("name"), 
						rs.getString("imgURL"), 
						rs.getString("email"), 
						rs.getString("bio"), 
						rs.getString("contactinfo"));
				users.add(user);
			}
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
		return users;
	}
	
	public static void addUser(User user){
		connect();
		try {
			ps = conn.prepareStatement("INSERT IGNORE INTO Users(email, name, imgURL, bio, contactinfo) "
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
	
	public static ArrayList<User> findUsers(String query) {
		ArrayList<User> users = new ArrayList<User>();
		
		if(query.equals("")) {
			users = getAllUsers();
		}
		else {
			connect();
			try {
				ps = conn.prepareStatement("SELECT * FROM Users WHERE name LIKE ?");
				ps.setString(1, "%" + query + "%");
				rs = ps.executeQuery();

				while(rs.next()) {
					User user = new User(
							rs.getString("name"), 
							rs.getString("imgURL"), 
							rs.getString("email"), 
							rs.getString("bio"), 
							rs.getString("contactinfo"));
					users.add(user);
				}	
			} catch (SQLException sqle) {
				System.out.println ("SQLException: " + sqle.getMessage());
			} finally {
				close();
			}
		}
		return users;
	}
	
	public static void addOffering(Offering offering){
		connect();
		try {
			ps = conn.prepareStatement("INSERT INTO Offerings(chefEmail, cuisineType, name, price, location, startTime, endTime, valid, imgURL) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, true, ?)");
			ps.setString(1, offering.getChefEmail());
			ps.setString(2, offering.getCuisineType());
			ps.setString(3, offering.getName());
			ps.setDouble(4, offering.getPrice());
			ps.setString(5, offering.getLocation());
			ps.setLong(6, offering.getStartTime());
			ps.setLong(7,  offering.getEndTime());
			ps.setString(8, offering.getImageUrl());
			ps.executeUpdate();
			
			ps = conn.prepareStatement("SELECT MAX(offeringID) FROM foodbook.offerings;");
			rs = ps.executeQuery();
			int id = -1;
			if(rs.next()) {
				id = rs.getInt("MAX(offeringID)");
			}
			//System.out.println("Recieved ID of: " + id);
			
			offering.setId(id);
			
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
	}
	
	public static Offering getOffering(int offeringID) {
		Offering retval = null;
		connect();
		try {
			ps = conn.prepareStatement("SELECT * FROM Offerings WHERE valid=true AND offeringID=?");
			ps.setInt(1, offeringID);
			rs = ps.executeQuery();	
			
			if(rs.next()) {
				retval = new Offering(rs.getString("name"), 
						rs.getString("imgURL"), rs.getDouble("price"), rs.getLong("startTime"), rs.getLong("endTime"), 
						rs.getString("cuisineType"), rs.getString("location"), rs.getString("chefEmail"));
				retval.setId(rs.getInt("offeringID"));
			}
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
		return retval;
	}
	
	public static ArrayList<Offering> getAllOfferings(){
		ArrayList<Offering> offerings = new ArrayList<Offering>();
		connect();
		try {
			ps = conn.prepareStatement("SELECT * FROM Offerings WHERE valid=true");
			rs = ps.executeQuery();	
			while(rs.next()) {
				Offering offering = new Offering(rs.getString("name"), 
						rs.getString("imgURL"), rs.getDouble("price"), rs.getLong("startTime"), rs.getLong("endTime"), 
						rs.getString("cuisineType"), rs.getString("location"), rs.getString("chefEmail"));
				offering.setId(rs.getInt("offeringID"));
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
			ps = conn.prepareStatement("SELECT * FROM Offerings WHERE chefEmail=? AND valid=true");
			ps.setString(1, email);
			rs = ps.executeQuery();	
			
			while(rs.next()) {
				Offering offering = new Offering(rs.getString("name"), 
						rs.getString("imgURL"), rs.getDouble("price"), rs.getLong("startTime"), rs.getLong("endTime"), 
						rs.getString("cuisineType"), rs.getString("location"), rs.getString("chefEmail"));
				offering.setId(rs.getInt("offeringID"));
				offerings.add(offering);
			}
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
		return offerings;
	}
	
	public static ArrayList<Offering> getInvalidOfferingsByUser(String email){
		ArrayList<Offering> offerings = new ArrayList<Offering>();
		connect();
		try {
			ps = conn.prepareStatement("SELECT * FROM Offerings WHERE chefEmail=?");
			ps.setString(1, email);
			rs = ps.executeQuery();	
			
			while(rs.next()) {
				Offering offering = new Offering(rs.getString("name"), 
						rs.getString("imgURL"), rs.getDouble("price"), rs.getLong("startTime"), rs.getLong("endTime"), 
						rs.getString("cuisineType"), rs.getString("location"), rs.getString("chefEmail"));
				offering.setId(rs.getInt("offeringID"));
				offerings.add(offering);
			}
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
		return offerings;
	}
	
	public static void removeOffering(int offeringID){
		connect();
		try {
			ps = conn.prepareStatement("UPDATE Offerings SET valid=false WHERE offeringID=?");
			ps.setInt(1, offeringID);
			ps.executeUpdate();
		
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		} finally {
			close();
		}
	}
		
}
