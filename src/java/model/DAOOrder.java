/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Cart;
import entity.CartItems;
import entity.Order;
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nguye
 */
public class DAOOrder extends DBContext {

    public void insertOrder(User user, Cart cart) {
        try {
            //insert dữ liệu vào bảng order
            String sql1 = " insert into [order] ([user_id],[order_date] ,[total] ,[status]) values (?,getdate(),?,'pending') ";
            PreparedStatement stm = connection.prepareStatement(sql1);
            stm.setInt(1, user.getUser_id());
            stm.setFloat(2, cart.getTotalMoney());
            stm.executeUpdate();
            //lấy order_id của order vừa mới insert
            String sql2 = " select top 1 order_id from [order] order by order_id desc ";
            stm = connection.prepareStatement(sql2);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (CartItems listItem : cart.getItems()) {
                    //insert dữ liệu vào order detail với order_id đã lấy ở trên
                    String sql3 = " insert into [order_detail] ([order_id],[product_id],[quantity]) values (?,?,?) ";
                    stm = connection.prepareStatement(sql3);
                    stm.setInt(1, oid);
                    stm.setInt(2, listItem.getProduct().getProduct_id());
                    stm.setInt(3, listItem.getQuantity());
                    stm.executeUpdate();
                }
            }
            String sql4 = " update [product] set quantity = quantity - ? where product_id = ? ";
            stm = connection.prepareStatement(sql4);
            for (CartItems listItem : cart.getItems()) {
                stm.setInt(1, listItem.getQuantity());
                stm.setInt(2, listItem.getProduct().getProduct_id());
                stm.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Order> getAllOrderById(int uid) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = " select * from [order] where user_id = " + uid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5)));
            }
            System.out.println(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Order getOrderByOrderId(int oid) {
        try {
            String sql = "  select * from [order] where order_id =  " + oid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Order ord = new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5));
                return ord;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public Vector<Order> getAllOrder() {
        Vector<Order> vector = new Vector<>();
        try {
            String sql = " select * from [order] ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                vector.add(new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getString(5)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vector;
    }
    
    public boolean updateOrder(int oid, String status) {
        String sql = "  update [order] set status = " + "'" + status + "'" + " where order_id = " + oid;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            System.out.println(sql);
            return true;
            
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
}
