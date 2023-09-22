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
import in.fssa.evotingsystem.exception.PersistenceException;
import in.fssa.evotingsystem.model.User;
import in.fssa.evotingsystem.model.Vote;
import in.fssa.evotingsystem.service.VoteService; // Import VoteService
import in.fssa.evotingsystem.exception.ServiceException;

@WebServlet("/voting")
public class VotingPageServlet extends HttpServlet {

    private VoteService voteService; // Declare a VoteService instance

    // Initialize the VoteService in the servlet's init() method
    @Override
    public void init() throws ServletException {
        super.init();
        voteService = new VoteService(); // Instantiate VoteService with the DAO
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String electionIdStr = request.getParameter("id");
            int electionId = Integer.parseInt(electionIdStr);
            
            User user = (User) request.getSession().getAttribute("loggedUser");
            List<Vote> voteList = VoteDAO.getVotesByUserId(user.getId());
            
            request.setAttribute("voteList", voteList);
            request.setAttribute("userData", user);
            request.setAttribute("electionId", electionId);
            
            // Check if the user has already voted
            boolean hasVoted = voteService.hasUserAlreadyVoted(user.getId(), electionId);
            request.setAttribute("hasVoted", hasVoted); // Pass the result to the JSP
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/voting_page.jsp");
            dispatcher.forward(request, response);
        } catch (PersistenceException | ServiceException e) {
            e.printStackTrace();
            // Handle the exceptions as needed
            request.setAttribute("error", "An error occurred while fetching votes.");
            RequestDispatcher errorDispatcher = request.getRequestDispatcher("/user_login.jsp");
            errorDispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int candidateId = Integer.parseInt(request.getParameter("candidateId"));
        int electionId = Integer.parseInt(request.getParameter("electionId"));

        // Check if the user has already voted before allowing them to vote
        try {
            boolean hasVoted = voteService.hasUserAlreadyVoted(userId, electionId);
            if (hasVoted) {
                // Redirect to a page indicating that the user has already voted
                response.sendRedirect(request.getContextPath() + "/already/voted?id=" + electionId);
            } else {
                // Perform the vote update in the database using your VoteDAO.
                VoteDAO voteDAO = new VoteDAO();
                voteDAO.insertVote(userId, candidateId, electionId);
                // Redirect to a success page after successful voting.
                response.sendRedirect(request.getContextPath() + "/select");
            }
        } catch (PersistenceException | ServiceException e) {
            e.printStackTrace(); // You can log the error or take appropriate action
            // Redirect to an error page
            response.sendRedirect(request.getContextPath() + "/select");
        }
    }
}
