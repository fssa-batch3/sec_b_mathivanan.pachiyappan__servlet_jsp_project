package in.fssa.evotinsystem.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.evotingsystem.exception.ServiceException;
import in.fssa.evotingsystem.exception.ValidationException;
import in.fssa.evotingsystem.model.User;
import in.fssa.evotingsystem.service.UserService;

/**
 * Servlet implementation class AddElections
 */

@WebServlet("/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/user_register.jsp");
		dispatcher.forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phoneNumber = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String voterId = request.getParameter("voter_number");
        String talukId = request.getParameter("taluk_number");

        User user = new User();
        user.setPhoneNumber(Long.parseLong(phoneNumber));
        user.setPassword(password);
        user.setAddress(address);
        user.setVoterId(Integer.parseInt(voterId));
        user.setTalukId(Integer.parseInt(talukId));

        UserService userService = new UserService();

        try {
            // Check if the phone number already exists before creating the user
            User existingUser = userService.findByPhoneNumber(user.getPhoneNumber());
            if (existingUser != null) {
                String errorMessage = "Phone number already exists";
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/user_register.jsp");
                dispatcher.forward(request, response);
                return; // Exit the servlet
            }

            userService.createUser(user);

            response.sendRedirect(request.getContextPath() + "/userlogin");
            
        }  catch (NumberFormatException e) {
            // Handle invalid phone number format
            request.setAttribute("errorMessage", "Invalid phone number format");
            request.getRequestDispatcher("/user_login.jsp").forward(request, response);
        } catch (ValidationException | ServiceException e) {
            // Handle validation or service exceptions
        	e.printStackTrace();
            throw new ServletException(e.getMessage());
        }
        
    }
}
