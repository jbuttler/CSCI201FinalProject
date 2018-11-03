package driver;
import java.sql.*;

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
	
	static User getUser(String email){
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
	
}
