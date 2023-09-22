package in.fssa.evotinsystem.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.evotingsystem.dao.VoteDAO;
import in.fssa.evotingsystem.dto.VoteDTO;
import in.fssa.evotingsystem.exception.PersistenceException;

/**
 * Servlet implementation class CandidatesVotesServlet
 */
@WebServlet("/results")
public class ElectionResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/election_results.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int candidateId = Integer.parseInt(request.getParameter("candidateId"));
        int electionId = Integer.parseInt(request.getParameter("electionId"));

        // Perform the vote update in the database using your VoteDAO.
        try {
            VoteDAO voteDAO = new VoteDAO();
            voteDAO.insertVote(userId, candidateId, electionId);
            // Redirect to a success page after successful voting.
            response.sendRedirect(request.getContextPath() + "/results?electionId=" + electionId);
        } catch (PersistenceException e) {
            // Handle the exception if the vote insertion fails
            e.printStackTrace(); // You can log the error or take appropriate action
            // Redirect to an error page
            response.sendRedirect(request.getContextPath() + "/select");
        }
    }
}