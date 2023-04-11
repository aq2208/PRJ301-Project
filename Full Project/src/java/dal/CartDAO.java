/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.cart_items_infor;
import model.cart_items;
import model.carts;
import model.items;

/**
 *
 * @author DELL
 */
public class CartDAO extends DBContext {

    public CartDAO() {
    }

    private Connection cnn;
    private PreparedStatement stmt;
    private ResultSet rs;

    //create cart if not exist (create cart with the cart_id equal to user_id)
    public void createCartIfNotExist(int user_id) {
        String sql = "select * from carts where user_id=?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, user_id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                //the user is already have a cart
                //no need to create new one
                return;
            } else {
                //user does not have any cart
                //create new one
                PreparedStatement st = connection.prepareStatement("insert into carts(user_id) values (?)");
                st.setInt(1, user_id);
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    //get the cart_id for the current user
    public int getCartId(int user_id) {
        int cartId = -1;
        String sql = "select cart_id from carts where user_id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, user_id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                cartId = rs.getInt("cart_id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return cartId;
    }

    //get list of cart_items in the user's shopping cart
    //get cart_items by cart_id
    public List<cart_items_infor> getCartItems(int user_id) {
        List<cart_items_infor> list = new ArrayList<>();
        String sql = "select * from cart_items where cart_id=?";

        DAO d = new DAO();

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, getCartId(user_id));
            rs = stmt.executeQuery();

            while (rs.next()) {
                cart_items_infor c = new cart_items_infor();
                c.setCart_id(rs.getInt(2));
                c.setItem(d.getItemById(rs.getString(3)));
                c.setQuantity(rs.getInt(4));
                c.setPrice(rs.getDouble(5));

                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    //add an item to cart
    public void addItemToCart(int user_id, String item_id, int num) {

        DAO d = new DAO();
        items p = d.getItemById(item_id);

        //check if the item is already in cart or not
        try {
            PreparedStatement check = connection.prepareStatement("select * from cart_items where cart_id=? and item_id=?");
            check.setInt(1, getCartId(user_id));
            check.setString(2, item_id);
            ResultSet checkResult = check.executeQuery();

            //the item is already in the cart, so update the quantity
            if (checkResult.next()) {
                int existingQuantity = checkResult.getInt("quantity");
                int newQuantity = existingQuantity + num;
                PreparedStatement update = connection.prepareStatement("update cart_items set quantity=? where cart_id=? and item_id=?");
                update.setInt(1, newQuantity);
                update.setInt(2, getCartId(user_id));
                update.setString(3, item_id);
                update.executeUpdate();
            } //the item is not in the cart, so add it to the cart
            else {
                PreparedStatement add = connection.prepareStatement("insert into cart_items(cart_id, item_id, quantity, price) values(?,?,?,?)");
                add.setInt(1, getCartId(user_id));
                add.setString(2, item_id);
                add.setInt(3, num);
                add.setDouble(4, p.getPrice());
                add.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //remove an item from the cart
    public void removeItem(int user_id, String item_id) {

        DAO d = new DAO();
        items p = d.getItemById(item_id);

        try {

            PreparedStatement del = connection.prepareStatement("delete from cart_items where cart_id=? and item_id=?");
            del.setInt(1, getCartId(user_id));
            del.setString(2, item_id);
            del.executeUpdate();
            return;

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    //get the quantity of an item in the cart
    public int getItemQuantity(int user_id, String item_id) {
        int quantity=0;
        DAO d = new DAO();
        items p = d.getItemById(item_id);
        
        try {
            PreparedStatement st = connection.prepareStatement("select quantity from cart_items where cart_id=? and item_id=?");
            st.setInt(1, getCartId(user_id));
            st.setString(2, item_id);
            ResultSet rs = st.executeQuery();
            
            if(rs.next()) {
                quantity = rs.getInt(1);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return quantity;
    }
    
    public int getCartSize(int user_id) {
        int size=0;
        String sql = "select count(*) from cart_items where cart_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, getCartId(user_id));
            ResultSet rs = st.executeQuery();
            
            if(rs.next()) {
                size = rs.getInt(1);
            }
        }catch(SQLException e) {
            System.out.println(e);
        }
        
        return size;
    }
    
    //get total price of user's cart
    public int getTotalPrice(int user_id) {
        int total=0;

        try {
            PreparedStatement st = connection.prepareStatement("select (quantity*price) from cart_items where cart_id=?");
            st.setInt(1, getCartId(user_id));
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                total += (rs.getDouble(1)/23740);
            }
        }catch(SQLException e){
            System.out.println(e);
        }
            
        return Math.round(total);
    }
    
    public void deleteAll(int user_id) {
        String sql = "delete from cart_items where cart_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, getCartId(user_id));
            st.executeUpdate();
        }catch(SQLException e) {
            System.out.println(e);
        }
    }
    

    
}
