package background;

import java.util.List;

import datatypes.Offering;
import driver.JDBCDriver;

public class DeleteInvalidOfferingsThread extends Thread {
	public void run() {
		while (true) {
			List<Offering> currentOfferings = JDBCDriver.getAllOfferings();
			
			for (Offering offering : currentOfferings) {
				if (offering.getEndTime() < System.currentTimeMillis()) {
					JDBCDriver.removeOffering(offering.getId());
				}
			}
			
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
