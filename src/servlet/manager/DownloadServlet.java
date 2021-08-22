package servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductService;

public class DownloadServlet extends HttpServlet {
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
	        String year = request.getParameter("year");
	        String month = request.getParameter("month");
	        ProductService service = new ProductService();
	        List<Object[]> ps = service.download(year,month);
	        String fileName=year+"year"+month+"month hot list";
	        response.setContentType(this.getServletContext().getMimeType(fileName));
	        response.setHeader("Content-Disposition", "attachement;filename="+new
	                String(fileName.getBytes("GBK"),"iso8859-1"));
	        response.setCharacterEncoding("gbk");
	        PrintWriter out = response.getWriter();
	        out.println("products name, sales number");
	        for (int i = 0; i < ps.size(); i++) {
	            Object[] arr=ps.get(i);
	            out.println(arr[0]+","+arr[1]);
	        }
	        out.flush();
	        out.close();
	    }

}
