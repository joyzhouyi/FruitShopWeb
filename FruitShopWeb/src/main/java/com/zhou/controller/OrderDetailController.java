package com.zhou.controller;

import com.zhou.pojo.Item;
import com.zhou.pojo.OrderDetail;
import com.zhou.service.ItemService;
import com.zhou.service.OrderDetailService;
import com.zhou.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 订单详情
 * */
@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController {


    @Autowired
    @Qualifier("orderDetailServiceImpl")
    private OrderDetailService orderDetailService;

    @Autowired
    @Qualifier("itemServiceImpl")
    private ItemService itemService;

    @RequestMapping("/test5")
    public String test5() {
        return "test5";
    }

    @RequestMapping("ulist")
    public String ulist(OrderDetail orderDetail, Model model) {


        //分页查询
        String sql="select * from order_detail where order_id = "+orderDetail.getOrderId();

        Pager<OrderDetail> pagers=orderDetailService.findBySqlRerturnEntity(sql);
        for (OrderDetail orderDetail1:pagers.getDatas()){
            Item item = itemService.getById(orderDetail1.getItemId());
            orderDetail1.setItem(item);
            System.out.println(orderDetail1);
        }
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",orderDetail);
        return "orderDetail/ulist";
    }
}
