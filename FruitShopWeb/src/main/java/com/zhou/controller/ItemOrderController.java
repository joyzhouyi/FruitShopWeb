package com.zhou.controller;

import com.zhou.pojo.Item;
import com.zhou.pojo.ItemOrder;
import com.zhou.pojo.OrderDetail;
import com.zhou.service.ItemOrderService;
import com.zhou.service.ItemService;
import com.zhou.service.OrderDetailService;
import com.zhou.utils.Consts;
import com.zhou.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/*
 * 订单管理
 * */
@Controller
@RequestMapping("/itemOrder")
public class ItemOrderController {
    @Autowired
    @Qualifier("ItemOrderServiceImpl")
    private ItemOrderService itemOrderService;

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

    /*
     * 订单管理列表
     * */
    @RequestMapping("/findBySql")
    public String findBySql(ItemOrder itemOrder, Model model) {
        //分页查询
        String sql = "select * from item_order where 1=1 ";
        if (!(itemOrder.getCode() == null)) {
            sql += "and code like '%" + itemOrder.getCode() + "%'";
        }
        sql += "order by id desc";

        Pager<ItemOrder> pagers = itemOrderService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers", pagers);
        //查询条件
        model.addAttribute("obj", itemOrder);
        return "itemOrder/itemOrder";

    }

    /*
     * 我的订单（用户查看自己的订单）
     * */
    @RequestMapping("/my")
    public String my(Model model, HttpServletRequest request) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);
        if (attribute == null) {
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        //全部订单
        String sql = "select * from item_order where user_id=" + userId + " order by id desc ";
        List<ItemOrder> all = itemOrderService.listBySqlReturnEntity(sql);

        for (ItemOrder order : all) {
            String sql1 = "select * from order_detail where order_id =" + order.getId();
            List<OrderDetail> details = orderDetailService.listBySqlReturnEntity(sql1);

            for (OrderDetail detail1 : details) {
                String sql2 = "select * from item where id = " + detail1.getItemId();
                Item item = itemService.getBySqlReturnEntity(sql2);
                detail1.setItem(item);

            }
            order.setDetails(details);
        }

        //代发货
        String sql2 = "select * from item_order where user_id=" + userId + " and status =0 order by id desc ";
        List<ItemOrder> dfh = itemOrderService.listBySqlReturnEntity(sql2);


        //已取消
        String sql3 = "select * from item_order where user_id=" + userId + " and status =1 order by id desc ";
        List<ItemOrder> yqx = itemOrderService.listBySqlReturnEntity(sql3);


        //已发货
        String sql4 = "select * from item_order where user_id=" + userId + " and status =2 order by id desc ";
        List<ItemOrder> yfh = itemOrderService.listBySqlReturnEntity(sql4);


        //已收货
        String sql5 = "select * from item_order where user_id=" + userId + " and status =3 order by id desc ";
        List<ItemOrder> ysh = itemOrderService.listBySqlReturnEntity(sql5);

        model.addAttribute("all", all);
        model.addAttribute("dfh", dfh);
        model.addAttribute("yqx", yqx);
        model.addAttribute("yfh",yfh);
        model.addAttribute("ysh", ysh);

        return "itemOrder/my";
    }


}
