package cn.service;

import cn.entity.Loginlog;
import cn.entity.Operatelog;
import cn.entity.Roleinfo;
import cn.entity.Roleright;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/28
 * 描述
 */
public interface systemService {

    List<Roleinfo> findRoleAll();

    void roleinfoadd(Roleinfo roleinfo);

    void roleinfoupdate(Roleinfo roleinfo);

    void roleinfodel(Integer roleid);

    void rolerightdel(Integer roleid);

    void rolerightadd(Roleright roleright);

    List<Loginlog> findLoginlogAll();

    void loginlogAdd(Loginlog loginlog);

    List<Loginlog> selectLoginlog(Map<String,Object> map);

    Integer loginlogcount(Map<String,Object> map);

    List<Operatelog> findOperatelogAll(Map<String,Object> map);

    Integer operateCount(Map<String,Object> map);

    void operateAdd(Operatelog operatelog);
}
