package com.zhou.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ItemOrder implements Serializable {

    /*
    * 主键
    * */
    private Integer id;
    /*
    * 商品的id
    * */
    private Integer itemId;

    /*
    * 购买者的id
    * */
    private Integer userId;

    private User user;

    /*
    * 订单号
    * */
    private String code;

    /*
    * 购买的时间
    * */
    private Date addTime;

    /*
    * 购买数量
    * */
    private String total;


    /*
    * 是否删除 0表示未删除 1表示删除
    * */
    private Integer isDelete;

    /*
    * 状态 0新建代发货  1已取消  2已发货 3.到收获 4.已评价
    * */
    private  Integer status;
    /*
    * 该商品订单的详细信息
    * */
    private List<OrderDetail> details;


    public ItemOrder(Integer id, Integer itemId, Integer userId, User user, String code, Date addTime, String total, Integer isDelete, Integer status, List<OrderDetail> details) {
        this.id = id;
        this.itemId = itemId;
        this.userId = userId;
        this.user = user;
        this.code = code;
        this.addTime = addTime;
        this.total = total;
        this.isDelete = isDelete;
        this.status = status;
        this.details = details;
    }

    public ItemOrder() {
    }

    public ItemOrder(Integer id, Integer itemId, Integer userId, User user, String code, Date addTime, String total, Integer isDelete, Integer status) {
        this.id = id;
        this.itemId = itemId;
        this.userId = userId;
        this.user = user;
        this.code = code;
        this.addTime = addTime;
        this.total = total;
        this.isDelete = isDelete;
        this.status = status;
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

    public void setUser(User user) {
        this.user = user;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public User getUser() {
        return user;
    }

    public String getCode() {
        return code;
    }

    public Date getAddTime() {
        return addTime;
    }

    public String getTotal() {
        return total;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public Integer getStatus() {
        return status;
    }

    public List<OrderDetail> getDetails() {
        return details;
    }

    public void setDetails(List<OrderDetail> details) {
        this.details = details;
    }

    @Override
    public String toString() {
        return "ItemOrder{" +
                "id=" + id +
                ", itemId=" + itemId +
                ", userId=" + userId +
                ", user=" + user +
                ", code='" + code + '\'' +
                ", addTime=" + addTime +
                ", total='" + total + '\'' +
                ", isDelete=" + isDelete +
                ", status=" + status +
                '}';
    }
}
