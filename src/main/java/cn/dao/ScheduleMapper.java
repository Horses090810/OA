package cn.dao;

import cn.entity.Schedule;
import cn.util.Pagetion;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ScheduleMapper {
    Map<String,Object> selectByPrimaryKey(Integer scheduleid);

    Integer addCalendar(Map<String,Object> map);

    List<Schedule> findMyCalendar(@Param("createuser") Integer createuser);

    void updateCalendar(Map<String,Object> map);

    void delCalentar(Integer scheduleid);

    List<Map<String,Object>> finddepartCalendar(@Param("page")Pagetion<Map<String,Object>> page);

    Integer finddepartCalendarCount(@Param("page")Pagetion<Map<String,Object>> page);
}