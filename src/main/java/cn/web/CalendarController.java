package cn.web;

import cn.entity.*;
import cn.service.CalendarService;
import cn.service.PersonnelServiece;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @创建人 柯皓
 * @创建时间 2019/9/16
 * 描述
 */
@Controller
public class CalendarController {

    @Autowired
    private PersonnelServiece personnelServiece;

    @Autowired
    private CalendarService calendarService;

    @Autowired
    private HttpSession session;

    @Autowired
    private ServletResponse response;

    /**
     * 进入我的日程安排
     * @param model
     * @return
     */
    @RequestMapping("mycalendar")
    public String mycalender(Model model){

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
        return "/calendar/mycalendar";
    }

    @PostMapping("addCalendar")
    public String addCalendar(@RequestParam Map<String,Object> map){
        for (String s : map.keySet()) {
            System.out.println(s+"\t"+map.get(s));
        }
        if(map.get("ifprivate")==null){
            map.put("ifprivate",0);
        }
        Integer scheduleid = calendarService.addCalendar(map);

        for (String s : map.keySet()) {
            synchronized (this){
                if(s.indexOf("-")!=-1){
                    calendarService.addPrecontract(scheduleid,Integer.parseInt(map.get(s).toString()));
                }
            }
        }

        return "redirect:/mycalendar.do";
    }


    @RequestMapping("findMyCalendar")
    //@ResponseBody
    public String findMyCalendar() throws Exception{
        response.setContentType("text/html;charset=utf-8");
        Userinfo userinfo = (Userinfo) session.getAttribute("userinfo");
        List<Schedule> list = calendarService.findMyCalendar(userinfo.getUserid());
        //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        List<Map<String,Object>> maps=new ArrayList<>();

        for (Schedule schedule : list) {
            Map<String,Object> map = new HashMap<>();
            map.put("groupId",schedule.getScheduleid());

            Date date = schedule.getBigintime();
            map.put("title",(date.getHours()>=10?date.getHours():"0"+date.getHours())
                    +":"+(date.getMinutes()>=10?date.getMinutes():"0"+date.getMinutes())+"  "+schedule.getTitle());
            map.put("start",schedule.getBigintime());
            map.put("end",schedule.getEndtime());
            map.put("color","orange");
            maps.add(map);
        }

        PrintWriter p = response.getWriter();
        p.write(JSON.toJSONStringWithDateFormat(maps,"yyyy-MM-dd"));
        p.flush();
        p.close();
        return "/calendar/mycalendar";
    }


    @RequestMapping("detailsCalendar")
    public String detailsCalendar(Integer groupId) throws Exception{
        response.setContentType("text/html;charset=utf-8");
        Map<String, Object> map = calendarService.selectByPrimaryKey(groupId);
        List<Map<String, Object>> precontracts = calendarService.selectByscheduleid(groupId);
        map.put("precontracts",precontracts);

        PrintWriter p = response.getWriter();
        p.write(JSON.toJSONStringWithDateFormat(map,"yyyy-MM-dd HH:mm:ss"));
        p.flush();
        p.close();
        return "/calendar/mycalendar";
    }

    @RequestMapping("addperson")
    @ResponseBody
    public String addperson(Integer userid,Integer scheduleid){
        calendarService.addPrecontract(scheduleid,userid);
        return "add";
    }

    @RequestMapping("delperson")
    @ResponseBody
    public String delperson(Integer userid,Integer scheduleid){
        calendarService.delperson(scheduleid,userid);
        return "del";
    }

    @RequestMapping("updateCalendar")
    public String updateCalendar(@RequestParam Map<String,Object> map){
        if(map.get("ifprivate")==null){
            map.put("ifprivate",0);
        }
        calendarService.updateCalendar(map);
        return "redirect:/mycalendar.do";
    }

    @RequestMapping("delCalentar")
    public String delCalentar(Integer scheduleid){
        calendarService.delCalentar(scheduleid);
        return "redirect:/mycalendar.do";
    }
}
