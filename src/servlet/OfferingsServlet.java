package servlet;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.Offering;

/**
 * Servlet implementation class OfferingsServlet
 */
@WebServlet("/OfferingsServlet")
public class OfferingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// List<Offering> = JdbcDriver.getAllOfferings();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Offering offering = new Offering(request.getParameter("name"),
				request.getParameter("description"),
				Double.parseDouble(request.getParameter("price")),
				Long.parseLong(request.getParameter("startTime")),
				Long.parseLong(request.getParameter("endTime")),
				Double.parseDouble(request.getParameter("rating")),
				request.getParameter("cuisineType"));
		// JdbcDriver.addOffering(offering);
	}

}
