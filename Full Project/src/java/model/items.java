/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class items {
    
    /*
    SELECT TOP (1000) [item_id]
      ,[item_name]
      ,[description]
      ,[price]
      ,[stock]
      ,[category_id]
      ,[image]
  FROM [PRJ301_Assignment].[dbo].[items]

    */
    
    private String item_id, item_name, description;
    private double price;
    private int stock;
    private categories category;
    private String image;

    public items() {
    }

    public items(String item_id, String item_name, String description, double price, int stock, categories category, String image) {
        this.item_id = item_id;
        this.item_name = item_name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.category = category;
        this.image = image;
    }

    public String getItem_id() {
        return item_id;
    }

    public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public categories getCategory() {
        return category;
    }

    public void setCategory(categories category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "items{" + "item_id=" + item_id + ", item_name=" + item_name + ", description=" + description + ", price=" + price + ", stock=" + stock + "}";
    }
    
    

    
    
    
}
