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
import in.fssa.evotingsystem.model.User;
import in.fssa.evotingsystem.service.UserService;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/userlogin")
public class UserLoginServlet extends HttpServlet {
    private UserService userService;

    public UserLoginServlet() {
        // Initialize your UserService here
        userService = new UserService();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/user_login.jsp");
		dispatcher.forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phoneNumber = request.getParameter("phone_number");
        String password = request.getParameter("password");

        try {
            long parsedPhoneNumber = Long.parseLong(phoneNumber);
            User user = userService.loginUser(parsedPhoneNumber, password);

            // Authentication successful
            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", user); // Store the user object in the session
            System.out.println("Storing loggedUser:" + user);
            System.out.println("Succcess");
            response.sendRedirect(request.getContextPath() + "/index");
            
        } catch (NumberFormatException e) {
            // Handle invalid phone number format
            request.setAttribute("errorMessage", "Invalid phone number format");
            request.getRequestDispatcher("/user_login.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle validation or service exceptions
            request.setAttribute("errorMessage", e.getMessage());
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("password", password);
            request.getRequestDispatcher("/user_login.jsp").forward(request, response);
        }
    }
}
