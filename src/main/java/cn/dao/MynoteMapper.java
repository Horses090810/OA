package cn.dao;

import cn.entity.Mynote;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MynoteMapper {
    Mynote selectByPrimaryKey(Integer noteid);
    List<Map> findId(@Param("id") int id);
    Map findBwId(@Param("id") String id);
    void add(Mynote my);
    void uq(Mynote my);
    void del(@Param("id") String id);
        List<Map> find();
        List<Map> finds(@Param("id") Integer id);
    List<Map> findTj(Map map);
}