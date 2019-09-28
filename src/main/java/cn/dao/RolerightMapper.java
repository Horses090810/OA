package cn.dao;

import cn.entity.Roleright;

public interface RolerightMapper {
    Roleright selectByPrimaryKey(Integer rolerightid);

    void rolerightdel(Integer roleid);

    void rolerightadd(Roleright roleright);
}