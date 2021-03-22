package com.zhou.pojo;

import java.io.Serializable;

public class User implements Serializable {

    /*
    * 主键id
    * */
    private Integer id;

    /*
    * 用户名
    * */
    private  String userName;

    /*
    * 密码
    * */
    private String passWord;

    /*
    * 电话号码
    * */
    private String phone;

    /*
    * 真实姓名
    * */
    private String realName;

    /*
    * 性别
    * */
    private String sex;

    /*
    * 地址
    * */
    private String address;

    /*
    * 电子邮件
    * */
    private String email;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", phone='" + phone + '\'' +
                ", realName='" + realName + '\'' +
                ", sex='" + sex + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public User() {
    }

    public User(Integer id, String userName, String passWord, String phone, String realName, String sex, String address, String email) {
        this.id = id;
        this.userName = userName;
        this.passWord = passWord;
        this.phone = phone;
        this.realName = realName;
        this.sex = sex;
        this.address = address;
        this.email = email;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public String getPhone() {
        return phone;
    }

    public String getRealName() {
        return realName;
    }

    public String getSex() {
        return sex;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }
}
