package cn.service;

import cn.entity.Userinfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/3
 * 描述
 */
public interface UserinfoService {

    Userinfo selectByUname(String username);

    List<Map<String,Object>> selectJurisdictionByUid(String userid);

}
