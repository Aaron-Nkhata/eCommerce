package servlet.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;

public class MyAccountServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
/**
 * There are two cases when you click My account in front end
 * 1.It will jump to login if guest browses the page.
 * 2. If it is a user of system
 * a.Administrator, jump to back end of the system
 * b.General user, Login in myaccount
 */
//search the user in session
        User user = (User) request.getSession().getAttribute("user");
//if user is null, jump to login page
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/client/login.jsp");
            return;
        }
//if it is an administrator,jump to manage page
        if ("admin".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/admin/login/home.jsp");
// return;
        }else{
            response.sendRedirect(request.getContextPath() + "/client/myAccount.jsp");
// return;
        }
    }

}
