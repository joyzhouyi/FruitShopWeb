package com.zhou.pojo;

import java.io.Serializable;
/*
* 收藏
* */
public class Sc implements Serializable {

/*
* 主键
* */
    private Integer id;
    /*
    * 被收藏的商品的id
    * */
    private Integer itemId;
    private Item item;
    /*
    * 用户的id
    * */
    private Integer userId;

    public Sc(Integer id, Integer itemId, Item item, Integer userId) {
        this.id = id;
        this.itemId = itemId;
        this.item = item;
        this.userId = userId;
    }

    public Sc() {
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

    public void setUserId(Integer userId) {
        this.userId = userId;
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

    public Integer getUserId() {
        return userId;
    }

    @Override
    public String toString() {
        return "Sc{" +
                "id=" + id +
                ", itemId=" + itemId +
                ", item=" + item +
                ", userId=" + userId +
                '}';
    }
}
