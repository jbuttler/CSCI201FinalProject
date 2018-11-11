package background;

import java.util.List;

import datatypes.Offering;
import datatypes.User;
import driver.JDBCDriver;

public class RatingThread extends Thread {
	public void run() {
		while (true) {
			List<User> users = JdbcDriver.getAllUsers();
			for (User user : users) {
				double sumRatings = 0;
				List<Offering> offerings = JDBCDriver.getOfferingsByUser(user.getEmail());
				for (Offering offering : offerings) {
					sumRatings += offering.getRating();
				}
				double avgRating = sumRatings / offerings.size();
				// update rating for user
			}
			
			Thread.sleep(5000);
		}
	}
}
