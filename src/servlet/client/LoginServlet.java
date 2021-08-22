package servlet.client;

import java.io.IOException;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.UserService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
// 1.get user name and password
        String username = request.getParameter("username");
        String password = request.getParameter("password");
// 2..logine
        UserService service = new UserService();
        try {
            User user = service.login(username, password);
// 3.store info into session after user login.
            request.getSession().setAttribute("user", user);
// get role of users
            String role = user.getRole();
// if it is an administrator,jump to backend
            if ("Administrator".equals(role)) {
                response.sendRedirect(request.getContextPath() + "/admin/login/home.jsp");
                return;
            } else {
                response.sendRedirect(request.getContextPath() + "/client/myAccount.jsp");
                return;
            }
        } catch (LoginException e) {
// if an error occurs,jump to login page
            e.printStackTrace();
            request.setAttribute("register_message", e.getMessage());
            request.getRequestDispatcher("/client/login.jsp").forward(request, response);
            return;
        }
    }

}
