package in.fssa.evotinsystem.servlet;

import java.io.IOException;
import java.time.LocalDate;

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
 * Servlet implementation class UpdateCandidateServlet
 */
@WebServlet("/candidate/update")
public class UpdateCandidateServlet extends HttpServlet {
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		CandidateService candidateService = new CandidateService();
		Candidate candidate = new Candidate();
//		PrintWriter out = response.getWriter();
		
		candidate.setName(request.getParameter("candidateName"));
		candidate.setPartyName(request.getParameter("partyName"));
		candidate.setImageUrl(request.getParameter("imageUrl"));
		candidate.setCreatedAt(LocalDate.parse(request.getParameter("createdAt")));
		candidate.setUserId(Integer.parseInt(request.getParameter("candidateRegNo")));
		candidate.setElectionId(Integer.parseInt(request.getParameter("electionId")));
		
		try {
			candidateService.updateCandidate(id, candidate);
			
			response.sendRedirect(request.getContextPath() + "/candidates");
		}catch(ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
	}

}
