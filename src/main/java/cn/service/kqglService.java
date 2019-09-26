package cn.service;

import java.util.List;
import java.util.Map;

public interface kqglService {

    public List<Map> showAll(int page, int limit);

    public  Integer selTotal();

    List<Map> inquire(int page, int limit, Map condition);



    public List<Map> showAll1(int page, int limit);

    public  Integer selTotal1();

    List<Map> inquire1(int page, int limit, Map condition);


    List<Map> selectAll();

    List<Map> selectqd(String name);


    public  boolean  addqd( Map term);


    public  boolean  addqt( Map term);
}
