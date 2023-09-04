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
import in.fssa.evotingsystem.model.Election;
import in.fssa.evotingsystem.service.ElectionService;


/**
 * Servlet implementation class AddElections
 */
@WebServlet("/election/create")
public class CreateElectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    String electionName = request.getParameter("name");
    String electionDate = request.getParameter("date");
    String boothAddress = request.getParameter("booth_address");
    String talukId = request.getParameter("taluk_number");

    Election election = new Election();
    election.setElectionName(electionName);

    try {
        // Parse the date string into LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.parse(electionDate, formatter);
        election.setElectionDate(date);

        election.setBoothAddress(boothAddress);
        election.setTalukId(Integer.parseInt(talukId));

        ElectionService electionService = new ElectionService();
        electionService.createElection(election);

        response.sendRedirect(request.getContextPath()+ "/elections"); 
        
    } catch (DateTimeParseException e) {
        e.printStackTrace();
        throw new ServletException("Invalid date format. Please use yyyy-MM-dd format for the date.");
    } catch (NumberFormatException e) {
        e.printStackTrace();
        throw new ServletException("Invalid taluk ID. Please provide a valid integer.");
    } catch (ServiceException | ValidationException e) {
        e.printStackTrace();
        throw new ServletException(e.getMessage());
    }
}

}
