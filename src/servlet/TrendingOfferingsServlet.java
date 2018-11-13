package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.Offering;
import driver.JDBCDriver;

@WebServlet("/TrendingOfferingsServlet")
public class TrendingOfferingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrendingOfferingsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Offering> offerings = JDBCDriver.getAllOfferings();
		List<Offering> trendingOfferings = new ArrayList<Offering>();
		Set<String> locations = new HashSet<String>();
		for(Offering offering : offerings)
		{	
			String location = offering.getLocation();
			if(!locations.contains(location)) {
				locations.add(location);
				trendingOfferings.add(offering);
			}
		}
		request.setAttribute("trendingOfferings", trendingOfferings);
		request.setAttribute("locations", locations);
		RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
		rd.forward(request, response);
	}

}
