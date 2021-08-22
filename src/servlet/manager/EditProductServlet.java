package servlet.manager;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import domain.Product;
import service.ProductService;
import utils.FileUploadUtils;

public class EditProductServlet extends HttpServlet {
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
	        Product p = new Product();
	        Map<String, String> map = new HashMap<String, String>();
	        DiskFileItemFactory dfif = new DiskFileItemFactory();
	        dfif.setRepository(new File(this.getServletContext().getRealPath(
	                "/temp")));
	        dfif.setSizeThreshold(1024 * 1024 * 10);
	        ServletFileUpload upload = new ServletFileUpload(dfif);
	        upload.setHeaderEncoding("utf-8");
	        try {
	            List<FileItem> items = upload.parseRequest(request);
	            for (FileItem item : items) {
	                if (item.isFormField()) {
	                    String fieldName = item.getFieldName();
	                    String value = item.getString("utf-8");
	                    map.put(fieldName, value);
	                } else {
	                    String fileName = item.getName();
	                    if (fileName != null && fileName.trim().length() > 0) {
	                        fileName = FileUploadUtils.subFileName(fileName);
	                        String randomName = FileUploadUtils
	                                .generateRandonFileName(fileName);
	                        String randomDir = FileUploadUtils
	                                .generateRandomDir(randomName);
	                        String imgurl_parent = "/productImg" + randomDir;
	                        File parentDir = new File(this.getServletContext()
	                                .getRealPath(imgurl_parent));
	                        if (!parentDir.exists()) {
	                            parentDir.mkdirs();
	                        }
	                        String imgurl = imgurl_parent + "/" + randomName;
	                        map.put("imgurl", imgurl);
	                        IOUtils.copy(item.getInputStream(),
	                                new FileOutputStream(new File(parentDir,
	                                        randomName)));
	                        item.delete();
	                    }
	                }
	            }
	        } catch (FileUploadException e) {
	            e.printStackTrace();
	        }
	        try {
	            BeanUtils.populate(p, map);
	        } catch (IllegalAccessException e) {
	            e.printStackTrace();
	        } catch (InvocationTargetException e) {
	            e.printStackTrace();
	        }
	        ProductService service = new ProductService();
	        service.editProduct(p);
	        response.sendRedirect(request.getContextPath() + "/listProduct");
	        return;
	    }

}
