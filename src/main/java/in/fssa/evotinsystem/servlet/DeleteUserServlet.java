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
 * Servlet implementation class DeleteElectionServlet
 */
@WebServlet("/user/delete")
public class DeleteUserServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		UserService user = new UserService();

		try {
			user.deleteUser(id);
			response.sendRedirect(request.getContextPath() + "/users");
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

	}

}
