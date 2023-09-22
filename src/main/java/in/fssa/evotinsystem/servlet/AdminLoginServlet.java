package in.fssa.evotinsystem.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.evotingsystem.exception.ServiceException;
import in.fssa.evotingsystem.exception.ValidationException;
import in.fssa.evotingsystem.model.Admin;
import in.fssa.evotingsystem.service.AdminService;

/**
 * Servlet Filter implementation class AdminLoginServlet
 */
@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
       
	private AdminService adminService;

    public AdminLoginServlet() {
        // Initialize your UserService here
        adminService = new AdminService();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_login.jsp");
		dispatcher.forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String adminEmail = request.getParameter("admin_email");
        String password = request.getParameter("password");

        try {
            Admin admin = adminService.loginAdmin(adminEmail, password);

            // Authentication successful
            HttpSession session = request.getSession();
            session.setAttribute("loggedAdmin", admin); // Store the user object in the session
            System.out.println("Succcess");
            response.sendRedirect(request.getContextPath() + "/index");
            
        } catch (NumberFormatException e) {
            // Handle invalid phone number format
            request.setAttribute("errorMessage", "Invalid Email Id format");
            request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
        } catch (ValidationException | ServiceException e) {
            // Handle validation or service exceptions
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/admin_login.jsp").forward(request, response);
        }
    }
}
