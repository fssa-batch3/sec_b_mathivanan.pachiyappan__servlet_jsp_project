package in.fssa.evotinsystem.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLogout
 */
@WebServlet("/adminlogout")
public class AdminLogoutServlet  extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
    
		request.getSession().removeAttribute("loggedAdmin");
		request.getSession().invalidate();
		
        response.sendRedirect(request.getContextPath() + "/index"); // Adjust the path as needed
    }

}