package cn.web;

import cn.entity.Branchinfo;
import cn.entity.Departinfo;
import cn.entity.Userinfo;
import cn.service.PersonnelServiece;
import cn.util.Pagetion;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import sun.security.provider.MD5;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/4
 * 描述
 */
@Controller
public class PersonnelController {

    @Autowired
    private PersonnelServiece personnelServiece;

    @Autowired
    private HttpServletRequest request;


    /**
     * 条件查询所有机构
     *
     * @return
     */
    @RequestMapping("branchinfo")
    public String branchinfo(Model model, String branchname, String branchshortname, String pageNo) {
        //声明一个分页类
        Pagetion<Branchinfo> pagetion = new Pagetion<>();
        if (pageNo == null || pageNo == "") {
            pagetion.setPageNo(1);
        } else {
            pagetion.setPageNo(Integer.parseInt(pageNo));
        }

        //获取修改的页数，赋值
        String pageNumber = (String) request.getSession().getAttribute("pageNumber");
        if (pageNumber != null && pageNumber != "") {
            pagetion.setPageNo(Integer.parseInt(pageNumber));
        }
        //移除session
        request.getSession().removeAttribute("pageNumber");

        Branchinfo branchinfo = new Branchinfo();
        branchinfo.setBranchname(branchname);
        branchinfo.setBranchshortname(branchshortname);

        pagetion.setT(branchinfo);

        Integer count = personnelServiece.findByBranchinfoCount();
        pagetion.setTotle(count);

        //是否添加，则显示最后一页
        String branchinfoadd = (String) request.getSession().getAttribute("branchinfoadd");
        if (branchinfoadd != null && branchinfoadd != "") {
            pagetion.setPageNo(pagetion.getPageCount());
        }
        //移除session
        request.getSession().removeAttribute("branchinfoadd");

        List<Branchinfo> list = personnelServiece.findBranchinfo(pagetion);
        pagetion.setList(list);

        model.addAttribute("page", pagetion);
        return "/personnel/branchinfo";
    }

    /**
     * 修改机构
     *
     * @param branchid        机构id
     * @param branchname      机构名称
     * @param branchshortname 机构简称
     * @return
     */
    @RequestMapping("branchinfoUpdate")
    public String branchinfoUpdate(String branchid, String branchname, String branchshortname, String pageNumber) {
        Branchinfo branchinfo = new Branchinfo(Integer.parseInt(branchid), branchname, branchshortname);
        personnelServiece.branchinfoUpdate(branchinfo);
        request.getSession().setAttribute("pageNumber", pageNumber);
        return "redirect:/branchinfo.do";
    }

    /**
     * 添加机构
     *
     * @param branchname      机构名称
     * @param branchshortname 机构简称
     * @return
     */
    @RequestMapping("branchinfoAdd")
    public String branchinfoAdd(String branchname, String branchshortname) {
        Branchinfo branchinfo = new Branchinfo(branchname, branchshortname);
        personnelServiece.branchinfoAdd(branchinfo);
        request.getSession().setAttribute("branchinfoadd", "add");
        return "redirect:/branchinfo.do";
    }

    /**
     * 删除机构
     *
     * @param branchid 机构id
     * @return
     */
    @RequestMapping("branchinfoDel/{branchid}")
    public String branchinfoDel(@PathVariable("branchid") String branchid) {
        personnelServiece.branchinfoDel(Integer.parseInt(branchid));
        return "redirect:/branchinfo.do";
    }

    /**
     * 天剑查询部门信息
     * @param model
     * @param departname 部门名称
     * @param principaluser 部门负责人
     * @param pageNo 页数
     * @return
     */
    @RequestMapping("departinfo")
    public String departinfo(Model model,String departname, String principaluser, String pageNo) {
        //声明一个分页类
        Pagetion<Map<String,Object>> pagetion = new Pagetion<>();

        if(pageNo==null || pageNo==""){
            pagetion.setPageNo(1);
        }else{
            pagetion.setPageNo(Integer.parseInt(pageNo));
        }

        //获取修改的页数，赋值
        String pageNumber = (String) request.getSession().getAttribute("pageNumber");
        if (pageNumber != null && pageNumber != "") {
            pagetion.setPageNo(Integer.parseInt(pageNumber));
        }
        //移除session
        request.getSession().removeAttribute("pageNumber");

        Map<String,Object> map = new HashMap<>();
        map.put("departname",departname);
        map.put("principaluser",principaluser);
        pagetion.setT(map);

        Integer count = personnelServiece.findByDepartinfoCount(map);
        pagetion.setTotle(count);

        //是否添加，则显示最后一页
        String branchinfoadd = (String) request.getSession().getAttribute("branchinfoadd");
        if (branchinfoadd != null && branchinfoadd != "") {
            pagetion.setPageNo(pagetion.getPageCount());
        }
        //移除session
        request.getSession().removeAttribute("branchinfoadd");

        List<Map<String,Object>> list = personnelServiece.findDepartinfo(pagetion,principaluser);
        pagetion.setList(list);

        model.addAttribute("page", pagetion);
        return "/personnel/departinfo";
    }

