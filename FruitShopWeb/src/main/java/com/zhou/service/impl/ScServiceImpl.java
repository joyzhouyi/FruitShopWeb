package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.ScMapper;
import com.zhou.pojo.Sc;
import com.zhou.service.ScService;
import org.springframework.beans.factory.annotation.Autowired;

public class ScServiceImpl extends BaseServiceImpl<Sc> implements ScService {
    @Autowired
    private ScMapper  scMapper;
    @Override
    public BaseDao<Sc> getBaseDao() {
        return scMapper;
    }

    public ScMapper getScMapper() {
        return scMapper;
    }

    public void setScMapper(ScMapper scMapper) {
        this.scMapper = scMapper;
    }
}
