package tests;

import java.util.ArrayList;

import datatypes.Offering;
import datatypes.User;
import driver.JDBCDriver;

public class JDBCTest {

	public static void main(String[] args) {
		
		User user1 = new User("Tommy Trojan", "tommytrojan.com", "ttrojan@usc.edu", "The dopest trojan", 5, "ttrojan");
		JDBCDriver.addUser(user1);
		
		User user2 = new User("Hecuba Trojan", "hecubatrojan.com", "htrojan@usc.edu", "The mother of troy", 4, "htrojan");
		JDBCDriver.addUser(user2);
		JDBCDriver.getAllUsers();
		ArrayList<User> users = JDBCDriver.getAllUsers();
		for(User user : users) {
			System.out.println(user.getName());
		}
		
		Offering offering1 = new Offering("The best offering", "You'll love this offering.", "goodImg.com", 6.95, 123456780, 123456789, 4, "chinese", "New North");
		JDBCDriver.addOffering(offering1, user1.getEmail());
		
		ArrayList<Offering> offerings = JDBCDriver.getAllOfferings();
		for(Offering offering: offerings) {
			System.out.println(offering.getName());
		}
		
		JDBCDriver.removeOffering(offering1.getId());
		
		offerings = JDBCDriver.getAllOfferings();
		for(Offering offering: offerings) {
			System.out.println(offering.getName());
		}
		
	}

}
