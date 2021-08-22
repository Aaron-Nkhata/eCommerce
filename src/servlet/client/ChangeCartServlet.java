package servlet.client;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Product;

public class ChangeCartServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        int count = Integer.parseInt(request.getParameter("count"));
        HttpSession session = request.getSession();
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        Product p = new Product();
        p.setId(id);
        if (count != 0) {
            cart.put(p, count);
        } else {
            cart.remove(p);
        }
        response.sendRedirect(request.getContextPath() + "/client/cart.jsp");
        return;
    }

}
