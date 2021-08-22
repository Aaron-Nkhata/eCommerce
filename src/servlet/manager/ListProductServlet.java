package servlet.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Product;
import exception.ListProductException;
import service.ProductService;

public class ListProductServlet extends HttpServlet {
	
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
        ProductService service = new ProductService();
        try {
            List<Product> ps = service.listAll();
            request.setAttribute("ps", ps);
            request.getRequestDispatcher("/admin/products/list.jsp").forward(
                    request, response);
            return;
        } catch (ListProductException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
            return;
        }
    }

}
