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
import model.items;

/**
 *
 * @author DELL
 */
public class ItemDAO extends DBContext {

    public List<items> getAll() {
        List<items> list = new ArrayList<>();
        String sql = "select * from items";  //code sql để lấy ra toàn bộ giá trị từ table
        DAO d = new DAO();
        //tất cả các lệnh database đều sẽ đẩy ra một try catch
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            //trả về ResultSet
            ResultSet rs = st.executeQuery();  //tạo 1 đối tượng của ResultSet để nhận giá trị trả về từ table
            //trả về nhiều bản ghi nên sẽ dùng vòng while
            while (rs.next()) {
                //tạo 1 đối tượng mới để lưu giá trị trả về 
                items c = new items(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), d.getCategoryById(rs.getInt(6)), rs.getString(7));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void insert(items c) {
        String sql = "INSERT INTO [dbo].[items]\n"
                + "           ([item_id]\n"
                + "           ,[item_name]\n"
                + "           ,[description]\n"
                + "           ,[price]\n"
                + "           ,[stock]\n"
                + "           ,[category_id]\n"
                + "           ,[image])\n"
                + "     VALUES(?,?,?,?,?,?,?)";

        try {  //cứ thao tác với database thì nên cho vào try catch
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getItem_id());
            st.setString(2, c.getItem_name());
            st.setString(3, c.getDescription());
            st.setDouble(4, c.getPrice());
            st.setInt(5, c.getStock());
            st.setInt(6, c.getCategory().getCategory_id());
            st.setString(7, c.getImage());
            //sau đó mới chạy update
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public items getItemById(String item_id) {
        String sql = "select * from items where item_id=?";  
        DAO d = new DAO();

        //tất cả các lệnh database đều sẽ đẩy ra một try catch
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, item_id);
            //trả về ResultSet, ResultSet sẽ bắt đầu đọc từ đầu tệp cho đến cuối
            ResultSet rs = st.executeQuery();  //tạo 1 đối tượng của ResultSet để nhận giá trị trả về từ table
            //vì ở đây chỉ trả về nhiều nhất 1 bản ghi nên ko cần while, chỉ cần if
            if (rs.next()) {  //khi next sẽ chạy đến bản ghi thứ nhất, và tiếp tục như vậy
                //tạo 1 đối tượng mới để lưu giá trị trả về 
                items c = new items(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), d.getCategoryById(rs.getInt(6)), rs.getString(7));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public void delete(String item_id) {
        String sql = "delete from items where item_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, item_id);
            st.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    
    public void update(items c, String item_id) {
        String sql = "update items set item_id=?, item_name=?, description=?, price=?, stock=?, category_id=?, image=? where item_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getItem_id());
            st.setString(2, c.getItem_name());
            st.setString(3, c.getDescription());
            st.setDouble(4, c.getPrice());
            st.setInt(5, c.getStock());
            st.setInt(6, c.getCategory().getCategory_id());
            st.setString(7, c.getImage());
            st.setString(8, item_id);
            
            st.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateStock(items c, int quantity) {
        String sql = "update items set stock=? where item_id=?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (c.getStock() - quantity));
            st.setString(2, c.getItem_id());
            
            st.executeUpdate();
        }catch(SQLException e) {
            System.out.println(e);
        }
    }
}
