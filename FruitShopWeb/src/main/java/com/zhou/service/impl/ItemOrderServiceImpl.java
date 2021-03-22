package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.ItemOrderMapper;
import com.zhou.pojo.ItemOrder;
import com.zhou.service.ItemOrderService;
import org.springframework.beans.factory.annotation.Autowired;

public class ItemOrderServiceImpl extends BaseServiceImpl<ItemOrder> implements ItemOrderService {

    @Autowired
   private ItemOrderMapper itemOrderMapper;
    @Override
    public BaseDao<ItemOrder> getBaseDao() {
        return itemOrderMapper;
    }

    public ItemOrderMapper getItemOrderMapper() {
        return itemOrderMapper;
    }

    public void setItemOrderMapper(ItemOrderMapper itemOrderMapper) {
        this.itemOrderMapper = itemOrderMapper;
    }
}
