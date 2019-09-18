package cn.dao;

import cn.entity.Fileinfo;

public interface FileinfoMapper {
    Fileinfo selectByPrimaryKey(Integer fileid);
}