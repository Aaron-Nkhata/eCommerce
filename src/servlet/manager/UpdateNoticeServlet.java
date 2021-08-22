package servlet.manager;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Notice;
import service.NoticeService;

public class UpdateNoticeServlet extends HttpServlet {
	
	 private static final long serialVersionUID = 1L;
	    public void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        this.doPost(req, resp);
	    }
	    public void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	        NoticeService nService = new NoticeService();
	        Notice bean = new Notice();
	        String title = req.getParameter("title");
	        String details = req.getParameter("details");
	        String t = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	        bean.setTitle(title);
	        bean.setDetails(details);
	        bean.setN_time(t);
	        nService.addNotice(bean);
	        req.getRequestDispatcher("/manager/ListNoticeServlet").forward(req, resp);
	    }

}
