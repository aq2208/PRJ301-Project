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
import model.users;

/**
 *
 * @author DELL
 */
public class AccountDAO extends DBContext {

    public List<users> getAll() {
        List<users> list = new ArrayList<>();
        String sql = "select * from users";  //code sql để lấy ra toàn bộ giá trị từ table

        //tất cả các lệnh database đều sẽ đẩy ra một try catch
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            //trả về ResultSet
            ResultSet rs = st.executeQuery();  //tạo 1 đối tượng của ResultSet để nhận giá trị trả về từ table
            //trả về nhiều bản ghi nên sẽ dùng vòng while
            while (rs.next()) {
                //tạo 1 đối tượng mới để lưu giá trị trả về 
                users c = new users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void insert(users c) {
        String sql = "INSERT INTO [dbo].[users]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[phone_number]\n"
                + "           ,[isSell]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES(?,?,?,?,?,?,?)";
        
        try {  //cứ thao tác với database thì nên cho vào try catch
            PreparedStatement st = connection.prepareStatement(sql);
            //set giá trị cho 3 dấu hỏi chấm
            st.setString(1, c.getUsername());
            st.setString(2, c.getPassword());
            st.setString(3, c.getEmail());
            st.setString(4, c.getAddress());
            st.setString(5, c.getPhone_number());
            st.setInt(6, c.getIsSell());
            st.setInt(7, c.getIsAdmin());
            //sau đó mới chạy update
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public users getUserById(int id) {
        String sql = "select * from users where user_id=?";  

        //tất cả các lệnh database đều sẽ đẩy ra một try catch
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            //trả về ResultSet, ResultSet sẽ bắt đầu đọc từ đầu tệp cho đến cuối
            ResultSet rs = st.executeQuery();  //tạo 1 đối tượng của ResultSet để nhận giá trị trả về từ table
            //vì ở đây chỉ trả về nhiều nhất 1 bản ghi nên ko cần while, chỉ cần if
            if (rs.next()) {  //khi next sẽ chạy đến bản ghi thứ nhất, và tiếp tục như vậy
                //tạo 1 đối tượng mới để lưu giá trị trả về 
                users c = new users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public void delete(int id) {
        String sql = "delete from users where user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    
    public void update(users c) {
        String sql = "update users set username=?, password=?, email=?, address=?, phone_number=?, isSell=?, isAdmin=? where user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getUsername());
            st.setString(2, c.getPassword());
            st.setString(3, c.getEmail());
            st.setString(4, c.getAddress());
            st.setString(5, c.getPhone_number());
            st.setInt(6, c.getIsSell());
            st.setInt(7, c.getIsAdmin());
            st.setInt(8, c.getUser_id());
            
            st.executeUpdate();
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
}
