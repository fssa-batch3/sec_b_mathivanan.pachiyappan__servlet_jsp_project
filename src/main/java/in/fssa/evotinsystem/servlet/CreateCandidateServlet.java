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
 * Servlet implementation class AddCandidateServlet
 */
@WebServlet("/candidate/create")
public class CreateCandidateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String candidateName = request.getParameter("candidateName");
        String candidateRegno = request.getParameter("candidateRegNo");
        String electionId = request.getParameter("electionId");
        String partyName = request.getParameter("partyName");
        String imageUrl = request.getParameter("imageUrl");
        String candidatePicture = request.getParameter("profilePic");
        String createdAt = request.getParameter("createdAt");

        Candidate candidate = new Candidate();
        candidate.setName(candidateName);
        candidate.setUserId(Integer.parseInt(candidateRegno));
        candidate.setElectionId(Integer.parseInt(electionId));
        candidate.setPartyName(partyName);
        candidate.setImageUrl(imageUrl);
        candidate.setProfilePic(candidatePicture);

        try {
            // Parse the date string into LocalDate
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate date = LocalDate.parse(createdAt, formatter);
            candidate.setCreatedAt(date);

            CandidateService candidateService = new CandidateService();
            candidateService.createCandidate(candidate);

            response.sendRedirect(request.getContextPath() + "/candidates");
        } catch (DateTimeParseException e) {
            e.printStackTrace();
            throw new ServletException("Invalid date format. Please use yyyy-MM-dd format for the date.");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            throw new ServletException("Invalid ID's. Please provide a valid ID.");
        } catch (ServiceException | ValidationException e) {
            e.printStackTrace();
            throw new ServletException(e.getMessage());
        }
    }
}
