/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class cart_items {
    private int cart_item_id;
    private carts cart;
    private items item;
    private int quantity;
    private double price;

    public cart_items() {
    }

    public cart_items(int cart_item_id, carts cart, items item, int quantity, double price) {
        this.cart_item_id = cart_item_id;
        this.cart = cart;
        this.item = item;
        this.quantity = quantity;
        this.price = price;
    }

    public int getCart_item_id() {
        return cart_item_id;
    }

    public void setCart_item_id(int cart_item_id) {
        this.cart_item_id = cart_item_id;
    }

    public carts getCart() {
        return cart;
    }

    public void setCart(carts cart) {
        this.cart = cart;
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

    @Override
    public String toString() {
        return "cart_items{" + "cart_item_id=" + cart_item_id + ", cart=" + cart + ", item=" + item + ", quantity=" + quantity + ", price=" + price + '}';
    }
    
    
    
}
