package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import background.RatingThread;
import datatypes.User;
import driver.JDBCDriver;

@WebServlet("/CreateUserServlet")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateUserServlet() {
        Thread ratingsThread = new RatingThread();
        ratingsThread.start();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imageUrl = request.getParameter("imageUrl");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		User currentUser = new User(name, imageUrl, email, "", 0.0, "");
		JDBCDriver.addUser(currentUser);
		HttpSession session = request.getSession();
		session.setAttribute("currentUser", currentUser);
		String newPage = "ProfilePage.jsp";
		response.sendRedirect(newPage);
	}

}
