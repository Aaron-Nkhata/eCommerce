package servlet.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Product;
import exception.FindProductByIdException;
import service.ProductService;

public class FindProductByIdServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        ProductService service = new ProductService();
        try {
            Product p = service.findProductById(id);
            request.setAttribute("p", p);
            if (type == null) {
                request.getRequestDispatcher("/client/info.jsp").forward(request,response);
                return;
            }
            request.getRequestDispatcher("/admin/products/edit.jsp").forward(request,
                    response);
            return;
        } catch (FindProductByIdException e) {
            e.printStackTrace();
        }
    }

}
