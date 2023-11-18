/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.SendMail;

/**
 *
 * @author nguye
 */
public class DAOUser extends DBContext {

    public User login(String username, String pass) {
        String sql = "  select * from [User] where username = ? and [password] = ? and is_active = 1 ";
        try {

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setFirst_name(rs.getString(4));
                u.setLast_name(rs.getString(5));
                u.setEmail(rs.getString(6));
                u.setPhone(rs.getString(7));
                u.setRole(rs.getString(8));
                u.setAddress(rs.getString(9));
                return u;
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;
    }

    public boolean checkUserExist(String username) {
        String sql = "  select * from [user] where username = ?";
        boolean userExists = false;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                userExists = true;
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return userExists;
    }

    public boolean registerUser(String username, String pass, String email, String phone) {
        try {
            String sql = " insert into [user] ([username] ,[password] ,[email] ,[phone], [is_active]) values (?,?,?,?,0) ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, pass);
            stm.setString(3, email);
            stm.setString(4, phone);

            //goi cau lenh execute
            stm.executeUpdate();
            SendMail.send(email, "Verify new user!", "<h2>Welcome to my system</<h2>"
                    + "<a href=\"http://localhost:9999/MyProject/verify-account?email="
                    + email + " \" > Click here to verify your account!</a>");
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean activeAccount(String email) {
        try {
            String sql = " update [user] set [is_active] = 1 where [email] = ? ";
            PreparedStatement pm = connection.prepareStatement(sql);
            pm.setString(1, email);
            pm.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(String uid, String fname, String lname, String email, String phone, String address, String pass) {
        try {
            String sql = "  update [user] set [first_name] = ? , [last_name] = ?, [email] = ?, [phone] = ?, [address] = ?, [password] = ?\n"
                    + "  where user_id = ? ";
            PreparedStatement pm = connection.prepareStatement(sql);

            pm.setString(1, fname);
            pm.setString(2, lname);
            pm.setString(3, email);
            pm.setString(4, phone);
            pm.setString(5, address);
            pm.setString(6, pass);
            pm.setString(7, uid);

            pm.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getDetail(String uid) {
        String sql = "  SELECT * FROM [user] where [user_id] = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, uid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setFirst_name(rs.getString(4));
                u.setLast_name(rs.getString(5));
                u.setEmail(rs.getString(6));
                u.setPhone(rs.getString(7));
                u.setRole(rs.getString(8));
                u.setAddress(rs.getString(9));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void forgetPassword(String email) {
        try {
            String sql = " update [user] set password = 123 where email = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);

            //goi cau lenh execute
            stm.executeUpdate();
            SendMail.send(email, "Reset password!", "Your new password is 123");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean checkEmailExist(String email) {
        String sql = "  select * from [user] where email = ?";
        boolean emailExists = false;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                emailExists = true;
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return emailExists;
    }

    public Vector<User> getUserByUsername(String username) {
        if (username == null) {
            username = "";
        }
        Vector<User> vector = new Vector<User>();
        String sql = "  select * from [user] where [username] like " + "'%" + username + "%'";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setFirst_name(rs.getString(4));
                u.setLast_name(rs.getString(5));
                u.setEmail(rs.getString(6));
                u.setPhone(rs.getString(7));
                u.setRole(rs.getString(8));
                u.setAddress(rs.getString(9));
                u.setIsActive(rs.getBoolean(10));
                vector.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public boolean deleteUser(int uid) {
        String sql = " delete [user] where [user_id] = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean setActive(int uid, int active) {
        try {
            String sql = " update [user] set [is_active] = ? where [user_id] = ? ";
            PreparedStatement pm = connection.prepareStatement(sql);
            pm.setInt(1, active);
            pm.setInt(2, uid);
            pm.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean setRole(int uid, String role) {
        try {
            String sql = " update [user] set [role] = ? where [user_id] = ? ";
            PreparedStatement pm = connection.prepareStatement(sql);
            pm.setString(1, role);
            pm.setInt(2, uid);
            pm.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public User getUserById(int uid) {
        String sql = "  select * from [user] where [user_id] = " + uid;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setFirst_name(rs.getString(4));
                u.setLast_name(rs.getString(5));
                u.setEmail(rs.getString(6));
                u.setPhone(rs.getString(7));
                u.setRole(rs.getString(8));
                u.setAddress(rs.getString(9));
                u.setIsActive(rs.getBoolean(10));
                return u;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return null;
    }
    
}
