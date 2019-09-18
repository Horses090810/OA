package cn.dao;

import cn.entity.Userinfo;
import cn.util.Pagetion;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserinfoMapper {
    Userinfo selectByPrimaryKey(Integer userid);

    Userinfo selectByUname(String username);

    List<Map<String,Object>> selectJurisdictionByUid(String userid);

    List<Userinfo> findUserinfoBydepartid(@Param("departid") Integer departid);

    List<Map<String,Object>> findUser(@Param("page") Pagetion<Map<String,Object>> page);

    Integer findUserCount(@Param("map") Map<String,Object> map);

    void userinfoAdd(@Param("map") Map<String,Object> map);

    void userinfoUpdate(@Param("map") Map<String,Object> map);

    void userinfoDel(@Param("userid") Integer userid);
}