package cn.dao;

import cn.entity.Loginlog;

public interface LoginlogMapper {
    Loginlog selectByPrimaryKey(Integer loginid);
}