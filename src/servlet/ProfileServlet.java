package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.Offering;
import datatypes.User;
import driver.JDBCDriver;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		String email = currentUser.getEmail();
		List<Offering> userOfferings = JDBCDriver.getOfferingsByUser(email);
		request.setAttribute("offerings", userOfferings);
		String message = request.getParameter("message");
		if(message != null && !message.equals("")) {
			request.setAttribute("message", message);
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/ProfilePage.jsp");
		rd.forward(request, response);
	}

}
