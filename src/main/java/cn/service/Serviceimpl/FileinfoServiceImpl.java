package cn.service.Serviceimpl;

import cn.dao.FileinfoMapper;
import cn.entity.Accessoryfile;
import cn.entity.Fileinfo;
import cn.service.FileinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** @Author: songshiwen @Date: 2019/9/1919:42 @Description: */
@Service
public class FileinfoServiceImpl implements FileinfoService {
  @Autowired private FileinfoMapper fileinfoMapper;

  @Override
  public List<Map> findIdWj(int id) {
    return fileinfoMapper.findIdWj(id);
  }

  @Override
  public void add(Fileinfo f) {
    fileinfoMapper.add(f);
  }

  @Override
  public void delFId(String id) {
    fileinfoMapper.delFId(id);
  }

  @Override
  public void upHyId(String id) {
    fileinfoMapper.upHyId(id);
  }

  @Override
  public List<Map> findTj(Map map) {
    return fileinfoMapper.findTj(map);
  }

  @Override
  public void delHyId(String id) {
    System.out.println("*******************" + id);
    Map ss = ss(id);
    System.err.println(ss.toString());
    for (Object s : ss.keySet()) {
      fileinfoMapper.delHyId(s.toString());
    }
    System.out.println("*******************");
  }

  Map sss = new HashMap();

  private Map ss(String id) {
    sss.put(id, id);
    List<Map> ss = fileinfoMapper.sel(id);
    for (Map s : ss) {

      ss(s.get("fileid").toString());
    }
    return sss;
  }

  @Override
  public List<Map> findHsz() {
    return fileinfoMapper.findHsz();
  }

  @Override
  public void upIdAc() {
    fileinfoMapper.upIdAc();
  }

  @Override
  public void delId() {
    fileinfoMapper.delId();
  }

  @Override
  public void upAcId(String id) {
    fileinfoMapper.upAcId(id);
  }

  @Override
  public void up(Fileinfo f) {
    System.err.println(f.getFiletype());
    fileinfoMapper.up(f);
  }

  @Override
  public List<Map> findFu() {
    return fileinfoMapper.findFu();
  }

  @Override
  public void del() {
    fileinfoMapper.del();
  }

  @Override
  public void upWjId() {
    String id = fileinfoMapper.findZh();
    fileinfoMapper.upId(Integer.parseInt(id));
  }

  @Override
  public void upId(Integer id) {
    fileinfoMapper.upId(id);
  }

  @Override
  public void addFu(Accessoryfile a) {
    fileinfoMapper.addFu(a);
  }

  @Override
  public Map findId(String id) {
    Map id1 = fileinfoMapper.findId(id);
    return id1;
  }

  @Override
  public List<Map> findFjId(String id) {
    return fileinfoMapper.findFjId(id);
  }

  @Override
  public List<Map> findIdWjs(int id) {
    return fileinfoMapper.findIdWjs(id);
  }

  @Override
  public List<Map> findWj(int id) {
    List<Map> list = fileinfoMapper.findWj(id);
    for (Map s : list) {
      s.put("name", "\"" + s.get("name") + "\"");
      s.put("filepath", "\"" + s.get("filepath") + "\"");
    }
    return list;
  }
}
