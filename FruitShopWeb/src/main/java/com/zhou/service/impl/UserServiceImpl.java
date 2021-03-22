package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.ItemCategoryMapper;
import com.zhou.map.UserMapper;
import com.zhou.pojo.ItemCategory;
import com.zhou.pojo.User;
import com.zhou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public BaseDao<User> getBaseDao() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }



//    public ManageMapper getManageMapper() {
//        return manageMapper;
//    }
}
