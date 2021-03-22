package com.zhou.controller;

import com.zhou.pojo.Item;
import com.zhou.pojo.Sc;
import com.zhou.service.ItemService;
import com.zhou.service.ScService;
import com.zhou.utils.Consts;
import com.zhou.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/*
 * 收藏
 * */
@Controller
@RequestMapping("/sc")
public class ScController {

    @Autowired
    @Qualifier("scServiceImpl")
    private ScService scService;

    @Autowired
    @Qualifier("itemServiceImpl")
    private ItemService itemService;

    @RequestMapping("/exAdd")
    public String exAdd(Sc sc, HttpServletRequest request) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);

        if (attribute == null) {

            return "redirect:/login/uLogin";
        }
        //保存到收藏表中
        Integer userId = Integer.valueOf(attribute.toString());
        sc.setUserId(userId);
        scService.insert(sc);

        //收藏数+1
        Item item = itemService.load(sc.getItemId());

        item.setScNum(item.getScNum() + 1);
        itemService.updateById(item);
        return "redirect:/sc/findBySql";
    }

    /*
     * 收藏列表
     * */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, HttpServletRequest request) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);
        if (attribute == null) {
            return "redirect:login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        String sql = "select * from sc where user_id =" + userId + " order by id desc";
        Pager<Sc> pagers = scService.findBySqlRerturnEntity(sql);
        for (int i = 0; i < pagers.getDatas().size(); i++) {
            String sql1 = "select * from item where id=" + pagers.getDatas().get(i).getItemId();
            Item item = itemService.getBySqlReturnEntity(sql1);
            pagers.getDatas().get(i).setItem(item);
        }
        model.addAttribute("pagers", pagers);


        return "/sc/findBySql";
    }

    /*
     * 取消收藏
     * */
    @RequestMapping("/delete")
    public String delete(Integer id, HttpServletRequest request) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);
        if (attribute == null) {
            return "redirect:login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());

        scService.deleteById(id);
        return "redirect:/sc/findBySql";


    }

}
