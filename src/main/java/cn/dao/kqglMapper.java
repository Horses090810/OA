package cn.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface kqglMapper {

    public List<Map> showAll(@Param("page") int page,@Param("limit") int limit);

    public  Integer selTotal();

    public  List<Map> inquire(@Param("page") int page,@Param("limit") int limit,@Param("map")Map condition);

    public List<Map> showAll1(@Param("page") int page,@Param("limit") int limit);

    public  Integer selTotal1();

    public  List<Map> inquire1(@Param("page") int page,@Param("limit") int limit,@Param("map")Map condition);

    public List<Map> selectAll();

    public List<Map> selectqd(@Param("name") String name);

    public int  addqd(@Param("map") Map term);

    public int  addqt(@Param("map") Map term);



}
