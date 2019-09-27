package cn.service.Serviceimpl;

import cn.dao.kqglMapper;
import cn.service.kqglService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.rmi.MarshalledObject;
import java.util.List;
import java.util.Map;
@Service
public class kqglServiceImpl implements kqglService {
    @Autowired
    private kqglMapper kqglMapper;

    @Override
    public List<Map> showAll(int page, int limit) {
        return kqglMapper.showAll(page,limit);
    }

    @Override
    public Integer selTotal() {
        return kqglMapper.selTotal();
    }

    @Override
    public List<Map> inquire(int page, int limit, Map condition) {
        return kqglMapper.inquire(page, limit, condition);
    }



    @Override
    public List<Map> showAll1(int page, int limit) {
        return kqglMapper.showAll1(page,limit);
    }

    @Override
    public Integer selTotal1() {
        return kqglMapper.selTotal1();
    }

    @Override
    public List<Map> inquire1(int page, int limit, Map condition) {
        return kqglMapper.inquire1(page, limit, condition);
    }

    @Override
    public List<Map> selectAll() {
        return (List<Map>) kqglMapper.selectAll();
    }

    @Override
    public List<Map> selectqd(String name)
    {
        return kqglMapper.selectqd(name);
    }


    @Override
    public List<Map> selectqt(String name)
    {
        return kqglMapper.selectqt(name);
    }

    @Override
    public boolean  addqd(Map term) {
        if (kqglMapper.addqd(term)>0){
            return true;
        }else {
            return  false;
        }

    }

    @Override
    public boolean  addqt(Map term) {
        if (kqglMapper.addqt(term)>0){
            return true;
        }else {
            return  false;
        }

    }


}
