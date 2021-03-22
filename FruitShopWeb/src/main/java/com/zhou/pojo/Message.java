package com.zhou.pojo;

import java.io.Serializable;


/*
* 留言
* */
public class Message implements Serializable {

    /*
    * 公告的主键
    * */
    private Integer id;

    /*
    * 姓名
    * */
    private String name;

    /*
    * 公告的内容
    * */
    private String content;

    /*
    * 发布时间
    * */
    private String phone;

    public Message() {
    }

    public Message(Integer id, String name, String context, String phone) {
        this.id = id;
        this.name = name;
        this.content = context;
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", context='" + content + '\'' +
                ", phone=" + phone +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getContext() {
        return content;
    }

    public String getPhone() {
        return phone;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setContext(String context) {
        this.content = context;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
