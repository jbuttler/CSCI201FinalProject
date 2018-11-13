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

@WebServlet("/OtherProfileServlet")
public class OtherProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OtherProfileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		User otherUser = JDBCDriver.getUser(email);
		List<Offering> userOfferings = JDBCDriver.getOfferingsByUser(email);
		request.setAttribute("otherUser", otherUser);
		request.setAttribute("offerings", userOfferings);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/OtherProfilePage.jsp");
		rd.forward(request, response);
	}

}
