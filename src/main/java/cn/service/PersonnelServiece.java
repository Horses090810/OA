package cn.service;

import cn.entity.Branchinfo;
import cn.entity.Departinfo;
import cn.entity.Userinfo;
import cn.util.Pagetion;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/5
 * 描述
 */
public interface PersonnelServiece {

    List<Branchinfo> findBranchinfo(Pagetion<Branchinfo> pagetion);

    Integer findByBranchinfoCount();

    void branchinfoUpdate(Branchinfo branchinfo);

    void branchinfoAdd(Branchinfo branchinfo);

    void branchinfoDel(Integer branchid);

    List<Map<String,Object>> findDepartinfo(Pagetion<Map<String,Object>> pagetion,String principaluser);

    Integer findByDepartinfoCount(Map<String,Object> map);

    List<Branchinfo> selectAll();

    List<Departinfo> findDepartBybranchid(@Param("branchid") Integer branchid);

    List<Userinfo> findUserinfoBydepartid(@Param("departid") Integer departid);

    void departAdd(Map<String,Object> map);

    void departUpdate(Map<String,Object> map);

    void departDel(String departid);

    List<Map<String,Object>> findUser(@Param("page") Pagetion<Map<String,Object>> page);

    Integer findUserCount(@Param("map") Map<String,Object> map);

    void userinfoAdd(Map<String,Object> map);

    List<Departinfo> findDepartAll();

    void userinfoUpdate(Map<String,Object> map);

    void userinfoDel(Integer userid);

}
