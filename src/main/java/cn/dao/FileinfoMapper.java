package cn.dao;

import cn.entity.Fileinfo;

import java.util.List;
import java.util.Map;

public interface FileinfoMapper {
  Fileinfo selectByPrimaryKey(Integer fileid);

  List<Map> findWj(int id);

  List<Map> findIdWj(int id);
}
