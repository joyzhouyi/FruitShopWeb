package com.zhou.controller;

import com.github.pagehelper.Page;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zhou.pojo.ItemCategory;
import com.zhou.service.ItemCategoryService;
import com.zhou.utils.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 类目的controller层
 * */
@Controller
@RequestMapping("/itemCategory")
public class ItemCategoryController {

    @Qualifier("ItemCategoryServiceImpl")
    @Autowired
    private ItemCategoryService itemCategoryService;

    @RequestMapping("/test2")
    public String test2() {

        return "test2";
    }

    /*
     *分页查询类目 列表
     * */
    @RequestMapping("/findBySql")
    public String findBySql(Model model, ItemCategory itemCategory) {
        String sql = "select * from item_category where isDelete =0 and pid is null order by id";
        Pager<ItemCategory> pagers = itemCategoryService.findBySqlRerturnEntity(sql);
//        System.out.println(pagers.getTotal());

        model.addAttribute("pagers", pagers);
        model.addAttribute("obj", itemCategory);
        return "itemCategory/itemCategory";
    }

    /*
     * 转向到新增一级分类页面
     * */
    @RequestMapping("/add")
    public String add() {
        return "itemCategory/add";
    }

    /*新增一级类目保存功能*/
    @RequestMapping("/exAdd")
    public String exAdd(ItemCategory itemCategory) {
        itemCategory.setIsDelete(0);
        int insert = itemCategoryService.insert(itemCategory);
        return "redirect:/itemCategory/findBySql";
    }

    /*
     * 转向到修改一级分类页面
     * */
    @RequestMapping("/update")
    public String update(Integer id, Model model) {
        /*获取 itemCategory对象*/
        ItemCategory itemCategory = itemCategoryService.getById(id);
        model.addAttribute("obj", itemCategory);
        return "itemCategory/update";
    }

    /*
     * 修改一级类目
     * */
    @RequestMapping("/exUpdate")
    public String exUpdate(ItemCategory itemCategory) {

        itemCategoryService.updateById(itemCategory);
        return "redirect:/itemCategory/findBySql";
    }

    /*
     * 删除一级类目
     * */
    @RequestMapping("/delete")
    public String delete(Integer id) {
        /*根据id值查询要删除的 类目*/
        ItemCategory load = itemCategoryService.getById(id);
        load.setIsDelete(1);
        itemCategoryService.updateById(load);//进行删除操作
        //将下一届也删除
        String sql = "update item_category set isDelete = 0 where pid=" + id;
        itemCategoryService.updateBysql(sql);
        return "redirect:/itemCategory/findBySql";
    }

    /*
     * 查看二级分类
     * */
    @RequestMapping("/findBySql2")
    public String findSql2(ItemCategory itemCategory, Model model) {
        String sql = "select * from item_category where isDelete = 0 and pid = " + itemCategory.getPid()+" order by id";
        Pager<ItemCategory> pagers=itemCategoryService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers",pagers);
        model.addAttribute("obj",itemCategory);
        return "itemCategory/itemCategory2";
    }
    /*
    * 转向到新增二级类目页面
    * */
    @RequestMapping("/add2")
    public String add2(Integer pid,Model model) {
        model.addAttribute("pid",pid);
        return "itemCategory/add2";
    }
    /*新增二级类目保存功能*/
    @RequestMapping("/exAdd2")
    public String exAdd2(ItemCategory itemCategory) {
        itemCategory.setIsDelete(0);

        int insert = itemCategoryService.insert(itemCategory);
        return "redirect:/itemCategory/findBySql2.action?pid="+itemCategory.getPid();
    }
    /*
     * 转向到修改二级分类页面
     * */
    @RequestMapping("/update2")
    public String update2(Integer id, Model model) {
        /*获取 itemCategory对象*/
        ItemCategory itemCategory = itemCategoryService.getById(id);
        model.addAttribute("obj", itemCategory);
        return "itemCategory/update2";
    }
    /*
     * 修改二级类目
     * */
    @RequestMapping("/exUpdate2")
    public String exUpdate2(ItemCategory itemCategory) {

        itemCategoryService.updateById(itemCategory);
        return "redirect:/itemCategory/findBySql2.action?pid="+itemCategory.getPid();
    }
    /*
     * 删除二级类目
     * */
    @RequestMapping("/delete2")
    public String delete2(Integer id,Integer pid) {
        /*根据id值查询要删除的 类目*/
        ItemCategory load = itemCategoryService.getById(id);
        load.setIsDelete(1);
        itemCategoryService.updateById(load);//进行删除操作
//        //将下一届也删除
//        String sql = "update item_category set isDelete = 0 where pid=" + id;
//        itemCategoryService.updateBysql(sql);
        return "redirect:/itemCategory/findBySql2.action?pid="+pid;
    }


}
