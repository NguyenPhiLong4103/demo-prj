/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Vector;

/**
 *
 * @author nguye
 */
public class Cart {

    private Vector<CartItems> items;
    private float totalPrice;

    public Cart() {
    }

    public Cart(Vector<CartItems> items, float totalPrice) {
        this.items = items;
        this.totalPrice = totalPrice;
    }

    public Vector<CartItems> getItems() {
        return items;
    }

    public void setItems(Vector<CartItems> items) {
        this.items = items;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    //kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng hay chưa
    public boolean checkExist(int id) {
        for (CartItems item : items) {
            if (item.getProduct().getProduct_id() == id) {
                return true;
            }
        }
        return false;
    }

    private CartItems getItemsByPid(int id) {
        for (CartItems item : items) {
            if (item.getProduct().getProduct_id() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(CartItems newItem) {
        //nếu đã tồn tại trong giỏ hàng thì thêm số lượng
        if (checkExist(newItem.getProduct().getProduct_id())) {
            CartItems oldItem = getItemsByPid(newItem.getProduct().getProduct_id());
            oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity());
        } else { //chưa tồn tại trong giỏ hàng thì thêm vào
            items.add(newItem);
        }
    }

    public void changeQuantity(int pid, int quantity) {
        CartItems item = getItemsByPid(pid);
        item.setQuantity(quantity);
        if (quantity == 0) {
            removeItems(pid);
        }
    }

    public void removeItems(int pid) {
        if (getItemsByPid(pid) != null) {
            items.remove(getItemsByPid(pid));
        }
    }

    public float getTotalMoney() {
        float total = 0;
        for (CartItems item : items) {
            total += (item.getQuantity() * Float.parseFloat(item.getProduct().getPrice()));
        }
        return total;
    }

}
