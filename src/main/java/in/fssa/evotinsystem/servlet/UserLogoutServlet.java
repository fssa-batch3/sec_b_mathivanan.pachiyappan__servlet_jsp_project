package in.fssa.evotinsystem.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserLogoutServlet
 */
@WebServlet("/userlogout")
public class UserLogoutServlet  extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
    
		request.getSession().removeAttribute("loggedUser");
		request.getSession().invalidate();
		
        response.sendRedirect(request.getContextPath() + "/index"); // Adjust the path as needed
    }

}