    /**
     * 查询选择信息
     * @param model
     * @param msg
     * @return
     */
    @RequestMapping("findMessage")
    public String findMessage(Model model,@RequestParam Map<String,Object> msg){
        System.out.println(msg.size());
        if(msg.size()!=0){
            System.out.println(msg);
            String pageNumber=msg.get("pageNumber").toString();
            request.getSession().setAttribute("pageNumber", pageNumber);
            model.addAttribute("msg",msg);
        }
        List<Branchinfo> branchinfos = personnelServiece.selectAll();
        Map<String,Object> map = new HashMap<>();
        for (Branchinfo branchinfo : branchinfos) {
            synchronized (this){
                Map<String,Object> map2 = new HashMap<>();
                List<Departinfo> list = personnelServiece.findDepartBybranchid(branchinfo.getBranchid());
                for (Departinfo departinfo : list) {
                    synchronized (this){
                        List<Userinfo> userinfos = personnelServiece.findUserinfoBydepartid(departinfo.getDepartid());
                        map2.put(departinfo.getDepartname(),userinfos);
                    }
                }
                map.put(branchinfo.getBranchname(),map2);
            }
        }
        model.addAttribute("map",map);
        model.addAttribute("branchinfos",branchinfos);
        return "/personnel/departAddorUpdate";
    }

    /**
     * 部门添加
     * @param map
     * @return
     */
    @RequestMapping("departAdd")
    public String departAdd(@RequestParam Map<String,Object> map){
        personnelServiece.departAdd(map);
        request.getSession().setAttribute("branchinfoadd", "add");
        return "redirect:/departinfo.do";
    }

    /**
     * 部门修改
     */
    @RequestMapping("departUpdate")
    public String departUpdate(@RequestParam Map<String,Object> map){
        personnelServiece.departUpdate(map);
        return "redirect:/departinfo.do";
    }

    @RequestMapping("departDel/{departid}")
    public String departDel(@PathVariable("departid") String departid){
        personnelServiece.departDel(departid);
        return "redirect:/departinfo.do";
    }

    @RequestMapping("employee")
    public String employee(Model model,String username,String pageNo){
        //声明一个分页类
        Pagetion<Map<String,Object>> pagetion = new Pagetion<>();

        if(pageNo==null || pageNo==""){
            pagetion.setPageNo(1);
        }else{
            pagetion.setPageNo(Integer.parseInt(pageNo));
        }

        //获取修改的页数，赋值
        String pageNumber = (String) request.getSession().getAttribute("pageNumber");
        if (pageNumber != null && pageNumber != "") {
            pagetion.setPageNo(Integer.parseInt(pageNumber));
        }
        //移除session
        request.getSession().removeAttribute("pageNumber");

        Map<String,Object> map = new HashMap<>();
        map.put("username",username);
        pagetion.setT(map);

        Integer count = personnelServiece.findUserCount(map);
        pagetion.setTotle(count);

        //是否添加，则显示最后一页
        String branchinfoadd = (String) request.getSession().getAttribute("branchinfoadd");
        if (branchinfoadd != null && branchinfoadd != "") {
            pagetion.setPageNo(pagetion.getPageCount());
        }
        //移除session
        request.getSession().removeAttribute("branchinfoadd");

        List<Map<String,Object>> list = personnelServiece.findUser(pagetion);
        pagetion.setList(list);

        model.addAttribute("page", pagetion);
        return "/personnel/userinfo";
    }

    @RequestMapping("details")
    public String details(Model model,@RequestParam Map<String,Object> msg){
        if(msg.size()!=0){
            String pageNumber=msg.get("pageNumber").toString();
            request.getSession().setAttribute("pageNumber", pageNumber);
            model.addAttribute("msg",msg);
        }
        List<Departinfo> departinfos = personnelServiece.findDepartAll();
        model.addAttribute("departinfos",departinfos);
        return "/personnel/userinfoAddorUpdate";
    }

    @RequestMapping("userinfoAdd")
    public String userinfoAdd(@RequestParam Map<String,Object> map){
        Md5Hash md5 = new Md5Hash(map.get("password").toString(),"kh",3);
        map.put("password",md5.toString());
        System.out.println("$$$$$$$$$$$"+map.get("departid").toString());
        personnelServiece.userinfoAdd(map);
        request.getSession().setAttribute("branchinfoadd","add");
        return "redirect:/employee.do";
    }

    @RequestMapping("userinfoUpdate")
    public String userinfoUpdate(@RequestParam Map<String,Object> map){
//        Md5Hash md5 = new Md5Hash(map.get("password").toString(),"kh",3);
//        map.put("password",md5.toString());
        personnelServiece.userinfoUpdate(map);
        return "redirect:/employee.do";
    }

    @RequestMapping("userinfoDel/{userid}/{username}")
    public String userinfoDel(@PathVariable("userid") String userid,
                              @PathVariable("username") String username){
        personnelServiece.userinfoDel(Integer.parseInt(userid));

        //删除头像
        String path = request.getSession().getServletContext().getRealPath("/upload");
        //System.out.println(username);
        //System.out.println(path);
        File file = new File(path,username+".jpg");
        //System.out.println(file.getAbsolutePath());
        file.delete();
        return "redirect:/employee.do";
    }
}
