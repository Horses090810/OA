package cn.dao;

import cn.entity.Message;

public interface MessageMapper {
    Message selectByPrimaryKey(Integer messageid);
}