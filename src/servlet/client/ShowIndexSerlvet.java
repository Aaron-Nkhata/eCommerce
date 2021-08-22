package servlet.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Notice;
import service.NoticeService;
import service.ProductService;

/**
 * front end servlet
 * 1.show the latest notice
 * 2.show the popular books
 */
public class ShowIndexSerlvet extends HttpServlet {
	
	 /**
    *
    */
   private static final long serialVersionUID = 1L;
   public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       this.doPost(req, resp);
   }
   public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {

   	//search the latest notice
       NoticeService nService = new NoticeService();
       Notice notice = nService.getRecentNotice();
       req.setAttribute("n", notice);

       // search the popular books
       ProductService pService = new ProductService();
       List<Object[]> pList = pService.getWeekHotProduct();
       req.setAttribute("pList", pList);

       //redirect to client/index.jsp
       req.getRequestDispatcher("/client/index.jsp").forward(req, resp);
   }

}
