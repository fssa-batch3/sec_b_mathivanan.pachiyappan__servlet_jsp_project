package in.fssa.evotinsystem.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.evotingsystem.exception.ServiceException;
import in.fssa.evotingsystem.exception.ValidationException;
import in.fssa.evotingsystem.service.CandidateService;

/**
 * Servlet implementation class DeleteCandidateServlet
 */
@WebServlet("/candidate/delete")
public class DeleteCandidateServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		CandidateService candidate = new CandidateService();

		try {
			candidate.deleteCandidate(id);
			response.sendRedirect(request.getContextPath() + "/candidates");
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

	}

}
