package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.NewsMapper;
import com.zhou.pojo.News;
import com.zhou.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;

public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService {
    @Autowired
    private NewsMapper newsMapper;
    @Override
    public BaseDao<News> getBaseDao() {
        return newsMapper;
    }

    public NewsMapper getNewsMapper() {
        return newsMapper;
    }

    public void setNewsMapper(NewsMapper newsMapper) {
        this.newsMapper = newsMapper;
    }
}
