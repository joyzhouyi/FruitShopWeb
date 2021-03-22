package com.zhou.pojo;

import java.io.Serializable;

/*
 * 订单 详情
 * */
public class OrderDetail implements Serializable {
    /*
     * 主键 id
     * */
    private Integer id;

    /*
     * 商品的id
     * */
    private Integer itemId;
    private Item item;

    /*
     * 订单的 id
     * */
    private Integer orderId;

    /*
     * 订单状态 0未退货 ，1已退货
     * */
    private Integer status;

    /*
     * 商品的购买数量 num
     * */
    private String num;

    /*
    * 商品的总数
    * */
    private String total;

    public OrderDetail() {
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public Item getItem() {
        return item;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public Integer getStatus() {
        return status;
    }

    public String getTotal() {
        return total;
    }

    public OrderDetail(Integer id, Integer itemId, Item item, Integer orderId, Integer status, String num, String total) {
        this.id = id;
        this.itemId = itemId;
        this.item = item;
        this.orderId = orderId;
        this.status = status;
        this.num = num;
        this.total = total;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getNum() {
        return num;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", itemId=" + itemId +
                ", item=" + item +
                ", orderId=" + orderId +
                ", status=" + status +
                ", num='" + num + '\'' +
                ", total='" + total + '\'' +
                '}';
    }
}
