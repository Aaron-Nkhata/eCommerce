package servlet.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PageBean;
import service.ProductService;

public class MenuSearchSerlvet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        this.doPost(req, resp);
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int currentPage = 1;
        String _currentPage = req.getParameter("currentPage");
        if (_currentPage != null) {
            currentPage = Integer.parseInt(_currentPage);
        }
        int currentCount = 4;
        String searchfield = req.getParameter("textfield");
        if("Please input book name".equals(searchfield)){
            req.getRequestDispatcher("/showProductByPage").forward(req, resp);
            return;
        }
        ProductService service = new ProductService();
        PageBean bean = service.findBookByName(currentPage,currentCount,searchfield);
        req.setAttribute("bean", bean);
        req.getRequestDispatcher("/client/product_search_list.jsp").forward(req, resp);
    }

}
