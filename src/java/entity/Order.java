/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author nguye
 */
public class Order {
    private int order_id;
    private int user_id;
    private Date order_date;
    private String total;
    private String status;

    public Order() {
    }

    public Order(int order_id, int user_id, Date order_date, String total, String status) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.total = total;
        this.status = status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date + ", total=" + total + ", status=" + status + '}';
    }

    
    
}
