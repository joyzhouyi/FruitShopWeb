package com.zhou.controller;

import com.zhou.pojo.News;
import com.zhou.service.NewsService;
import com.zhou.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/*
 * 公告管理
 * */
@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    @Qualifier("newsServiceImpl")
    private NewsService newsService;

    /*
     * 公告列表
     * */
    @RequestMapping("/findBySql")
    public String findBySql(News news, Model model) {
        String sql = "select * from news where 1=1";
        if (!(news.getId() == null)) {
            sql += "add name like '%" + news.getName() + "%' ";

        }
        sql += " order by id desc ";
        Pager<News> pagers = newsService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers", pagers);
        model.addAttribute("obj", news);

        return "news/news";
    }

    /*
     * 跳转到添加页面
     * */
    @RequestMapping("/add")
    public String add() {

        return "news/add";
    }

    /*
     * 执行添加
     * */
    @RequestMapping("exAdd")
    public String exAdd(News news) {
        news.setAddTime(new Date());
        System.out.println(news);
        newsService.insert(news);
        return "redirect:/news/findBySql";
    }

    /*
     * 跳转到更新页面
     * */
    @RequestMapping("/update")
    public String update(Integer id, Model model) {

        News obj = newsService.load(id);

        model.addAttribute("obj", obj);
        return "news/update";
    }

    /*
     * 执行 修改
     * */
    @RequestMapping("/exUpdate")
    public String exUpdate(News news) {

        newsService.updateById(news);
        return "redirect:/news/findBySql";


    }

    /*
     * 执行删除
     * */
    @RequestMapping("/delete")
    public String delete(Integer id) {
        newsService.deleteById(id);
        return "redirect:/news/findBySql";
    }

    /*
     * 前端公告列表
     * */
    @RequestMapping("/list")
    public String list(Model model) {
        String sql = "select * from news order by id desc";
        Pager<News> pagers = newsService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers", pagers);
        return "news/list";
    }

    /*
    * 公告详情页面
    * */
    @RequestMapping("/view")
    public String view(Integer id,Model model){
        News obj = newsService.load(id);
        model.addAttribute("obj",obj);
        return "news/view";

    }

}
