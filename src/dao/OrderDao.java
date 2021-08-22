package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import domain.Order;
import domain.User;
import utils.DataSourceUtils;

public class OrderDao {
	 // create order
    public void addProduct(Order order) throws SQLException {
    	// 1.generate sql statement
        String sql = "insert into orders values(?,?,?,?,?,0,null,?)";
        // 2.generate the query runner
        QueryRunner runner = new QueryRunner();
        runner.update(DataSourceUtils.getConnection(), sql, order.getId(),order.getMoney(), order.getReceiverAddress(), order.getReceiverName(), order.getReceiverPhone(), order.getUser().getId());
    }
    public List<Order> findOrderByUser(final User user) throws SQLException {
        String sql = "select * from orders where user_id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ResultSetHandler<List<Order>>() {
            public List<Order> handle(ResultSet rs) throws SQLException {
                List<Order> orders = new ArrayList<Order>();
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getString("id"));
                    order.setMoney(rs.getDouble("money"));
                    order.setOrdertime(rs.getDate("ordertime"));
                    order.setPaystate(rs.getInt("paystate"));
                    order.setReceiverAddress(rs.getString("receiverAddress"));
                    order.setReceiverName(rs.getString("receiverName"));
                    order.setReceiverPhone(rs.getString("receiverPhone"));
                    order.setUser(user);
                    orders.add(order);
                }
                return orders;
            }
        }, user.getId());
    }
    // search order by id
    public Order findOrderById(String id) throws SQLException {
        String sql = "select * from orders,user where orders.user_id=user.id and orders.id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ResultSetHandler<Order>() {
            public Order handle(ResultSet rs) throws SQLException {
                Order order = new Order();
                while (rs.next()) {
                    order.setId(rs.getString("orders.id"));
                    order.setMoney(rs.getDouble("orders.money"));
                    order.setOrdertime(rs.getDate("orders.ordertime"));
                    order.setPaystate(rs.getInt("orders.paystate"));
                    order.setReceiverAddress(rs.getString("orders.receiverAddress"));
                    order.setReceiverName(rs.getString("orders.receiverName"));
                    order.setReceiverPhone(rs.getString("orders.receiverPhone"));
                    User user = new User();
                    user.setId(rs.getInt("user.id"));
                    user.setEmail(rs.getString("user.email"));
                    user.setGender(rs.getString("user.gender"));
                    user.setActiveCode(rs.getString("user.activecode"));
                    user.setIntroduce(rs.getString("user.introduce"));
                    user.setPassword(rs.getString("user.password"));
                    user.setRegistTime(rs.getDate("user.registtime"));
                    user.setRole(rs.getString("user.role"));
                    user.setState(rs.getInt("user.state"));
                    user.setTelephone(rs.getString("user.telephone"));
                    user.setUsername(rs.getString("user.username"));
                    order.setUser(user);
                }
                return order;
            }
        }, id);
    }
    // query all order
    public List<Order> findAllOrder() throws SQLException {
        String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id orderby orders.user_id";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ResultSetHandler<List<Order>>() {
            public List<Order> handle(ResultSet rs) throws SQLException {
                List<Order> orders = new ArrayList<Order>();
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getString("orders.id"));
                    order.setMoney(rs.getDouble("orders.money"));
                    order.setOrdertime(rs.getDate("orders.ordertime"));
                    order.setPaystate(rs.getInt("orders.paystate"));
                    order.setReceiverAddress(rs.getString("orders.receiverAddress"));
                    order.setReceiverName(rs.getString("orders.receiverName"));
                    order.setReceiverPhone(rs.getString("orders.receiverPhone"));
                    orders.add(order);
                    User user = new User();
                    user.setId(rs.getInt("user.id"));
                    user.setEmail(rs.getString("user.email"));
                    user.setGender(rs.getString("user.gender"));
                    user.setActiveCode(rs.getString("user.activecode"));
                    user.setIntroduce(rs.getString("user.introduce"));
                    user.setPassword(rs.getString("user.password"));
                    user.setRegistTime(rs.getDate("user.registtime"));
                    user.setRole(rs.getString("user.role"));
                    user.setState(rs.getInt("user.state"));
                    user.setTelephone(rs.getString("user.telephone"));
                    user.setUsername(rs.getString("user.username"));
                    order.setUser(user);
                }
                return orders;
            }
        });
    }
    // update order status
    public void updateOrderState(String id) throws SQLException {
        String sql = "update orders set paystate=1 where id=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        runner.update(sql, id);
    }
    // find order
    public List<Order> findOrderByManyCondition(String id, String receiverName)
            throws SQLException {
        List<Object> objs = new ArrayList<Object>();
        String sql = "select orders.*,user.* from orders,user where user.id=orders.user_id ";
        if (id != null && id.trim().length() > 0) {
            sql += " and orders.id=?";
            objs.add(id);
        }
        if (receiverName != null && receiverName.trim().length() > 0) {
            sql += " and receiverName=?";
            objs.add(receiverName);
        }
        sql += " order by orders.user_id";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql, new ResultSetHandler<List<Order>>() {
            public List<Order> handle(ResultSet rs) throws SQLException {
                List<Order> orders = new ArrayList<Order>();
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getString("orders.id"));
                    order.setMoney(rs.getDouble("orders.money"));
                    order.setOrdertime(rs.getDate("orders.ordertime"));
                    order.setPaystate(rs.getInt("orders.paystate"));
                    order.setReceiverAddress(rs
                            .getString("orders.receiverAddress"));
                    order.setReceiverName(rs.getString("orders.receiverName"));
                    order.setReceiverPhone(rs.getString("orders.receiverPhone"));
                    orders.add(order);
                    User user = new User();
                    user.setId(rs.getInt("user.id"));
                    user.setEmail(rs.getString("user.email"));
                    user.setGender(rs.getString("user.gender"));
                    user.setActiveCode(rs.getString("user.activecode"));
                    user.setIntroduce(rs.getString("user.introduce"));
                    user.setPassword(rs.getString("user.password"));
                    user.setRegistTime(rs.getDate("user.registtime"));
                    user.setRole(rs.getString("user.role"));
                    user.setState(rs.getInt("user.state"));
                    user.setTelephone(rs.getString("user.telephone"));
                    user.setUsername(rs.getString("user.username"));
                    order.setUser(user);
                }
                return orders;
            }
        }, objs.toArray());
    }
    //delete order by id
    public void delOrderById(String id) throws SQLException {
        String sql="delete from orders where id=?";
        QueryRunner runner = new QueryRunner();
        runner.update(DataSourceUtils.getConnection(),sql,id);
    }

}
