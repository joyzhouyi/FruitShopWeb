package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.ItemCategoryMapper;
import com.zhou.pojo.ItemCategory;
import com.zhou.service.ItemCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemCategoryServiceImpl extends BaseServiceImpl<ItemCategory> implements ItemCategoryService {
    @Autowired
    ItemCategoryMapper itemCategoryMapper;
    @Override
    public BaseDao<ItemCategory> getBaseDao() {
        return itemCategoryMapper;
    }

    public void setItemCategoryMapper(ItemCategoryMapper itemCategoryMapper) {
        this.itemCategoryMapper = itemCategoryMapper;
    }



//    public ManageMapper getManageMapper() {
//        return manageMapper;
//    }
}
