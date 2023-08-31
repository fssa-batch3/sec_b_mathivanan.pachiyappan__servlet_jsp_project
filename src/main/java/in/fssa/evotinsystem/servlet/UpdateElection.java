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
import in.fssa.evotingsystem.model.Election;
import in.fssa.evotingsystem.service.ElectionService;


/**
 * Servlet implementation class UpdateElection
 */
@WebServlet("/election/update")
public class UpdateElection extends HttpServlet {
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		ElectionService electionService = new 	ElectionService();
		Election election = new Election();
//		PrintWriter out = response.getWriter();
		
		election.setElectionName(request.getParameter("name"));
		election.setElectionDate(LocalDate.parse(request.getParameter("date")));
		election.setBoothAddress(request.getParameter("booth_address"));
		election.setTalukId(Integer.parseInt(request.getParameter("taluk_number")));
		
		try {
			electionService.updateElection(id, election);
			
			response.sendRedirect(request.getContextPath() + "/elections");
		}catch(ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
	}

}
