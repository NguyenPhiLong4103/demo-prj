/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author nguye
 */
public class Product {
    private int product_id;
    private String product_name;
    private String image;
    private String price;
    private String description;
    private Category category;
    private int quantity;

    public Product() {
    }

    public Product(int product_id, String product_name, String image, String price, String description, Category category, int quantity) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.category = category;
        this.quantity = quantity;
    }

    public Product(int product_id, String product_name, String image, String price, String description, Category category) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.image = image;
        this.price = price;
        this.description = description;
        this.category = category;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "product_id=" + product_id + ", product_name=" + product_name + ", image=" + image + ", price=" + price + ", description=" + description + ", category=" + category + ", quantity=" + quantity + '}';
    }

    
}
