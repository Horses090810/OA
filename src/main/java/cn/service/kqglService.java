package cn.service;

import java.util.List;
import java.util.Map;

public interface kqglService {

    public List<Map> showAll(int page, int limit);

    public  Integer selTotal();
}
