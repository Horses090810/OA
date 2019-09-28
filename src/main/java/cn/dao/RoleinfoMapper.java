package cn.dao;

import cn.entity.Roleinfo;

import java.util.List;

public interface RoleinfoMapper {
    Roleinfo selectByPrimaryKey(Integer roleid);

    List<Roleinfo> findRoleAll();

    void roleinfoadd(Roleinfo roleinfo);

    void roleinfoupdate(Roleinfo roleinfo);

    void roleinfodel(Integer roleid);
}