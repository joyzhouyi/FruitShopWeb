package com.zhou.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zhou.pojo.Item;
import com.zhou.pojo.ItemCategory;
import com.zhou.pojo.User;
import com.zhou.service.ItemCategoryService;
import com.zhou.service.ItemService;
import com.zhou.utils.Pager;
import com.zhou.utils.SystemContext;
import com.zhou.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

/*
 * 商品 管理
 * */
@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    @Qualifier("itemServiceImpl")
    private ItemService itemService;
    @Autowired
    @Qualifier("itemCategoryServiceImpl")
    private ItemCategoryService itemCategoryService;

    @RequestMapping("/test4")
    public String test4() {
        return "/test4";
    }

    @RequestMapping("/findBySql")
    public String findBySql(Model model, Item item) {


        String sql = "select * from item where isDelete = 0 ";
        if (item.getName() != null) {
            if (!(item.getName().length() == 0)) {

                sql += " and name like %" + item.getName() + "% ";
            }
        }
        sql += " order by id desc";
        Pager<Item> pagers = itemService.findBySqlRerturnEntity(sql);
        for (Item item1 : pagers.getDatas()) {
            item1.setYiji(itemCategoryService.getById(item1.getCategoryIdOne()));
            item1.setErji(itemCategoryService.getById(item1.getCategoryIdTwo()));
        }
        model.addAttribute("pagers", pagers);
        model.addAttribute("obj", item);
        return "item/item";
    }

    /*
     * 添加商品入口
     * */
    @RequestMapping("/add")
    private String add(Model model) {
        String sql = "select * from item_category where isDelete = 0 and pid is not null order by  id ";
        List<ItemCategory> list = itemCategoryService.listBySqlReturnEntity(sql);

        model.addAttribute("types", list);
        return "item/add";
    }

    /*
     * 执行添加商品
     * */
    @RequestMapping("/exAdd")
    private String exAdd(Item item, @RequestParam("file") CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        if (files.length > 0) {
            for (int s = 0; s < files.length; s++) {
                String n = UUIDUtils.create();
                System.out.println(SystemContext.getRealPath() + "----");
                String path = "D:\\zhouyi\\FruitShopCode\\FruitShopWeb\\web" + "\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename();
                File newFile = new File(path);
                //通过CommonsMultipartFile的方法直接写文件
                files[s].transferTo(newFile);
                if (s == 0) {
                    item.setUrl1("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 1) {
                    item.setUrl2("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 2) {
                    item.setUrl3("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 3) {
                    item.setUrl4("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 4) {
                    item.setUrl5("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }

            }
        }
        item.setGmNum(0);
        item.setScNum(0);
        item.setIsDelete(0);

        ItemCategory byId = itemCategoryService.getById(item.getCategoryIdTwo());
        item.setCategoryIdOne(byId.getPid());
        itemService.insert(item);
        return "redirect:/item/findBySql";

    }

    /*
     * 修改商品入口
     * */
    @RequestMapping("/update")
    public String update(Integer id, Model model) {

        /*获取对应的商品*/
        Item obj = itemService.getById(id);

        String sql = "select * from item_category where isDelete = 0 and pid is not null order by id";
        List<ItemCategory> listBySqlReturnEntity = itemCategoryService.listBySqlReturnEntity(sql);

        model.addAttribute("types", listBySqlReturnEntity);
        model.addAttribute("obj", obj);
        return "item/update";
    }

    /*
     * 执行更新商品
     * */
    @RequestMapping("/exUpdate")
    private String exUpdate(Item item, @RequestParam("file") CommonsMultipartFile[] files, HttpServletRequest request) throws IOException {
        if (files.length > 0) {
            for (int s = 0; s < files.length; s++) {
                String n = UUIDUtils.create();
//                System.out.println(SystemContext.getRealPath()+"----");
                String path = "D:\\zhouyi\\FruitShopCode\\FruitShopWeb\\web" + "\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename();
                File newFile = new File(path);
                //通过CommonsMultipartFile的方法直接写文件
                files[s].transferTo(newFile);
                if (s == 0) {
                    item.setUrl1("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 1) {
                    item.setUrl2("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 2) {
                    item.setUrl3("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 3) {
                    item.setUrl4("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }
                if (s == 4) {
                    item.setUrl5("\\test1_war_exploded\\resource\\ueditor\\upload\\" + n + files[s].getOriginalFilename());
                }

            }
        }
//        item.setGmNum(0);
//        item.setScNum(0);
//        item.setIsDelete(0);

        ItemCategory byId = itemCategoryService.getById(item.getCategoryIdTwo());
        item.setCategoryIdOne(byId.getPid());
        itemService.updateById(item);
        return "redirect:/item/findBySql";

    }

    /*
     *删除商品
     * */
    @RequestMapping("/delete")
    public String delete(Integer id) {

        String sql = "update item set isDelete = 1 where id = " + id;
        itemService.updateBysql(sql);
        return "redirect:/item/findBySql";
    }

    /*
     * 按关键字或者二级分类查询
     * */
    @RequestMapping("/shopList")
    public String shopList(Item item, String condition, Model model) {
        String sql = "select * from item where isDelete = 0 ";
        if (!(item.getCategoryIdTwo() == null)) {
            sql += " and category_id_two = " + item.getCategoryIdTwo();
        }
        if (condition!=null&&condition.length() != 0) {
            sql += " and name like '%" + condition + "%' ";
            model.addAttribute("condition", condition);
        }
        if(item.getPrice()!=null ){
            sql+=" order by (price+0) desc";
        }
        if (item.getGmNum()!=null){
            sql+=" order by gmNum desc";
        }
        if (item.getGmNum()==null&&item.getPrice()==null){
            sql+=" order by id ";
        }

        Pager<Item> pagers = itemService.findBySqlRerturnEntity(sql);
        model.addAttribute("pagers", pagers);

        model.addAttribute("obj", item);
        return "item/shopList";
    }

    /*
    *
    * */
    @RequestMapping("/view")
    public String view(Integer id,Model model){
        Item obj = itemService.load(id);
        model.addAttribute("obj",obj);
        return "item/view";


    }
}
