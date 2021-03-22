package com.zhou.controller;

import com.zhou.pojo.User;
import com.zhou.service.UserService;
import com.zhou.utils.Consts;
import com.zhou.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/*
 * 用户管理
 * */
@Controller
@RequestMapping("/user")
public class UserController {
    @RequestMapping("/test3")
    private String test3() {
        return "test3";
    }

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @RequestMapping("/findBySql")
    public String findBySql(Model model, User user) {


        String sql = "select * from user where 1=1 ";

        if (user.getUserName() != null) {
            if (!(user.getUserName().length() == 0)) {

                sql += " and userName like '%" + user.getUserName() + "%' ";
            }
        }
        sql += " order by id";
        Pager<User> pagers = userService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers", pagers);
        model.addAttribute("obj", user);
        return "user/user";
    }

    /*
     * 修改用户信息
     * */
    @RequestMapping("/view")
    public String view(Model model, HttpServletRequest request) {
        Object attribute = request.getSession().getAttribute(Consts.USEID);
        if (attribute==null){
            return "redirect:/login/uLogin";
        }
        Integer userId=Integer.valueOf(attribute.toString());
        User obj = userService.load(userId);

        model.addAttribute("obj",obj);
        return "user/view";

    }

    /*
    * 执行修改用户信息
    * */
    @RequestMapping("exUpdate")
    public String exUpdate(User user,HttpServletRequest request,Model model){

        Object attribute = request.getSession().getAttribute(Consts.USEID);
        if (attribute==null){
            return "redirect:/login/uLogin";
        }
        user.setId(Integer.valueOf(attribute.toString()));

        userService.update(user);
        System.out.println("exUpdate=="+user);
         model.addAttribute("obj",user);
        return "user/view";


    }

}
