package in.fssa.evotinsystem.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.evotingsystem.exception.ServiceException;
import in.fssa.evotingsystem.exception.ValidationException;
import in.fssa.evotingsystem.service.UserService;

/**
 * Servlet Filter implementation class ApproveUserServlet
 */

@WebServlet("/user/approve")
public class ApproveUserServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
		UserService user = new UserService();

		try {
			user.approveUser(id);
			response.sendRedirect(request.getContextPath() + "/users");
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

	}

}