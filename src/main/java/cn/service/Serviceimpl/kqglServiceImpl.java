package cn.service.Serviceimpl;

import cn.dao.kqglMapper;
import cn.service.kqglService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    //查询所有的部门信息

}
