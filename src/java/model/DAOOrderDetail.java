/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

/**
 *
 * @author nguye
 */
public class DAOOrderDetail extends DBContext {

    public Vector<OrderDetail> getAllOrder(int oid) {
        Vector<OrderDetail> vector = new Vector<>();
        try {
            String sql = " select * from order_detail where order_id = " + oid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                vector.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vector;
    }
    public static void main(String[] args) {
        DAOOrderDetail dao = new DAOOrderDetail();
        Vector<OrderDetail> vector = dao.getAllOrder(8);
        for (OrderDetail orderDetail : vector) {
            System.out.println(orderDetail);
        }
    }
}
