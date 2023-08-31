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
import in.fssa.evotingsystem.model.Election;
import in.fssa.evotingsystem.service.ElectionService;


/**
 * Servlet implementation class EditElectionServlet
 */
@WebServlet("/election/edit")
public class EditElectionServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ElectionService electionService = new ElectionService();
		
		Election election = new Election();
		try {
			election = electionService.findByElectionId(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("elections",election);
			request.setAttribute("id", request.getParameter("id"));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_election.jsp");
			dispatcher.forward(request, response);
			
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}
		
		
	}


}
