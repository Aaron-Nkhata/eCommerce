package servlet.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Product;
import exception.FindProductByIdException;
import service.ProductService;

public class AddCartServlet extends HttpServlet {
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
        String id = request.getParameter("id");
        ProductService service = new ProductService();
        try {
            Product p = service.findProductById(id);
            HttpSession session = request.getSession();
            Map<Product, Integer> cart = (Map<Product, Integer>)session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<Product, Integer>();
            }
            Integer count = cart.put(p, 1);
            if (count != null) {
                cart.put(p, count + 1);
            }
            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "/client/cart.jsp");
            return;
        } catch (FindProductByIdException e) {
            e.printStackTrace();
        }
    }

}
