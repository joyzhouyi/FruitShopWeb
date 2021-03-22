package com.zhou.controller;


import com.zhou.pojo.Car;
import com.zhou.pojo.Item;

import com.zhou.service.CarService;
import com.zhou.service.ItemService;

import com.zhou.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
/*
 * 购物车
 * */
@Controller
@RequestMapping("/car")
public class CarController {

    @Autowired
    @Qualifier("carServiceImpl")
    private CarService carService;

    @Autowired
    @Qualifier("itemServiceImpl")
    private ItemService itemService;

    @RequestMapping("/exAdd")
    public String exAdd(Car car, HttpServletRequest request) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);
        if (attribute == null) {
            return "redirect:/login/uLogin";
        }
        //保存到购物车中
        Integer userId = Integer.valueOf(attribute.toString());
        car.setUserId(userId);
        Item item = itemService.load(car.getItemId());
        String price = item.getPrice();
        Double valueOf = Double.valueOf(price);
        car.setPrice(valueOf);
        if (item.getZk() != null) {
            valueOf = valueOf * item.getZk() / 10;
            BigDecimal bg = new BigDecimal(valueOf).setScale(2, RoundingMode.UP);
            car.setPrice(bg.doubleValue());
            valueOf = bg.doubleValue();
        }
        Integer num = car.getNum();
        if (num == null) {
            num = 1;
        } else {
            num += 1;
        }
        Double t = valueOf * num;
        BigDecimal bg = new BigDecimal(valueOf).setScale(2, RoundingMode.UP);
        double doubleValue = bg.doubleValue();
        car.setTotal(String.valueOf(doubleValue));
        carService.insert(car);
        return "redirect:/car/findBySql";
    }
    /*
     * 转向我的购物车页面
     * */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, HttpServletRequest request) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);
        if (attribute == null) {
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        String sql = "select * from car where user_id =" + userId + " order by id desc";
        List<Car> list = carService.listBySqlReturnEntity(sql);
        for (Car car : list) {
            String sql2 = "select * from item where id=" + car.getItemId();
            Item item1 = itemService.getBySqlReturnEntity(sql2);
            car.setItem(item1);
            if (car.getNum() == null) {
                car.setNum(1);
            }
            car.setTotal(String.format("%.2f", Math.floor((Double.valueOf(car.getItem().getPrice())) * ((int) car.getNum()) * car.getItem().getZk() / 10.00)));
        }
        model.addAttribute("list", list);
        return "car/findBySql";
    }
    /*
     * 从 购物车中删除 加入的物品
     * */
    @RequestMapping("/delete")
    public String delete(Integer id, HttpServletRequest request) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);
        if (attribute == null) {
            return "redirect:/login/uLogin";
        }
        carService.deleteById(id);
        return "redirect:/car/findBySql";
    }
}