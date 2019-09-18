package cn.service.Serviceimpl;

import cn.dao.PrecontractMapper;
import cn.dao.ScheduleMapper;
import cn.entity.Precontract;
import cn.entity.Schedule;
import cn.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/17
 * 描述
 */
@Service
public class CalendarServiceImpl implements CalendarService {

    @Autowired
    private ScheduleMapper scheduleMapper;

    @Autowired
    private PrecontractMapper precontractMapper;

    @Override
    public Integer addCalendar(Map<String, Object> map) {
        map.put("scheduleid",0);
        scheduleMapper.addCalendar(map);
        Integer scheduleid=Integer.parseInt(map.get("scheduleid").toString());
        return scheduleid;
    }

    @Override
    public void addPrecontract(Integer scheduleid, Integer userid) {
        precontractMapper.addPrecontract(scheduleid,userid);
    }

    @Override
    public List<Schedule> findMyCalendar(Integer createuser) {
        List<Schedule> list = scheduleMapper.findMyCalendar(createuser);
        return list;
    }

    @Override
    public Map<String, Object> selectByPrimaryKey(Integer scheduleid) {
        return scheduleMapper.selectByPrimaryKey(scheduleid);
    }

    @Override
    public List<Map<String,Object>> selectByscheduleid(Integer scheduleid) {
        return precontractMapper.selectByscheduleid(scheduleid);
    }

    @Override
    public void delperson(Integer scheduleid, Integer userid) {
        precontractMapper.delperson(scheduleid,userid);
    }
}
