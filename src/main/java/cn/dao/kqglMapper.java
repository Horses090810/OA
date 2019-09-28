package cn.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface kqglMapper {

    public List<Map> showAll(@Param("page") int page,@Param("limit") int limit);

    public  Integer selTotal();



}
