package servlet.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	 public void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doPost(request, response);
	    }
	    public void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	//session
	        HttpSession session = request.getSession();
	// session
	        session.invalidate();
	// flag
	        String flag = request.getParameter("flag");
	        if (flag == null || flag.trim().isEmpty()) {

	            response.sendRedirect(request.getContextPath() + "/index.jsp");
	        }

	    }

}
