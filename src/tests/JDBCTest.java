package tests;

import datatypes.Offering;
import datatypes.User;
import driver.JDBCDriver;

public class JDBCTest {

	public static void main(String[] args) {
		
		User user = new User("Tommy Trojan", "tommytrojan.com", "ttrojan@usc.edu", "The dopest trojan", 5, "ttrojan");
		JDBCDriver.addUser(user);
		
		Offering offering = new Offering("The best offerig", "You'll love this offering.", "goodImg.com", 6.95, 123456780, 123456789, 4, "chinese", "New North");
		JDBCDriver.addOffering(offering, user.getEmail());
		
	}

}
