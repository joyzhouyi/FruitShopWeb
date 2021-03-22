package com.zhou.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zhou.pojo.*;
import com.zhou.service.ItemCategoryService;
import com.zhou.service.ItemService;
import com.zhou.service.ManageService;
import com.zhou.service.UserService;
import com.zhou.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
/*
 * 登录 相关操作
 * */

@Controller
@RequestMapping("/login")
public class LoginController {

    @RequestMapping("/test1")
    public String test1() {
        return "test1";
    }

    @Qualifier("manageServiceImpl")
    @Autowired
    ManageService manageService;

    @Autowired
    @Qualifier("ItemCategoryServiceImpl")
    private ItemCategoryService itemCategoryService;

    @Autowired
    @Qualifier("itemServiceImpl")
    private ItemService itemService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    /*
     * 管理员登录前
     * */
    @RequestMapping("/login")
    public String login() {
        return "login/mLogin";
    }

    /*登录验证
     * */
    @RequestMapping("/toLogin")
    public String toLogin(Manage manage, HttpServletRequest request) {
        Manage byEntity = manageService.getByEntity(manage);
        if (byEntity == null) {
            return "redirect:/login/login";
        }
        request.getSession().setAttribute(Consts.MANAGE, byEntity);
        return "login/mIndex";
    }

    /*
    * 前往管理后台首页
    *
    * */
    @RequestMapping("toMIndex")
    public String toMIndex(HttpServletRequest request){
        Object attribute = request.getSession().getAttribute(Consts.MANAGE);
       if (attribute==null){
           return "redirect:/login/login";
       }
       return  "login/mIndex";

    }
    /*
     * 管理员退出
     * */
     @RequestMapping("/mTuiChu")
    public String mtuichu(HttpServletRequest request) {
        request.getSession().setAttribute(Consts.MANAGE, null);
        return "redirect:/login/login";
    }

    /*
     * 前端首页
     * */
    @RequestMapping("uIndex")
    public String uIndex(Model model, Item item, HttpServletRequest request) {
        String sql1 = "select * from item_category where isDelete =0 and pid is null order by name ";
        List<ItemCategory> fatherList = itemCategoryService.listBySqlReturnEntity(sql1);

        List<CategoryDto> list = new ArrayList<>();
        if (!CollectionUtils.isEmpty(fatherList)) {
            for (ItemCategory ic : fatherList) {
                CategoryDto dto = new CategoryDto();
                dto.setFather(ic);
                //查询二级类目
                String sql2 = "select * from item_category where isDelete = 0 and pid = " + ic.getId();
                List<ItemCategory> childrens = itemCategoryService.listBySqlReturnEntity(sql2);

                dto.setChildrens(childrens);
                list.add(dto);

            }
            model.addAttribute("lbs", list);
        }

        //折扣商品
        String sql2 = "select * from item where isDelete = 0 and zk is not null order by zk limit 0,10";
        List<Item> zks = itemService.listBySqlReturnEntity(sql2);

        model.addAttribute("zks", zks);
        for (Item item1 : zks) {
            if (item1.getName().length() > 8) {
                item1.setName(item1.getName().substring(0, 8) + "...");
            }
        }

        //热销商品
        String sql3 = "select * from item where isDelete = 0 order by gmNum desc limit 0,10";
        List<Item> rxs = itemService.listBySqlReturnEntity(sql3);
        model.addAttribute("rxs", rxs);

        for (Item item1 : rxs) {
            if (item1.getName().length() > 8) {
                item1.setName(item1.getName().substring(0, 8) + "...");
            }
        }
        return "login/uIndex";
    }

    /*
     * 普通用户注册
     * */
    @RequestMapping("/res")
    public String res() {


        return "login/res";
    }

    /*
     * 执行普通用户注册
     * */
    @RequestMapping("toRes")
    public String toRes(User user) {

        userService.insert(user);
        return "login/uLogin";


    }

    @RequestMapping("uLogin")
    public String uLogin() {
        return "login/uLogin";
    }

    /*
     * 普通用户登录
     * */
    @RequestMapping("/utoLogin")
    public String utoLogin(User user, HttpServletRequest request) {
        User byEntity = userService.getByEntity(user);
        if (byEntity == null) {

            return "redirect:/login/res.action";
        } else {
            request.getSession().setAttribute("role", 2);
            request.getSession().setAttribute(Consts.USERNAME, byEntity.getUserName());
            request.getSession().setAttribute(Consts.USEID, byEntity.getId());
            return "redirect:/login/uIndex";
        }


    }

    /*
     * 普通用户退出登录
     * */
    @RequestMapping("/uTui")
    public String uTui(HttpServletRequest request) {

        HttpSession httpSession = request.getSession();
        httpSession.invalidate();//清空session
        return "redirect:/login/uIndex.action";
    }

    /*
     * 前往修改密码
     * */
    @RequestMapping("/pass")
    public String pass(HttpServletRequest request, Model model) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);

        if (attribute == null) {
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User user = userService.load(userId);
        model.addAttribute("obj", user);
        return "login/pass";


    }


    /*
     * 执行修改密码
     * */
    @RequestMapping("/upass")
    public String upass(String password, HttpServletRequest request, Model model) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);

        if (attribute == null) {
            return "redirect:/login/uLogin";
        }
        Integer userId = Integer.valueOf(attribute.toString());
        User user = userService.load(userId);
        user.setPassWord(password);
        userService.update(user);
        model.addAttribute("msg", "密码重置成功！");
        model.addAttribute("obj", user);

        return "login/pass";


    }


}


