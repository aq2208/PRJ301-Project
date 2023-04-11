/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class cart_items_infor {
    private int cart_id;
    private items item;
    private int quantity;
    private double price;
    

    public cart_items_infor() {
    }

    public cart_items_infor(int cart_id, items item, int quantity, double price) {
        this.cart_id = cart_id;
        this.item = item;
        this.quantity = quantity;
        this.price = price;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public items getItem() {
        return item;
    }

    public void setItem(items item) {
        this.item = item;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    
}
