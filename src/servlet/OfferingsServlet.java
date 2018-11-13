package servlet;


import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.Offering;
import datatypes.User;
import driver.JDBCDriver;

/**
 * Servlet implementation class OfferingsServlet
 */
@WebServlet("/OfferingsServlet")
public class OfferingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Offering> offerings = JDBCDriver.getAllOfferings();
		request.setAttribute("offerings", offerings);
		String newPage = "/OfferingsPage.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(newPage);
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startTime = (String) request.getParameter("startTime");
		String endTime = (String) request.getParameter("endTime");
		
		Calendar cal = Calendar.getInstance();
		int year  = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date  = cal.get(Calendar.DATE);
		
		String[] startParsed = startTime.split(":");
		String[] endParsed = endTime.split(":");
		
		cal.set(year, month, date, Integer.parseInt(startParsed[0]), Integer.parseInt(startParsed[1]));
		long startMillis = cal.getTimeInMillis();
		
		cal.set(year, month, date, Integer.parseInt(endParsed[0]), Integer.parseInt(endParsed[1]));
		long endMillis = cal.getTimeInMillis();
		
		Offering offering = new Offering((String)request.getParameter("name"),
				(String)request.getParameter("imageUrl"),
				Double.parseDouble((String)request.getParameter("price")),
				startMillis,
				endMillis,
				(String)request.getParameter("cuisineType"),
				(String)request.getParameter("location"));
		User user = (User) request.getSession().getAttribute("currentUser");
		String email = user.getEmail();
		JDBCDriver.addOffering(offering, email);
		response.sendRedirect("ProfilePage.jsp");
	}

}
