package servlet.client;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import domain.User;
import exception.RegisterException;
import service.UserService;
import utils.ActiveCodeUtils;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
    ServletException, IOException {
    doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
    ServletException, IOException {
    // Encapsulate form submission data into javaBean
    User user = new User();
    try {
    BeanUtils.populate(user, request.getParameterMap());
    // Encapsulate active code
    user.setActiveCode(ActiveCodeUtils.createActiveCode());
    } catch (IllegalAccessException e) {
    e.printStackTrace();
    } catch (InvocationTargetException e) {
    e.printStackTrace();
    }
    // finish register by service
    UserService service = new UserService();
    try {
    service.register(user);
    } catch (RegisterException e) {
    e.printStackTrace();
    response.getWriter().write(e.getMessage());
    return;
    }
    // success! redirect to registersuccess.jsp
    response.sendRedirect(request.getContextPath() + "/client/registersuccess.jsp");
    return;
    }
}
