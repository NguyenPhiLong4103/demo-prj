/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Category;
import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nguye
 */
public class DAOProduct extends DBContext {

    public Vector<Product> getAllProduct() {
        Vector<Product> vector = new Vector<Product>();
        String sql = "  select * from product p join category c on p.category_id = c.category_id";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProduct_id(rs.getInt(1));
                pro.setProduct_name(rs.getString(2));
                pro.setPrice(rs.getString(4));
                pro.setImage(rs.getString(5));
                pro.setDescription(rs.getString(6));
                pro.setQuantity(rs.getInt(7));
                pro.setCategory(new Category(rs.getInt(8), rs.getString(9)));
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public boolean addProduct(String pname, int cateId, String price, String image, String description, int quantity) {
        String sql = " insert into [product] ([product_name],[category_id],[price],[image],[description],[quantity])\n"
                + "values (?,?,?,?,?,?) ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, pname);
            stm.setInt(2, cateId);
            stm.setString(3, price);
            stm.setString(4, image);
            stm.setString(5, description);
            stm.setInt(6, quantity);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean updateProduct(int pid, String pname, int cateId, String price, String image, String description, int quantity) {
        String sql = " update [product] set [product_name] = ?, [category_id] = ?, [price] = ?, [image] = ?, [description] = ?, [quantity] = ?\n"
                + "where [product_id] = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pname);
            stm.setInt(2, cateId);
            stm.setString(3, price);
            stm.setString(4, image);
            stm.setString(5, description);
            stm.setInt(6, quantity);
            stm.setInt(7, pid);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean deleteProduct(int pid) {
        String sql = " delete [product] where product_id = ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public Vector<Product> getRelatedProduct(int category_id) {
        Vector<Product> vector = new Vector<Product>();
        String sql = " select top(4) * from product where category_id = ? order by product_id desc ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, category_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProduct_id(rs.getInt(1));
                pro.setProduct_name(rs.getString(2));
                pro.setPrice(rs.getString(4));
                pro.setImage(rs.getString(5));
                pro.setDescription(rs.getString(6));
                pro.setQuantity(rs.getInt(7));
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Product> getNewProduct(int category_id) {
        Vector<Product> vector = new Vector<Product>();
        String sql = " select top(5) * from product where category_id = ? order by product_id desc ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, category_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProduct_id(rs.getInt(1));
                pro.setProduct_name(rs.getString(2));
                pro.setPrice(rs.getString(4));
                pro.setImage(rs.getString(5));
                pro.setDescription(rs.getString(6));
                pro.setQuantity(rs.getInt(7));
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Category> getAllCategory() {
        Vector<Category> vector = new Vector<Category>();
        String sql = " select * from category ";

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category cate = new Category(rs.getInt(1), rs.getString(2));
                vector.add(cate);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector<Product> getProductByName(String pname) {
        Vector<Product> vector = new Vector<Product>();
        String sql = " select * from product p join category c on p.category_id = c.category_id where product_name like "+ "'%" + pname + "%'";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProduct_id(rs.getInt(1));
                pro.setProduct_name(rs.getString(2));
                pro.setPrice(rs.getString(4));
                pro.setImage(rs.getString(5));
                pro.setDescription(rs.getString(6));
                pro.setQuantity(rs.getInt(7));
                pro.setCategory(new Category(rs.getInt(8), rs.getString(9)));
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Product getProductById(int pid) {
        String sql = "  select * from product p join category c on p.category_id = c.category_id where product_id = " + pid;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProduct_id(rs.getInt(1));
                pro.setProduct_name(rs.getString(2));
                pro.setPrice(rs.getString(4));
                pro.setImage(rs.getString(5));
                pro.setDescription(rs.getString(6));
                pro.setQuantity(rs.getInt(7));
                pro.setCategory(new Category(rs.getInt(8), rs.getString(9)));
                return pro;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Vector<Product> getProductByCateId(int cateId) {
        Vector<Product> vector = new Vector<Product>();
        String sql = "  select * from product p join category c on p.category_id = c.category_id where p.category_id = " + cateId;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProduct_id(rs.getInt(1));
                pro.setProduct_name(rs.getString(2));
                pro.setPrice(rs.getString(4));
                pro.setImage(rs.getString(5));
                pro.setDescription(rs.getString(6));
                pro.setQuantity(rs.getInt(7));
                pro.setCategory(new Category(rs.getInt(8), rs.getString(9)));
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Product> searchProduct(String search, String cate, String sortType) {
        if (sortType == null || sortType.isEmpty()) {
            sortType = "product_id asc";
        }
        if (cate == null || cate.equals("")) {
            cate = "IN (1, 2, 3)";
        }
        Vector<Product> vector = new Vector<>();
        String sql = " select * from product p join category c on p.category_id = c.category_id where product_name like '%" + search + "%' "
                + " and c.category_id  " + cate
                + " order by " + sortType;
        System.out.println(sql);
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProduct_id(rs.getInt(1));
                pro.setProduct_name(rs.getString(2));
                pro.setPrice(rs.getString(4));
                pro.setImage(rs.getString(5));
                pro.setDescription(rs.getString(6));
                pro.setQuantity(rs.getInt(7));
                pro.setCategory(new Category(rs.getInt(8), rs.getString(9)));
                vector.add(pro);
            }
            return vector;
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector<Product> searchList(String search, String sortType, int index, int pageSize) {
        if (sortType == null || sortType.isEmpty()) {
            sortType = "product_id asc";
        }
        Vector<Product> vector = new Vector<>();
        String sql = "  select * from product p join category c on p.category_id = c.category_id where product_name like '%" + search + "%' "
                + " order by " + sortType
                + " OFFSET ? ROWS FETCH NEXT ?  ROWS ONLY ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * pageSize);
            stm.setInt(2, pageSize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProduct_id(rs.getInt(1));
                pro.setProduct_name(rs.getString(2));
                pro.setPrice(rs.getString(4));
                pro.setImage(rs.getString(5));
                pro.setDescription(rs.getString(6));
                pro.setQuantity(rs.getInt(7));
                pro.setCategory(new Category(rs.getInt(8), rs.getString(9)));
                vector.add(pro);
            }
            return vector;
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public int getTotalRowsCondition(String search) {
        String sql = " select count(*) from product p join category c on p.category_id = c.category_id   \n"
                + " where product_name like ? ";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public String getNameCategory(int cateId) {
        String sql = " select category_name from category where category_id = " + cateId;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Vector<Category> getListCategory() {
        String sql1 = "  select * from category";
        Vector<Category> vector = new Vector<Category>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql1);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category u = new Category(rs.getInt(1), rs.getString(2));
                vector.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public Vector<Product> searchByPrice(double minPrice, double maxPrice) {
        Vector<Product> vector = new Vector<Product>();
        String sql = "select * from product where price between " + minPrice + " and " + maxPrice;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product pro = new Product();
                pro.setProduct_id(rs.getInt(1));
                pro.setProduct_name(rs.getString(2));
                pro.setPrice(rs.getString(4));
                pro.setImage(rs.getString(5));
                pro.setDescription(rs.getString(6));
                pro.setQuantity(rs.getInt(7));
                pro.setCategory(new Category(rs.getInt(8), rs.getString(9)));
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();
        Vector<Product> vector = dao.searchProduct("", "", "");
        for (Product product : vector) {
            System.out.println(product);
        }
    }
}
