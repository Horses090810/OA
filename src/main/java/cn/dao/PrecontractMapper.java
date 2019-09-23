package cn.dao;

import cn.entity.Precontract;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PrecontractMapper {
    Precontract selectByPrimaryKey(Integer precontractid);

    void addPrecontract(@Param("scheduleid") Integer scheduleid,@Param("userid") Integer userid);

    List<Map<String,Object>> selectByscheduleid(Integer scheduleid);

    void delperson(@Param("scheduleid") Integer scheduleid,@Param("userid") Integer userid);

}