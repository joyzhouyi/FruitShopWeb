package com.zhou.pojo;

import java.io.Serializable;

public class Car implements Serializable {

    /*
    * 主键 id
    * */

    private Integer id;

    /*
    * 商品的id
    * */
    private  Integer itemId;
  /*商品对象*/
    private  Item item;
    /*
    * 用户的id
    * */
    private  Integer userId;

    /*
    * 加入购物车的数量
    * */
    private Integer num;

    /*
    * 商品的单价
    * */
    private Double price;

    /*
    * 商品的总价
    * */
    private String total;

    public Car() {
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public Integer getId() {
        return id;
    }

    public Integer getItemId() {
        return itemId;
    }

    public Integer getUserId() {
        return userId;
    }

    public Integer getNum() {
        return num;
    }

    public Double getPrice() {
        return price;
    }

    public String getTotal() {
        return total;
    }

    public Car(Integer id, Integer itemId, Item item, Integer userId, Integer num, Double price, String total) {
        this.id = id;
        this.itemId = itemId;
        this.item = item;
        this.userId = userId;
        this.num = num;
        this.price = price;
        this.total = total;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", itemId=" + itemId +
                ", item=" + item +
                ", userId=" + userId +
                ", num=" + num +
                ", price=" + price +
                ", total='" + total + '\'' +
                '}';
    }
}
