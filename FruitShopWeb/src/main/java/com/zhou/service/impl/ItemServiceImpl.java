package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.ItemMapper;
import com.zhou.pojo.Item;
import com.zhou.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl extends BaseServiceImpl<Item> implements  ItemService{
    @Autowired
    private ItemMapper itemMapper;
    @Override
    public BaseDao<Item> getBaseDao() {
        return itemMapper;
    }

    public void setItemMapper(ItemMapper itemMapper) {
        this.itemMapper = itemMapper;
    }

    public ItemMapper getItemMapper() {
        return itemMapper;
    }
}
