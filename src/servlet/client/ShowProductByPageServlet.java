package servlet.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PageBean;
import service.ProductService;

public class ShowProductByPageServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int currentPage = 1;
        String _currentPage = request.getParameter("currentPage");
        if (_currentPage != null) {
            currentPage = Integer.parseInt(_currentPage);
        }
        int currentCount = 4;
        String _currentCount = request.getParameter("currentCount");
        if (_currentCount != null) {
            currentCount = Integer.parseInt(_currentCount);
        }
        String category = "All products";
        String _category = request.getParameter("category");
        if (_category != null) {
            category = _category;
        }
        ProductService service = new ProductService();
        PageBean bean = service.findProductByPage(currentPage, currentCount,
                category);
        request.setAttribute("bean", bean);
        request.getRequestDispatcher("/client/product_list.jsp").forward(request, response);
        return;
    }

}
