package servlet.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.ActiveUserException;
import service.UserService;

public class ActiveUserServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
// 1.
        String activeCode = request.getParameter("activeCode");
// 2.
        UserService service = new UserService();
        try {
            service.activeUser(activeCode);
            response.sendRedirect(request.getContextPath() + "/client/activesuccess.jsp");
            return;
        } catch (ActiveUserException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
            return;
        }
    }
}
