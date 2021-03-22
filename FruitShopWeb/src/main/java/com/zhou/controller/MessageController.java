package com.zhou.controller;

import com.zhou.pojo.Message;
import com.zhou.service.MessageService;
import com.zhou.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/*
* 留言管理
* */
@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    @Qualifier("messageServiceImpl")
    private MessageService messageService;
    /*
    * 留言列表
    * */
    @RequestMapping("/findBySql")
    public String findBySql(Message message, Model model){
        String sql="select * from message where 1=1";
        if (!(message.getId()==null)){
            sql +="add name like '%"+message.getName()+"%' ";

        }
        sql+=" order by id desc ";
        Pager<Message> pagers = messageService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",message);

        return "message/message";
    }


    /*
    * 执行删除
    * */
    @RequestMapping("/delete")
    public String delete(Integer id){
        messageService.deleteById(id);
        return "redirect:/message/findBySql";
    }

    /*
    * 发表留言
    * */
    @RequestMapping("/add")
    public String add(){

        return "message/add";

    }
    /*
    * 保存留言
    * */
    @RequestMapping("/exAdd")
    public String exAdd(Message message,Model model){
        System.out.println(message);
        messageService.insert(message);
        model.addAttribute("msg","成功提交留言！");
        return "message/add";
    }


}
