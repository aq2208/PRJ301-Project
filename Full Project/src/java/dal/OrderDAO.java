/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderHistory;
import model.cart_items_infor;
import model.items;

/**
 *
 * @author DELL
 */
public class OrderDAO extends DBContext {

    public OrderDAO() {
    }
    
    //add a new order (purchase)
    public int addOrder(int user_id) {
        LocalDateTime current = LocalDateTime.now();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        String date = dtf.format(current).toString();
        CartDAO d = new CartDAO();
        int n;
        
        String sql = "insert into [Order](user_id, time, totalprice) values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setString(2, date);
            st.setDouble(3, (double)d.getTotalPrice(user_id));
            n = st.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
            n=0;
        }
        
        return n;
        
    }
    
    public int addOrderHistory(int order_id, int user_id) {
        CartDAO d = new CartDAO();
        List<cart_items_infor> list = d.getCartItems(user_id);       
        int count=0;
        int n;
        for(cart_items_infor i : list) {
            n = addEachOrderHistory(i, order_id);
            if(n>0) {
                count++;
            }
        }
        if(count==list.size()) {
            return 1;
        } else {
            return 0;
        }
    }
    
    public int addEachOrderHistory(cart_items_infor c, int order_id) {
        String sql = "insert into OrderHistory(order_id, item_id, quantity, price) values(?,?,?,?)";
        int n;
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order_id);
            st.setString(2, c.getItem().getItem_id());
            st.setInt(3, c.getQuantity());
            st.setDouble(4, c.getPrice());
            
            n = st.executeUpdate();
        }catch(SQLException e) {
            System.out.println(e);
            n=0;
        }
        return n;
    }
    
    public List<Order> getAllOrder() {
        List<Order> orders = new ArrayList<>();
        String sql="select * from [Order] order by order_id asc";
        DAO d = new DAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                orders.add(new Order(rs.getInt(1), d.getUserById(rs.getInt(2)), rs.getString(3), rs.getDouble(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
    public List<Order> getOrderByCart(int user_id) {
        List<Order> orders = new ArrayList<>();
        String sql="select * from [Order] where user_id=? order by order_id asc";
        DAO d = new DAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                orders.add(new Order(rs.getInt(1), d.getUserById(rs.getInt(2)), rs.getString(3), rs.getDouble(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
    public List<OrderHistory> getAllOrderHistoryByOrderId(int order_id) {
        List<OrderHistory> orders = new ArrayList<>();
        String sql="select * from OrderHistory where order_id=?";
        DAO d = new DAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order_id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                OrderHistory o = new OrderHistory(rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getDouble(5));
                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    

}
