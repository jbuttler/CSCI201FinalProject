package tests;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import datatypes.Offering;
import datatypes.User;
import driver.JDBCDriver;

class JDBCTests {

	User user1 = new User("Tommy Trojan", "tommytrojan.com", "ttrojan@usc.edu", "The dopest trojan", "ttrojan");
	User user2 = new User("Hecuba Trojan", "hecubatrojan.com", "htrojan@usc.edu", "The mother of troy", "htrojan");
	Offering offering1 = new Offering("The best offering", "You'll love this offering.", "goodImg.com", 6.95, 123456780, 123456789, "chinese", "New North");
	Offering offering2 = new Offering("The better offering", "You'll love this offering.", "goodFoodImg.com", 7.95, 124456780, 124456789, "Mexican", "Parkside");


	@Test
	void testAddGetUser() {
		
		JDBCDriver.addUser(user1);
		User tempUser = JDBCDriver.getUser(user1.getEmail());
		
		assertEquals(tempUser.getBio(), user1.getBio());
		assertEquals(tempUser.getEmail(), user1.getEmail());
		assertEquals(tempUser.getImageUrl(), user1.getImageUrl());
		assertEquals(tempUser.getContactInfo(), user1.getContactInfo());
		assertEquals(tempUser.getName(), user1.getName());
		assertEquals(tempUser.getOfferings(), tempUser.getOfferings());
		
		
		JDBCDriver.addUser(user2);
		ArrayList<User> users = JDBCDriver.getAllUsers();
		boolean containsUser1 = false;
		boolean containsUser2 = false;
		for(User elem : users) {
			containsUser1 |= elem.getEmail().equals(user1.getEmail());
			containsUser2 |= elem.getEmail().equals(user2.getEmail());

		}
		
		assertTrue(containsUser1);
		assertTrue(containsUser2);

	}

	@Test
	void testAddRemoveOfferings() {
		JDBCDriver.addOffering(offering1, user1.getEmail());
		
		Offering temp = JDBCDriver.getOffering(offering1.getId());
		
		assertEquals(temp.getCuisineType(), offering1.getCuisineType());
		assertEquals(temp.getDescription(), offering1.getDescription());
		assertEquals(temp.getEndTime(), offering1.getEndTime());
		assertEquals(temp.getId(), offering1.getId());
		assertEquals(temp.getImageUrl(), offering1.getImageUrl());
		assertEquals(temp.getLocation(), offering1.getLocation());
		assertEquals(temp.getName(), offering1.getName());
		assertEquals(temp.getPrice(), offering1.getPrice());
		assertEquals(temp.getStartTime(), offering1.getStartTime());
		assertTrue(temp.equals(offering1));
		
		ArrayList<Offering> offerings = JDBCDriver.getAllOfferings();
		boolean success = false;
		for(Offering offering: offerings) {
			success |= offering1.equals(offering);
		}
		assertTrue(success);
		
		JDBCDriver.removeOffering(offering1.getId());
		
		offerings = JDBCDriver.getAllOfferings();
		success = false;
		for(Offering offering: offerings) {
			success |= offering1.equals(offering);
		}
		assertFalse(success);
		
	}
	
	@Test
	void testGetOfferingsByUser() {
		JDBCDriver.addOffering(offering1, user1.getEmail());
		JDBCDriver.addOffering(offering2, user2.getEmail());
		
		ArrayList<Offering> offerings = JDBCDriver.getOfferingsByUser(user1.getEmail());
		boolean success1 = false;
		boolean success2 = false;
		for(Offering offering: offerings) {
			success1 |= offering.equals(offering1);
			success2 |= offering.equals(offering2);
		}	
		assertTrue(success1);
		assertFalse(success2);
		
		offerings = JDBCDriver.getOfferingsByUser(user2.getEmail());
		success1 = false;
		success2 = false;
		for(Offering offering: offerings) {
			success1 |= offering.equals(offering1);
			success2 |= offering.equals(offering2);
		}	
		assertFalse(success1);
		assertTrue(success2);
		
		offerings = JDBCDriver.getInvalidOfferingsByUser(user1.getEmail());
		success1 = false;
		success2 = false;
		for(Offering offering: offerings) {
			success1 |= offering.equals(offering1);
			success2 |= offering.equals(offering2);
		}	
		assertTrue(success1);
		assertFalse(success2);
		
		offerings = JDBCDriver.getInvalidOfferingsByUser(user2.getEmail());
		success1 = false;
		success2 = false;
		for(Offering offering: offerings) {
			success1 |= offering.equals(offering1);
			success2 |= offering.equals(offering2);
		}	
		assertFalse(success1);
		assertTrue(success2);
		
		JDBCDriver.removeOffering(offering2.getId());
		
		offerings = JDBCDriver.getOfferingsByUser(user2.getEmail());
		success1 = false;
		success2 = false;
		for(Offering offering: offerings) {
			success1 |= offering.equals(offering1);
			success2 |= offering.equals(offering2);
		}	
		assertFalse(success1);
		assertFalse(success2);
		
		offerings = JDBCDriver.getInvalidOfferingsByUser(user2.getEmail());
		success1 = false;
		success2 = false;
		for(Offering offering: offerings) {
			success1 |= offering.equals(offering1);
			success2 |= offering.equals(offering2);
		}	
		assertFalse(success1);
		assertTrue(success2);
		
	}
}
