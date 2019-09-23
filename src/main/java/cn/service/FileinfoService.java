package cn.service;

import java.util.List;
import java.util.Map;

public interface FileinfoService {
  List<Map> findWj(int id);

  List<Map> findIdWj(int id);
}
