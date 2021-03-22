package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.MessageMapper;
import com.zhou.map.NewsMapper;
import com.zhou.pojo.Message;
import com.zhou.pojo.News;
import com.zhou.service.MessageService;
import com.zhou.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;

public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService {
    @Autowired
    private MessageMapper messageMapper;
    @Override
    public BaseDao<Message> getBaseDao() {
        return messageMapper;
    }

    public void setMessageMapper(MessageMapper messageMapper) {
        this.messageMapper = messageMapper;
    }

    public MessageMapper getMessageMapper() {
        return messageMapper;
    }
}
