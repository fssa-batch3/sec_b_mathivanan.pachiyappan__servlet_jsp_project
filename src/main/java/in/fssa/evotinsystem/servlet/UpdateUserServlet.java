package in.fssa.evotinsystem.servlet;

import java.io.IOException;

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
 * Servlet implementation class UpdateElection
 */
@WebServlet("/user/update")
public class UpdateUserServlet extends HttpServlet {
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		UserService userService = new UserService();
		User user = new User();
//		PrintWriter out = response.getWriter();
	
		user.setPassword(request.getParameter("password"));
		user.setAddress(request.getParameter("address"));
		user.setTalukId(Integer.parseInt(request.getParameter("taluk_number")));
		
		try {
			userService.updateUser(id, user);
			
			response.sendRedirect(request.getContextPath() + "/users");
		}catch(ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
	}

}
