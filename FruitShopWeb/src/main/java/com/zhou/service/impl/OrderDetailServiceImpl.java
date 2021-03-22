package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.OrderDetailMapper;
import com.zhou.pojo.OrderDetail;
import com.zhou.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;

public class OrderDetailServiceImpl extends BaseServiceImpl<OrderDetail> implements OrderDetailService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Override
    public BaseDao<OrderDetail> getBaseDao() {
        return orderDetailMapper;
    }

    public OrderDetailMapper getOrderDetailMapper() {
        return orderDetailMapper;
    }

    public void setOrderDetailMapper(OrderDetailMapper orderDetailMapper) {
        this.orderDetailMapper = orderDetailMapper;
    }
}
