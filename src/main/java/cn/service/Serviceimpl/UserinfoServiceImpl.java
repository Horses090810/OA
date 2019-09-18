package cn.service.Serviceimpl;

import cn.dao.UserinfoMapper;
import cn.entity.Userinfo;
import cn.service.UserinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/3
 * 描述
 */
@Service
public class UserinfoServiceImpl implements UserinfoService {

    @Autowired
    private UserinfoMapper userinfoMapper;

    @Override
    public Userinfo selectByUname(String username) {
        return userinfoMapper.selectByUname(username);
    }

    @Override
    public List<Map<String, Object>> selectJurisdictionByUid(String userid) {
        return userinfoMapper.selectJurisdictionByUid(userid);
    }
}
