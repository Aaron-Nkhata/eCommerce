package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import domain.Order;
import domain.OrderItem;
import domain.Product;
import utils.DataSourceUtils;

public class ProductDao {
        
	 // add product
    public void addProduct(Product p) throws SQLException {
        String sql = "insert into products values(?,?,?,?,?,?,?)";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, p.getId(), p.getName(), p.getPrice(),
                p.getCategory(), p.getPnum(), p.getImgurl(), p.getDescription());
    }
    // query all products
    public List<Product> listAll() throws SQLException {
        String sql = "select * from products";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<Product>(Product.class));
    }
    //get number of data
    public int findAllCount(String category) throws SQLException {
        String sql = "select count(*) from products";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
/////------------------------All products 1
        if (!"AllProducts".equals(category)) {
            sql += " where category=?";
            Long count = (Long) runner
                    .query(sql, new ScalarHandler(), category);
            return count.intValue();
        } else {
            Long count = (Long) runner.query(sql, new ScalarHandler());
            return count.intValue();
        }
    }
    // get current page
    public List<Product> findByPage(int currentPage, int currentCount,
                                    String category) throws SQLException {
// query sql statement
        String sql = null;
// parameters
        Object[] obj = null;
// if category is not null,query by category
////----------------AllProducts 2
        if (!"AllProducts".equals(category)) {
            sql = "select * from products where category=? limit ?,?";
            obj = new Object[] { category, (currentPage - 1) * currentCount,
                    currentCount, };
        } else {
            sql = "select * from products limit ?,?";
            obj = new Object[] { (currentPage - 1) * currentCount,
                    currentCount, };
        }
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanListHandler<Product>(Product.class),
                obj);
    }
    // find product by id
    public Product findProductById(String id) throws SQLException {
        String sql = "select * from products where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new BeanHandler<Product>(Product.class), id);
    }
    // decreases the number of product after the order is created
    public void changeProductNum(Order order) throws SQLException {
        String sql = "update products set pnum=pnum-? where id=?";
        QueryRunner runner = new QueryRunner();
        List<OrderItem> items = order.getOrderItems();
        Object[][] params = new Object[items.size()][2];
        for (int i = 0; i < params.length; i++) {
            params[i][0] = items.get(i).getBuynum();
            params[i][1] = items.get(i).getP().getId();
        }
        runner.batch(DataSourceUtils.getConnection(), sql, params);
    }
    // sale list
    public List<Object[]> salesList(String year, String month)
            throws SQLException {
        String sql = "SELECT products.name,SUM(orderitem.buynum) totalsalnum FROM orders,products,orderItem WHERE orders.id=orderItem.order_id AND products.id=orderItem.product_id AND orders.paystate=1 and year(ordertime)=? and month(ordertime)=? GROUP BY products.name ORDER BY totalsalnum DESC";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ArrayListHandler(), year, month);
    }
    //find product
    public List<Product> findProductByManyCondition(String id, String name,
                                                    String category, String minprice, String maxprice)
            throws SQLException {
        List<Object> list = new ArrayList<Object>();
        String sql = "select * from products where 1=1 ";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        if (id != null && id.trim().length() > 0) {
            sql += " and id=?";
            list.add(id);
        }
        if (name != null && name.trim().length() > 0) {
            sql += " and name=?";
            list.add(name);
        }
        if (category != null && category.trim().length() > 0) {
            sql += " and category=?";
            list.add(category);
        }
        if (minprice != null && maxprice != null
                && minprice.trim().length() > 0 && maxprice.trim().length() > 0) {
            sql += " and price between ? and ?";
            list.add(minprice);
            list.add(maxprice);
        }
        Object[] params = list.toArray();
        return runner.query(sql, new BeanListHandler<Product>(Product.class),
                params);
    }
    // change product information
    public void editProduct(Product p) throws SQLException {
        List<Object> obj = new ArrayList<Object>();
        obj.add(p.getName());
        obj.add(p.getPrice());
        obj.add(p.getCategory());
        obj.add(p.getPnum());
        obj.add(p.getDescription());
        String sql = "update products set name=?,price=? ,category=?,pnum=?,description=? ";
        if (p.getImgurl() != null && p.getImgurl().trim().length() > 0) {
            sql += " ,imgurl=?";
            obj.add(p.getImgurl());
        }
        sql += " where id=?";
        obj.add(p.getId());
        System.out.println(sql);
        System.out.println(obj);
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, obj.toArray());
    }
    //updates number of production after the order was deleted
    public void updateProductNum(List<OrderItem> items) throws SQLException {
        String sql = "update products set pnum=pnum+? where id=?";
        QueryRunner runner = new QueryRunner();
        Object[][] params = new Object[items.size()][2];
        for (int i = 0; i < params.length; i++) {
            params[i][0] = items.get(i).getBuynum();
            params[i][1] = items.get(i).getP().getId();
        }
        runner.batch(DataSourceUtils.getConnection(), sql, params);
    }
    //get hot product
    public List<Object[]> getWeekHotProduct() throws SQLException {
        String sql = "SELECT products.id,products.name, "+
                " products.imgurl,SUM(orderitem.buynum) totalsalnum "+
                " FROM orderitem,orders,products "+
                " WHERE orderitem.order_id = orders.id "+
                " AND products.id = orderitem.product_id "+
                " AND orders.paystate=1 "+
                " AND orders.ordertime > DATE_SUB(NOW(), INTERVAL 7 DAY)"+
                " GROUP BY products.id,products.name,products.imgurl "+
                " ORDER BY totalsalnum DESC "+
                " LIMIT 0,2 ";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ArrayListHandler());
    }
    //find book with book name
    public List<Product> findBookByName(int currentPage, int currentCount,
                                        String searchfield) throws SQLException {
//get the book by name
        String sql = "SELECT * FROM products WHERE name LIKE '%"+searchfield+"%' LIMIT ?,?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
// //get data
// Object obj = new Object[] { (currentPage - 1) * currentCount, currentCount };
        return runner.query(sql,
                new BeanListHandler<Product>(Product.class),currentPage-1,currentCount);
    }
    //front end: get number of book
    public int findBookByNameAllCount(String searchfield) throws SQLException {
        String sql = "SELECT COUNT(*) FROM products WHERE name LIKE '%"+searchfield+"%'";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
//get the total number of the book
        Long count = (Long)runner.query(sql, new ScalarHandler());
        return count.intValue();
    }
    //remove the book from db
    public void deleteProduct(String id) throws SQLException {
        String sql = "DELETE FROM products WHERE id = ?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, id);
    }
}
