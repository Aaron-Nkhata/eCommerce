package service;

import java.sql.SQLException;
import java.util.List;

import dao.OrderDao;
import dao.OrderItemDao;
import dao.ProductDao;
import domain.Order;
import domain.OrderItem;
import domain.User;
import utils.DataSourceUtils;

public class OrderService {
	
	private OrderItemDao oidao = new OrderItemDao();
    private OrderDao odao = new OrderDao();
    private ProductDao pdao = new ProductDao();
    // 1.add order
    public void addOrder(Order order) {
        try {
        	// 1.start a transaction
            DataSourceUtils.startTransaction();
            // 2.complete job
            // 2.1 insert into orders table
            odao.addProduct(order);
            // 2.2insert into orderItem table
            oidao.addOrderItem(order);
            // 2.3 update the number of the book
            pdao.changeProductNum(order);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback(); // roll back transaction
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
            	// release the resource
                DataSourceUtils.releaseAndCloseConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    // find order
    public List<Order> findOrderByUser(User user) {
        List<Order> orders = null;
        try {
            orders = odao.findOrderByUser(user);
            // for (Order order : orders) {
            // List<OrderItem> items = oidao.findOrderItemByOrder(order);
            // order.setOrderItems(items);
            // }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    //
    public Order findOrderById(String id) {
        Order order = null;
        try {
            order = odao.findOrderById(id);
            List<OrderItem> items = oidao.findOrderItemByOrder(order);
            order.setOrderItems(items);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
    public List<Order> findAllOrder() {
        List<Order> orders = null;
        try {
            orders = odao.findAllOrder();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    public void updateState(String id) {
        try {
            odao.updateOrderState(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Order> findOrderByManyCondition(String id, String receiverName) {
        List<Order> orders = null;
        try {
            orders = odao.findOrderByManyCondition(id, receiverName);
        } catch (SQLException e) {
        	// TODO Auto-generated catch block
            e.printStackTrace();
        }
        return orders;
    }
    public void delOrderById(String id) {
        try {
            DataSourceUtils.startTransaction();
            oidao.delOrderItems(id);
            odao.delOrderById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }finally{
            try {
                DataSourceUtils.releaseAndCloseConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public void delOrderByIdWithClient(String id) {
        try {
            DataSourceUtils.startTransaction();
            Order order=new Order();
            order.setId(id);
            List<OrderItem> items=oidao.findOrderItemByOrder(order);
            pdao.updateProductNum(items);
            oidao.delOrderItems(id);
            odao.delOrderById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }finally{
            try {
                DataSourceUtils.releaseAndCloseConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
