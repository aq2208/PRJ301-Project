/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.categories;
import model.items;
import model.users;

/**
 *
 * @author DELL
 */
public class DAO extends DBContext {
    
    public List<items> getListItems() {
        List<items> list = new ArrayList<>();
        String sql = "select * from items";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery(); 
            while (rs.next()) {
                items i = new items();
                i.setItem_id(rs.getString(1));
                i.setItem_name(rs.getString(2));
                i.setDescription(rs.getString(3));
                i.setPrice(rs.getDouble(4));
                i.setStock(rs.getInt(5));
                categories c = getCategoryById(rs.getInt(6));
                i.setCategory(c);
                i.setImage(rs.getString(7));
                
                list.add(i);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public List<items> getListItemsAscending() {
        List<items> list = new ArrayList<>();
        String sql = "select * from items order by price asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery(); 
            while (rs.next()) {
                items i = new items();
                i.setItem_id(rs.getString(1));
                i.setItem_name(rs.getString(2));
                i.setDescription(rs.getString(3));
                i.setPrice(rs.getDouble(4));
                i.setStock(rs.getInt(5));
                categories c = getCategoryById(rs.getInt(6));
                i.setCategory(c);
                i.setImage(rs.getString(7));
                
                list.add(i);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public List<items> getListItemsDescending() {
        List<items> list = new ArrayList<>();
        String sql = "select * from items order by price desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery(); 
            while (rs.next()) {
                items i = new items();
                i.setItem_id(rs.getString(1));
                i.setItem_name(rs.getString(2));
                i.setDescription(rs.getString(3));
                i.setPrice(rs.getDouble(4));
                i.setStock(rs.getInt(5));
                categories c = getCategoryById(rs.getInt(6));
                i.setCategory(c);
                i.setImage(rs.getString(7));
                
                list.add(i);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    
    
    public categories getCategoryById(int id) {
        String sql = "select * from categories where category_id=?";  

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();  //tạo 1 đối tượng của ResultSet để nhận giá trị trả về từ table
            //vì ở đây chỉ trả về nhiều nhất 1 bản ghi nên ko cần while, chỉ cần if
            if (rs.next()) {  //khi next sẽ chạy đến bản ghi thứ nhất, và tiếp tục như vậy
                //tạo 1 đối tượng mới để lưu giá trị trả về 
                categories c = new categories(rs.getInt("category_id"), rs.getString("category_name"), rs.getString("category_describe"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public List<categories> getListCategories() {
        List<categories> list = new ArrayList<>();
        String sql = "select * from categories"; 

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery(); 
            while (rs.next()) {
                categories c = new categories(rs.getInt("category_id"), rs.getString("category_name"), rs.getString("category_describe"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public List<items> getItemsByCid(int cid) {
        List<items> list = new ArrayList<>();
        String sql = "select * from items where 1=1 ";
        if(cid!=0) {
            sql += " and category_id=" +cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //st.setInt(1, cid);
            //lệnh SELECT nên sẽ trả về 1 ResultSet
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                //tạo 1 đối tượng bằng constructor ko tham số sau đó dùng setter để set giá trị cho từng thuộc tính của đối tượng đó
                items i = new items();
                i.setItem_id(rs.getString(1));
                i.setItem_name(rs.getString(2));
                i.setDescription(rs.getString(3));
                i.setPrice(rs.getDouble(4));
                i.setStock(rs.getInt(5));
                categories c = getCategoryById(rs.getInt(6));
                i.setCategory(c);
                i.setImage(rs.getString(7));
                
                //khi đối tượng p của Products đã có đủ các thuộc tính như trong model, add nó vào list
                list.add(i);  
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }

    public items getItemById(String item_id) {
        
        String sql = "select * from items where item_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, item_id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                items i = new items();
                
                i.setItem_id(rs.getString(1));
                i.setItem_name(rs.getString(2));
                i.setDescription(rs.getString(3));
                i.setPrice(rs.getDouble(4));
                i.setStock(rs.getInt(5));
                categories c = getCategoryById(rs.getInt(6));
                i.setCategory(c);
                i.setImage(rs.getString(7));
                
                return i;
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }
    
    public users getUserById(int user_id) {
        users i = new users();
        String sql = "select * from users where user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                i.setUser_id(rs.getInt(1));
                i.setUsername(rs.getString(2));
                i.setPassword(rs.getString(3));
                i.setEmail(rs.getString(4));
                i.setAddress(rs.getString(5));
                i.setPhone_number(rs.getString(6));
                i.setIsSell(rs.getInt(7));
                i.setIsAdmin(rs.getInt(8));
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return i;
    }
    
    public List<items> getItemsByName(String search) {
        List<items> list = new ArrayList<>();
        String sql = "select * from items where item_name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%"+search+"%");
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                items i = new items();
                i.setItem_id(rs.getString(1));
                i.setItem_name(rs.getString(2));
                i.setDescription(rs.getString(3));
                i.setPrice(rs.getDouble(4));
                i.setStock(rs.getInt(5));
                categories c = getCategoryById(rs.getInt(6));
                i.setCategory(c);
                i.setImage(rs.getString(7));
                
                list.add(i);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public users login(String user, String pass) {
        String sql = "select * from users where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery(); 
            while (rs.next()) {
                users i = new users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
                return i;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }
    
    //check if username exist
    public users checkAccountExist(String user) {
        String sql = "select * from users where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);

            ResultSet rs = st.executeQuery(); 
            if (rs.next()) {
                users i = new users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
                return i;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }
    
    //sign up
    public void addUsers(String user, String pass, String email, String address, String phone) {
        String sql = "insert into users(username, [password], email, [address], phone_number, isSell, isAdmin) values(?, ?, ?, ?, ?, 0, 0)";
        try {
            PreparedStatement insert = connection.prepareStatement(sql);
            insert.setString(1, user);
            insert.setString(2, pass);
            insert.setString(3, email);
            insert.setString(4, address);
            insert.setString(5, phone);
            
            insert.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    

}
