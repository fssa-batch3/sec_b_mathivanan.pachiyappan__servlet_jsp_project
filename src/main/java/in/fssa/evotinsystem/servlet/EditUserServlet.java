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
 * Servlet implementation class EditElectionServlet
 */
@WebServlet("/user/edit")
public class EditUserServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserService userService = new UserService();
		
		User user = new User();
		try {
			user = userService.findByUserId(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("users",user);
			request.setAttribute("id", request.getParameter("id"));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_user.jsp");
			dispatcher.forward(request, response);
			
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}
		
		
	}


}
