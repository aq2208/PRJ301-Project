/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class categories {
    /*SELECT TOP (1000) [category_id]
      ,[category_name]
      ,[category_describe]
  FROM [PRJ301_Assignment].[dbo].[categories]*/
    
    private int category_id;
    private String category_name, category_describe;

    public categories() {
    }

    public categories(int category_id, String category_name, String category_describe) {
        this.category_id = category_id;
        this.category_name = category_name;
        this.category_describe = category_describe;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getCategory_describe() {
        return category_describe;
    }

    public void setCategory_describe(String category_describe) {
        this.category_describe = category_describe;
    }
    
    
}
