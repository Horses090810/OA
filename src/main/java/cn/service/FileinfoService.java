package cn.service;

import cn.entity.Accessoryfile;
import cn.entity.Fileinfo;

import java.util.List;
import java.util.Map;

public interface FileinfoService {
  List<Map> findWj(int id);

  List<Map> findIdWj(int id);

  List<Map> findIdWjs(int id);

  List<Map> findFjId(String id);

  List<Map> findFu();

  void addFu(Accessoryfile a);

  void del();

  void upWjId();

  void upId(Integer id);

  void delId();

  void upIdAc();

  List<Map> findHsz();

  void upHyId(String id);

  void delFId(String id);

  void delHyId(String id);

  void upAcId(String id);

  List<Map> findTj(Map map);

  Map findId(String id);

  void add(Fileinfo f);

  void up(Fileinfo f);
}
