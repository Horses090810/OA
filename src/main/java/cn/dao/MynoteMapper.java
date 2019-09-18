package cn.dao;

import cn.entity.Mynote;

public interface MynoteMapper {
    Mynote selectByPrimaryKey(Integer noteid);
}