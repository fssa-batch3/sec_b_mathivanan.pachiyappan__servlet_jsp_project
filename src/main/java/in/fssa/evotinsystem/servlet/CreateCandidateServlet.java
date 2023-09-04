package in.fssa.evotinsystem.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

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
 * Servlet implementation class CreateCandidateServlet
 */
@WebServlet("/candidate/create")
public class CreateCandidateServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    String candidateRegNo = request.getParameter("candidate_regNo");
    String createdAt = request.getParameter("created_at");
    String candidateName = request.getParameter("candidate_name");
    String electionId = request.getParameter("election_number");

    Candidate candidate = new Candidate();
    candidate.setCandidateName(candidateName);

    try {
        // Parse the date string into LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(createdAt, formatter);
        candidate.setCreatedAt(date);

        candidate.setCandidateId(Integer.parseInt(candidateRegNo));
        candidate.setElectionId(Integer.parseInt(electionId));

        CandidateService candidateService = new CandidateService();
        candidateService.createCandidate(candidate);

        response.sendRedirect(request.getContextPath()+ "/candidates"); 
        
    } catch (DateTimeParseException e) {
        e.printStackTrace();
        throw new ServletException("Invalid date format. Please use yyyy-MM-dd format for the date.");
    } catch (NumberFormatException e) {
        e.printStackTrace();
        throw new ServletException("Invalid IDs. Please provide a valid Register No and Election Id.");
    } catch (ServiceException | ValidationException e) {
        e.printStackTrace();
        throw new ServletException(e.getMessage());
    }
}

}
