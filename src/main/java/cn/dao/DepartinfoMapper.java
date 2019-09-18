package cn.dao;

import cn.entity.Departinfo;
import cn.util.Pagetion;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface DepartinfoMapper {
    Departinfo selectByPrimaryKey(Integer departid);

    List<Map<String,Object>> findDepartinfo(@Param("page")Pagetion<Map<String,Object>> page);

    Integer findByDepartinfoCount(@Param("map")Map<String,Object> map);

    List<Departinfo> findDepartBybranchid(@Param("branchid") Integer branchid);

    void departAdd(@Param("map") Map<String,Object> map);

    void departUpdate(@Param("map") Map<String,Object> map);

    void departDel(@Param("departid") Integer departid);

    List<Departinfo> findDepartAll();
}