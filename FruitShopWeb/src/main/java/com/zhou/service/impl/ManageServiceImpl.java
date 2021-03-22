package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.ManageMapper;
import com.zhou.pojo.Manage;
import com.zhou.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManageServiceImpl extends BaseServiceImpl<Manage> implements ManageService {
    @Autowired
    ManageMapper manageMapper;
    @Override
    public BaseDao<Manage> getBaseDao() {
        return manageMapper;
    }

    public void setManageMapper(ManageMapper manageMapper) {
        this.manageMapper = manageMapper;
    }

//    public ManageMapper getManageMapper() {
//        return manageMapper;
//    }
}
