package cn.dao;

import cn.entity.Branchinfo;
import cn.util.Pagetion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BranchinfoMapper {
    Branchinfo selectByPrimaryKey(Integer branchid);

    List<Branchinfo> findByBranchinfo(@Param("page") Pagetion<Branchinfo> page,@Param("pageNo") Integer pageNo);

    Integer findByBranchinfoCount();

    void branchinfoUpdate(@Param("branchinfo") Branchinfo branchinfo);

    void branchinfoAdd(@Param("branchinfo") Branchinfo branchinfo);

    void branchinfoDel(@Param("branchid") Integer branchid);

    List<Branchinfo> selectAll();
}