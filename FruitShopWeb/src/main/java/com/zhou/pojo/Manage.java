package com.zhou.pojo;

import java.io.Serializable;
/*
 * 管理员
 * */
public class Manage implements Serializable {
    /*主键*/
    private Integer id;
    /*登录名*/
    private String userName;
    /*密码*/
    private String password;
    /*姓名*/
    private String realName;

    public Manage(Integer id, String userName, String password, String realName) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.realName = realName;
    }

    public Manage() {
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getRealName() {
        return realName;
    }

    @Override
    public String toString() {
        return "Manage{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                '}';
    }
}


