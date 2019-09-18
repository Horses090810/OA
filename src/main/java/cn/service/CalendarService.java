package cn.service;

import cn.entity.Precontract;
import cn.entity.Schedule;

import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/17
 * 描述
 */
public interface CalendarService {
    Integer addCalendar(Map<String,Object> map);

    void addPrecontract(Integer scheduleid,Integer userid);

    void delperson(Integer scheduleid,Integer userid);

    List<Schedule> findMyCalendar(Integer createuser);

    Map<String,Object> selectByPrimaryKey(Integer scheduleid);

    List<Map<String,Object>> selectByscheduleid(Integer scheduleid);

    void updateCalendar(Map<String,Object> map);

    void delCalentar(Integer scheduleid);
}
