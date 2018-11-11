package servlet;


import java.io.IOException;
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
		Offering offering = new Offering((String)request.getParameter("name"),
				(String)request.getParameter("description"),
				(String)request.getParameter("imageUrl"),
				Double.parseDouble((String)request.getParameter("price")),
				Long.parseLong((String)request.getParameter("startTime")),
				Long.parseLong((String)request.getParameter("endTime")),
				(String)request.getParameter("cuisineType"),
				(String)request.getParameter("location"));
		JDBCDriver.addOffering(offering, ((User)request.getSession().getAttribute("email")).getEmail());
	}

}
