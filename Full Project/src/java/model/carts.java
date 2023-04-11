/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class carts {
    private int cart_id;
    private users user;
    private double total_price;
    private List<cart_items> items;

    public carts() {
        items = new ArrayList<>();
    }

    public carts(int cart_id, users user, double total_price, List<cart_items> items) {
        this.cart_id = cart_id;
        this.user = user;
        this.total_price = total_price;
        this.items = items;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public users getUser() {
        return user;
    }

    public void setUser(users user) {
        this.user = user;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public List<cart_items> getItems() {
        return items;
    }

    public void setItems(List<cart_items> items) {
        this.items = items;
    }
    
    
    
    //lấy ra sản phẩm đã có trong giỏ bằng id của sản phẩm đó
    //check xem sản phẩm có trong giỏ hàng hay chưa
    public cart_items getCartItemById(String item_id) {
        for(cart_items i : items) {
            if(i.getItem().getItem_id().equals(item_id)) {
                return i;
            }
        }
        
        return null;
    }
    
    //lấy ra số lượng của một sản phẩm trong giỏ hàng
    public int getQuantityById(String item_id) {
        return getCartItemById(item_id).getQuantity();
    }
    
    //thêm sản phẩm vào giỏ hàng (san pham t)
    public void addItem(cart_items t) {
        //check xem san pham da co trong gio hang chua
        //co roi
        if(getCartItemById(t.getItem().getItem_id()) != null) {
            //lay san pham do trong gio hang ra 
            cart_items i = getCartItemById(t.getItem().getItem_id());
            //update lai quantity
            i.setQuantity(i.getQuantity()+t.getQuantity());
        } else {
            //chua co
            //them no vao list
            items.add(t);
        }
    }
    
    //xoa san pham khoi gio hang
    public void removeItem(String item_id) {
        if(getCartItemById(item_id) != null) {
            items.remove(getCartItemById(item_id));
        }
    }
    
    //tinh tong tien trong gio hang
    public double getTotalPrice() {
        double t=0;
        for(cart_items i:items) {
            t += i.getQuantity()*i.getPrice();
        }
        return t;
    }


    
    
}
