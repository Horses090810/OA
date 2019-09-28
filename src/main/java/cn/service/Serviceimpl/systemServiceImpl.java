package cn.service.Serviceimpl;

import cn.dao.LoginlogMapper;
import cn.dao.OperatelogMapper;
import cn.dao.RoleinfoMapper;
import cn.dao.RolerightMapper;
import cn.entity.Loginlog;
import cn.entity.Operatelog;
import cn.entity.Roleinfo;
import cn.entity.Roleright;
import cn.service.systemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/28
 * 描述
 */
@Service
public class systemServiceImpl implements systemService {

    @Autowired
    private RoleinfoMapper roleinfoMapper;

    @Autowired
    private RolerightMapper rolerightMapper;

    @Autowired
    private LoginlogMapper loginlogMapper;

    @Autowired
    private OperatelogMapper operatelogMapper;

    @Override
    public List<Roleinfo> findRoleAll() {
        return roleinfoMapper.findRoleAll();
    }

    @Override
    public void roleinfoadd(Roleinfo roleinfo) {
        roleinfoMapper.roleinfoadd(roleinfo);
    }

    @Override
    public void roleinfoupdate(Roleinfo roleinfo) {
        roleinfoMapper.roleinfoupdate(roleinfo);
    }

    @Override
    public void roleinfodel(Integer roleid) {
        roleinfoMapper.roleinfodel(roleid);
    }

    @Override
    public void rolerightdel(Integer roleid) {
        rolerightMapper.rolerightdel(roleid);
    }

    @Override
    public void rolerightadd(Roleright roleright) {
        rolerightMapper.rolerightadd(roleright);
    }

    @Override
    public List<Loginlog> findLoginlogAll() {
        return loginlogMapper.findLoginlogAll();
    }

    @Override
    public void loginlogAdd(Loginlog loginlog) {
        loginlogMapper.loginlogAdd(loginlog);
    }

    @Override
    public List<Loginlog> selectLoginlog(Map<String, Object> map) {
        return loginlogMapper.selectLoginlog(map);
    }

    @Override
    public Integer loginlogcount(Map<String, Object> map) {
        return loginlogMapper.loginlogcount(map);
    }

    @Override
    public List<Operatelog> findOperatelogAll(Map<String,Object> map) {
        return operatelogMapper.findOperatelogAll(map);
    }

    @Override
    public Integer operateCount(Map<String, Object> map) {
        return operatelogMapper.operateCount(map);
    }

    @Override
    public void operateAdd(Operatelog operatelog) {
        operatelogMapper.operateAdd(operatelog);
    }
}
