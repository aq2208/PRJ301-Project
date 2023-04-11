/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Order {
    private int order_id;
    private users user;
    private String time;
    private double totalprice;

    public Order() {
    }

    public Order(users user, String time, double totalprice) {
        this.user = user;
        this.time = time;
        this.totalprice = totalprice;
    }

    public Order(int order_id, users user, String time, double totalprice) {
        this.order_id = order_id;
        this.user = user;
        this.time = time;
        this.totalprice = totalprice;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }
    
    

    public users getUser() {
        return user;
    }

    public void setUser(users user) {
        this.user = user;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }
    
    
}
