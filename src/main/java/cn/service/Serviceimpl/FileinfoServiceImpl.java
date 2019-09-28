package cn.service.Serviceimpl;

import cn.dao.FileinfoMapper;
import cn.service.FileinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/** @Author: songshiwen @Date: 2019/9/1919:42 @Description: */
@Service
public class FileinfoServiceImpl implements FileinfoService {
  @Autowired private FileinfoMapper fileinfoMapper;

  @Override
  public List<Map> findIdWj(int id) {
    List<Map> list = fileinfoMapper.findIdWj(id);
    for (Map l : list) {
      for (Object s : l.keySet()) {
        l.put(s, "\"" + l.get(s) + "\"");
      }
    }
    return list;
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
