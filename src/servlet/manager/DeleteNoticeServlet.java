package servlet.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;

public class DeleteNoticeServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	    public void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        this.doPost(req, resp);
	    }
	    public void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        NoticeService nService = new NoticeService();
	        String n_id = req.getParameter("id");
	        nService.deleteNotice(n_id);
	        req.getRequestDispatcher("/manager/ListNoticeServlet").forward(req, resp);
	    }
}
