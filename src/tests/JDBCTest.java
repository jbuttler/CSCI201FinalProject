package tests;

import datatypes.User;
import driver.JDBCDriver;

public class JDBCTest {

	public static void main(String[] args) {
		
		User user = new User("Tommy Trojan", "tommytrojan.com", "ttrojan@usc.edu", "The dopest trojan", 5, "ttrojan");
		JDBCDriver.addUser(user);
		
	}

}
