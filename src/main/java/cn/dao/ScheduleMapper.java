package cn.dao;

import cn.entity.Schedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ScheduleMapper {
    Map<String,Object> selectByPrimaryKey(Integer scheduleid);

    Integer addCalendar(Map<String,Object> map);

    List<Schedule> findMyCalendar(@Param("createuser") Integer createuser);

    void updateCalendar(Map<String,Object> map);

    void delCalentar(Integer scheduleid);
}