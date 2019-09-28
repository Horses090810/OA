package cn.dao;

import cn.entity.Operatelog;

import java.util.List;
import java.util.Map;

public interface OperatelogMapper {
    Operatelog selectByPrimaryKey(Integer operateid);

    List<Operatelog> findOperatelogAll(Map<String,Object> map);

    Integer operateCount(Map<String,Object> map);

    void operateAdd(Operatelog operatelog);
}