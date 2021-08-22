package service;

import java.sql.SQLException;
import java.util.List;

import dao.ProductDao;
import domain.PageBean;
import domain.Product;
import exception.AddProductException;
import exception.FindProductByIdException;
import exception.ListProductException;

public class ProductService {
	
	private ProductDao dao = new ProductDao();
    public void addProduct(Product p) throws AddProductException {
        try {
            dao.addProduct(p);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new AddProductException("FAILED: Add product");
        }
    }
    public List<Product> listAll() throws ListProductException {
        try {
            return dao.listAll();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ListProductException("FAILED: query product");
        }
    }
    public PageBean findProductByPage(int currentPage, int currentCount,
                                      String category) {
        PageBean bean = new PageBean();
        bean.setCurrentCount(currentCount);
        bean.setCurrentPage(currentPage);
        bean.setCategory(category);
        try {
            int totalCount = dao.findAllCount(category);
            bean.setTotalCount(totalCount);
            int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
            bean.setTotalPage(totalPage);
            List<Product> ps = dao.findByPage(currentPage, currentCount,
                    category);
            bean.setPs(ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bean;
    }
    public Product findProductById(String id) throws FindProductByIdException {
        try {
            return dao.findProductById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new FindProductByIdException("FAILED: Find book by id");
        }
    }
    public List<Object[]> download(String year, String month) {
        List<Object[]> salesList = null;
        try {
            salesList = dao.salesList(year, month);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salesList;
    }
    public List<Product> findProductByManyCondition(String id, String name,
                                                    String category, String minprice, String maxprice) {
        List<Product> ps = null;
        try {
            ps = dao.findProductByManyCondition(id, name, category, minprice,
                    maxprice);
        } catch (SQLException e) {
// TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ps;
    }
    public void editProduct(Product p) {
        try {
            dao.editProduct(p);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Object[]> getWeekHotProduct() {
        try {
            return dao.getWeekHotProduct();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("FAILED: Get week hot product");
        }
    }
    public PageBean findBookByName(int currentPage, int currentCount,String searchfield) {
        PageBean bean = new PageBean();
        bean.setCurrentCount(currentCount);
        bean.setCurrentPage(currentPage);
        bean.setSearchfield(searchfield);
        try {
            int totalCount = dao.findBookByNameAllCount(searchfield);
            bean.setTotalCount(totalCount);
            int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
            bean.setTotalPage(totalPage);
            List<Product> ps = dao.findBookByName(currentPage,currentCount,searchfield);
            bean.setPs(ps);
            return bean;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("FAILED: search book by name");
        }
    }
    public void deleteProduct(String id) {
        try {
            dao.deleteProduct(id);
        } catch (SQLException e) {
            throw new RuntimeException("FAILED: Delete book");
        }
    }

}
