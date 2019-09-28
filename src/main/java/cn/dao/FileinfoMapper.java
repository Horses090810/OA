package cn.dao;

import cn.entity.Accessoryfile;
import cn.entity.Fileinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface FileinfoMapper {
  Fileinfo selectByPrimaryKey(Integer fileid);

  List<Map> findWj(int id);

  List<Map> findFjId(@Param("id") String id);

  List<Map> findIdWj(int id);

  List<Map> findIdWjs(int id);

  List<Map> findFu();

  Map findId(@Param("id") String id);

  void del();

  void add(Fileinfo f);

  void up(Fileinfo f);

  void addFu(Accessoryfile a);

  void upId(Integer id);

  String findZh();

  void delId();

  void upIdAc();

  void delFId(@Param("id") String id);

  List<Map> findHsz();

  void upHyId(@Param("id") String id);

  void delHyId(@Param("id") String id);

  List<Map> sel(@Param("id") String id);

  void upAcId(@Param("id") String id);

  List<Map> findTj(Map map);
}
