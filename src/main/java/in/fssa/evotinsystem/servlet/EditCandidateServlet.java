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
import in.fssa.evotingsystem.model.Candidate;
import in.fssa.evotingsystem.service.CandidateService;

/**
 * Servlet implementation class EditCandidateServlet
 */
@WebServlet("/candidate/edit")
public class EditCandidateServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CandidateService electionService = new CandidateService();
		
		Candidate election = new Candidate();
		try {
			election = electionService.findByCandidateId(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("candidates",election);
			request.setAttribute("id", request.getParameter("id"));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_candidate.jsp");
			dispatcher.forward(request, response);
			
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}
		
		
	}

}
