package in.fssa.evotinsystem.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ErrorHandlingServlet
 */
@WebServlet("/ErrorHandler")
public class ErrorHandlerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Get the error code
       Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
       
       if (statusCode != null && statusCode == 404) {
           request.getRequestDispatcher("/404error.jsp").forward(request, response);
       }else if(statusCode != null && statusCode == 500) {
       	request.getRequestDispatcher("/500error.jsp").forward(request, response);
       }else if(statusCode != null && statusCode == 405) {
       	request.getRequestDispatcher("/405error.jsp").forward(request, response);
       }
       else {
           request.getRequestDispatcher("/genericError.jsp").forward(request, response);
       }
	}

}
