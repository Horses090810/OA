package cn.service.Serviceimpl;

import cn.dao.BranchinfoMapper;
import cn.dao.DepartinfoMapper;
import cn.dao.UserinfoMapper;
import cn.entity.Branchinfo;
import cn.entity.Departinfo;
import cn.entity.Userinfo;
import cn.service.PersonnelServiece;
import cn.util.Pagetion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/5
 * 描述
 */
@Service
public class PersonnelServiceImpl implements PersonnelServiece {

    @Autowired
    private BranchinfoMapper branchinfoMapper;

    @Autowired
    private DepartinfoMapper departinfoMapper;

    @Autowired
    private UserinfoMapper userinfoMapper;


    /**
     * 查询多有机构
     * @param pagetion
     * @return
     */
    @Override
    public List<Branchinfo> findBranchinfo(Pagetion<Branchinfo> pagetion) {
        int pageNo=(pagetion.getPageNo()-1)*pagetion.getPageSize();
        return branchinfoMapper.findByBranchinfo(pagetion,pageNo);
    }

    /**
     * 查询机构数量
     * @return
     */
    @Override
    public Integer findByBranchinfoCount() {
        return branchinfoMapper.findByBranchinfoCount();
    }

    /**
     * 修改机构
     * @param branchinfo
     */
    @Override
    public void branchinfoUpdate(Branchinfo branchinfo) {
        branchinfoMapper.branchinfoUpdate(branchinfo);
    }

    /**
     * 添加机构
     * @param branchinfo
     */
    @Override
    public void branchinfoAdd(Branchinfo branchinfo) {
        branchinfoMapper.branchinfoAdd(branchinfo);
    }

    /**
     * 删除机构
     * @param branchid
     */
    @Override
    public void branchinfoDel(Integer branchid) {
        branchinfoMapper.branchinfoDel(branchid);
    }

    /**
     * 查询所有部门
     * @param pagetion
     * @param principaluser
     * @return
     */
    public List<Map<String,Object>> findDepartinfo(Pagetion<Map<String,Object>> pagetion,String principaluser){
        Integer pageNo = (pagetion.getPageNo() - 1) * pagetion.getPageSize();
        pagetion.getT().put("pageNo",pageNo);
        return departinfoMapper.findDepartinfo(pagetion);
    }

    /**
     * 查询部门数量
     * @param map
     * @return
     */
    @Override
    public Integer findByDepartinfoCount(Map<String,Object> map) {
        return departinfoMapper.findByDepartinfoCount(map);
    }

    /**
     * 查询所有的机构
     * @return
     */
    @Override
    public List<Branchinfo> selectAll() {
        return branchinfoMapper.selectAll();
    }

    /**
     * 通过该机构的部门
     * @param branchid
     * @return
     */
    @Override
    public List<Departinfo> findDepartBybranchid(Integer branchid) {
        return departinfoMapper.findDepartBybranchid(branchid);
    }

    /**
     * 查询该部门的人
     * @param departid
     * @return
     */
    @Override
    public List<Userinfo> findUserinfoBydepartid(Integer departid) {
        return userinfoMapper.findUserinfoBydepartid(departid);
    }

    /**
     * 添加部门
     * @param map
     */
    @Override
    public void departAdd(Map<String, Object> map) {
        departinfoMapper.departAdd(map);
    }

    /**
     * 修改部门
     * @param map
     */
    @Override
    public void departUpdate(Map<String, Object> map) {
        departinfoMapper.departUpdate(map);
    }

    /**
     * 删除部门
     * @param departid
     */
    @Override
    public void departDel(String departid) {
        departinfoMapper.departDel(Integer.parseInt(departid));
    }

    /**
     * 查询员工
     * @param page
     * @return
     */
    @Override
    public List<Map<String, Object>> findUser(Pagetion<Map<String,Object>> page) {
        Integer pageNo = (page.getPageNo() - 1) * page.getPageSize();
        page.getT().put("pageNo",pageNo);
        List<Map<String, Object>> list = userinfoMapper.findUser(page);
        return list;
    }

    @Override
    public Integer findUserCount(Map<String, Object> map) {
        return userinfoMapper.findUserCount(map);
    }

    @Override
    public void userinfoAdd(Map<String, Object> map) {
        userinfoMapper.userinfoAdd(map);
    }

    @Override
    public List<Departinfo> findDepartAll() {
        return departinfoMapper.findDepartAll();
    }

    @Override
    public void userinfoUpdate(Map<String, Object> map) {
        userinfoMapper.userinfoUpdate(map);
    }

    @Override
    public void userinfoDel(Integer userid) {
        userinfoMapper.userinfoDel(userid);
    }
}
