package cn.dao;

import cn.entity.Operatelog;

public interface OperatelogMapper {
    Operatelog selectByPrimaryKey(Integer operateid);
}