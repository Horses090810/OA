package cn.dao;

import cn.entity.Loginlog;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface LoginlogMapper {
    Loginlog selectByPrimaryKey(Integer loginid);

    List<Loginlog> findLoginlogAll();

    void loginlogAdd(Loginlog loginlog);

    List<Loginlog> selectLoginlog(Map<String,Object> map);

    Integer loginlogcount(Map<String,Object> map);
}