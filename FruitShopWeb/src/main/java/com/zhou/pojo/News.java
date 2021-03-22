package com.zhou.pojo;

import java.io.Serializable;
import java.util.Date;

/*
* 公告
* */
public class News implements Serializable {

    /*
    * 公告的主键
    * */
    private Integer id;

    /*
    * 公告的名字
    * */
    private String name;

    /*
    * 公告的内容
    * */
    private String content;

    /*
    * 发布时间
    * */
    private Date addTime;

    public News() {
    }

    public News(Integer id, String name, String context, Date addTime) {
        this.id = id;
        this.name = name;
        this.content = context;
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", context='" + content + '\'' +
                ", addTime=" + addTime +
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

    public Date getAddTime() {
        return addTime;
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

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }
}
